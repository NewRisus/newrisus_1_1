/*
    PHPost > Live
    Autor: JNeutron
    ::
    Notificaciones en vivo
*/
var live = {
    update_time: 30000,
    hide_time: 20000,
    status: {'nots': 'ON', 'mps' : 'ON', 'sound' : 'ON'},
    focus: true,
    n_total: 0,
    m_total: 0,
    inicializar: function(){
        // NOTIFICACIONES
        live.status['nots'] = $.cookie('live_nots')
        if(live.status['nots'] == null) $.cookie('live_nots', 'ON', {expires: 90})
        // MENSAJES
        live.status['mps'] = $.cookie('live_mps')
        if(live.status['mps'] == null) $.cookie('live_mps', 'ON', {expires: 90})
        // SONIDOS
        live.status['sound'] = $.cookie('live_sound')
        if(live.status['sound'] == null) $.cookie('live_sound', 'ON', {expires: 90})
        // SI NO MOSTRAREMOS NADA PARA QUE GASTAMOS RECURSOS :D
        if(live.status['nots'] == 'OFF' && live.status['mps'] == 'OFF')
            return true;
        // EN 30 SEGUNDOS HACE UPDATE POR AJAZ
        else 
            setTimeout(function(){ live.update(); }, live.update_time);
    },
    // CARGAR NOTIFICACIONES
    print: function(ld){
        // CARGAMOS EL CONTENIDO
        $('#js').html(ld);
        // OBTENEMOS TOTALES
        var n_total = parseInt($('#live-stream').attr('ntotal'));
        var m_total = parseInt($('#live-stream').attr('mtotal'));
        live.n_total = live.n_total + n_total;
        live.m_total = live.m_total + m_total; 
        var total_notis = live.n_total + live.m_total;
        //
        if(total_notis > 0){
            var live_stream_html = $('#live-stream').html();
            // CARGAMOS
            $('#BeeperBox').html(live_stream_html)
            // MOSTRAMOS
            $('.UIBeeper_Full').fadeIn(1200);
            $('#BeeperBox').slideToggle(1000);
            // EVENTOS 
            this.mouse_events();
            // SI ESTAMOS EN LA PAGINA VIENDO...
            if(live.focus == true){
                // OCULTO LAS NOTIFICACIONES
               setTimeout(function(){ live.hide(); }, live.hide_time);
            } else {
                // TITULO
                $(document).attr('title', global_data.s_title + ' (' + total_notis + ') - ' + global_data.s_slogan);
                // 
                var sound_type = (live.m_total > 0) ? 'newMessage' : 'newAlert';
                //
                if(live.status['sound'] == 'ON'){
                    $('#swf').html('<embed width="1px" height="1px" wmode="transparent" allowscriptaccess="always" quality="high" bgcolor="#ffffff" src="' + global_data.url + '/inc/ext/' + sound_type + '.swf" type="application/x-shockwave-flash">');
                }
                // GLOBITOS
                notifica.popup(live.n_total);
                mensaje.popup(live.m_total);
            }        
        }
        // OBTENEMOS MENSAJES
    },
    // ACTIVAR MOUSEOVER
    mouse_events: function(){
        $('.UIBeep').mouseover(function(){
            $(this).addClass('UIBeep_Selected');
            $(this).parent().parent().addClass('UIBeep_Paused');
        }).mouseout(function(){
            $(this).removeClass('UIBeep_Selected');
            $(this).parent().parent().removeClass('UIBeep_Paused')
            live.hide();
        })
    },
    // UPDATE
    update: function(){
        $('#loading').fadeIn(250);
		$.ajax({
			type: 'POST',
			url: global_data.url + '/live-stream.php',
            data: 'nots=' + live.status['nots'] + '&mps=' + live.status['mps'],
			success: function(h){
                live.print(h);
                $('#loading').fadeOut(350);
			},
			complete: function(){
				setTimeout(function(){ live.update(); }, live.update_time);
                $('#loading').fadeOut(350);
			}
		});
    },
    // OCULTAR NOTIFICACIONES
    hide: function(){
        var divs = $('.UIBeeper_Full')
        var total = divs.length;
        // ALGO RECURSIVO xD
        setTimeout(function() { 
            if(total > 0){
                if($(divs[0]).hasClass('UIBeep_Paused') == false) {
                    $(divs[0]).fadeOut().remove();
                    live.hide();
                }
            }
        }, 1000);
    },
    // SIN SONIDO
    ch_status: function(type){
        live.status[type] = (live.status[type] == 'ON') ? 'OFF' : 'ON';
        // NEVO
        $.cookie('live_' + type, live.status[type], {expires: 90});
    }
}
/* Jquery Cookies */
jQuery.cookie=function(e,i,o){if("undefined"==typeof i){var n=null;if(document.cookie&&""!=document.cookie)for(var r=document.cookie.split(";"),t=0;t<r.length;t++){var p=jQuery.trim(r[t]);if(p.substring(0,e.length+1)==e+"="){n=decodeURIComponent(p.substring(e.length+1));break}}return n}o=o||{},null===i&&(i="",o.expires=-1);var u="";if(o.expires&&("number"==typeof o.expires||o.expires.toUTCString)){var s;"number"==typeof o.expires?(s=new Date,s.setTime(s.getTime()+24*o.expires*60*60*1e3)):s=o.expires,u="; expires="+s.toUTCString()}var a=o.path?"; path="+o.path:"",c=o.domain?"; domain="+o.domain:"",m=o.secure?"; secure":"";document.cookie=[e,"=",encodeURIComponent(i),u,a,c,m].join("")};
// READY
$(document).ready(function(){
    //
    $('.beeper_x').on("click",function(){
        var bid = $(this).attr('bid');
        //
        $('#beep_' + bid).fadeOut().remove();
        //
        return false;
    });
    //
    live.inicializar();
    // NOS DICE SI MOSTRAR O NO :D
    $(window).focus(function(){
        live.focus = true;
        //live.hide();
    }).blur(function(){
        live.focus = false;
    })
});