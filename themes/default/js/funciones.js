/*
    T!Script > Funciones
    Autor: JNeutron
    ::
    Funciones extra agregadas al script.
*/
/* DENUNCIAS */
var denuncia = {
    nueva: function(type, obj_id, obj_title, obj_user){
        // PLANTILLA
		$('#loading').fadeIn(250); 
        $.ajax({
			type: 'POST',
			url: global_data.url + '/denuncia-' + type + '.php',
			data: 'obj_id=' + obj_id + '&obj_title=' + obj_title + '&obj_user=' + obj_user,
			success: function(h){
                denuncia.set_dialog(h, obj_id, type);
                $('#loading').fadeOut(350);                                 
			}
		});
    },
    set_dialog: function(html, obj_id, type){
        var d_title = 'Denunciar ' + type;
        // MYDIALOG
        mydialog.mask_close = false;
        mydialog.close_button = true;		                                        
		mydialog.show();
        mydialog.title(d_title);
		mydialog.body(html);
		mydialog.buttons(true, true, 'Enviar', "denuncia.enviar(" + obj_id + ", '" + type + "')", true, true, true, 'Cancelar', 'close', true, false);
		mydialog.center();
    },
    enviar: function(obj_id, type){
        var razon = $('select[name=razon]').val();
        var extras = $('textarea[name=extras]').val();
        //
        $('#loading').fadeIn(250);                         
		$.ajax({
			type: 'POST',
			url: global_data.url + '/denuncia-' + type + '.php',
			data: 'obj_id=' + obj_id + '&razon=' + razon + '&extras=' + extras,
			success: function(h){
                switch(h.charAt(0)){
                    case '0':
                        mydialog.alert("Error",'<div class="emptyData">' + h.substring(3) +  '</div>');
                    break;
                    case '1':
                        mydialog.alert("Bien", '<div class="emptyData">' + h.substring(3) + '</div>');
                    break;
                }
                $('#loading').fadeOut(350);                                                 
			}
		});
    }
}


function remind_password(gew){
   close_login_box();

	 if(!gew){
	 
	var form = '';
        form += '<div style="padding:0 35px;" id="AFormInputs">'
        form += '<div class="form-group">'
        form += '<label for="r_email">Correo electr&oacute;nico:</label>'
        form += '<input type="text" tabindex="1" name="r_email" id="r_email" maxlength="35"/>'
  		form += '</div>'
		form += '</div>'
        //
        mydialog.class_aux = 'registro';
		mydialog.show(true);
		mydialog.title('Recuperar Contrase&ntilde;a');
		mydialog.body(form);
		mydialog.buttons(true, true, 'Continuar', 'javascript:remind_password(true)', true, true, true, 'Cancelar', 'close', true, false);		
		mydialog.center();
	
	 }else{
	 
	var r_email = $('#r_email').val(); 
	
	$.post(global_data.url + '/recover-pass.php', 'r_email=' + r_email, function(a){
		   
           mydialog.alert((a.charAt(0) == '0' ? 'Opps!' : 'Hecho'), a.substring(3), false);
		   
           mydialog.center();
		    
		  });
	}
	
}

function resend_validation(gew){
    close_login_box();

	 if(!gew){
	 
	var form = '';
        form += '<div style="padding:0 35px;" id="AFormInputs">'
        form += '<div class="form-group">'
        form += '<label for="r_email">Correo electr&oacute;nico:</label>'
        form += '<input type="text" tabindex="1" name="r_email" id="r_email" maxlength="35"/>'
  		form += '</div>'
		form += '</div>'
        //
        mydialog.class_aux = 'registro';
		mydialog.show(true);
		mydialog.title('Reenviar validaci&oacute;n');
		mydialog.body(form);
		mydialog.buttons(true, true, 'Reenviar', 'javascript:resend_validation(true)', true, true, true, 'Cancelar', 'close', true, false);		
		mydialog.center();
	
	 }else{
	 
	var r_email = $('#r_email').val(); 
    
    $('#loading').fadeIn(250); 
	
	$.post(global_data.url + '/recover-validation.php', 'r_email=' + r_email, function(a){
		   
           mydialog.alert((a.charAt(0) == '0' ? 'Opps!' : 'Hecho'), a.substring(3), false);
		   
           mydialog.center();
		    
            $('#loading').fadeOut(350); 
		  });
	}
	
}

/* AFILIACION */
var afiliado = {
    vars: Array(),
    nuevo: function(){
        // CARGAMOS Y BORRAMOS
        var form = '';
        form += '<div class="emptyData" style="margin-bottom:10px" id="AFStatus"><span>Ingresa los datos de tu web para afiliarte.</span></div>'
        form += '<div style="padding:0 35px;" id="AFormInputs">'
        form += '<div class="form-group">'
        form += '<label for="atitle">T&iacute;tulo</label>'
        form += '<input type="text" tabindex="1" name="atitle" id="atitle" maxlength="35"/>'
  		form += '</div>'
        form += '<div class="form-group">'
        form += '<label for="aurl">Direcci&oacute;n</label>'
        form += '<input type="text" tabindex="2" name="aurl" id="aurl" value="http://"/>'
  		form += '</div>'
        form += '<div class="form-group">'
        form += '<label for="aimg">Banner <small>(216x42px)</small></label>'
        form += '<input type="text" tabindex="3" name="aimg" id="aimg" value="http://"/>'
  		form += '</div>'
        form += '<div class="form-group">'
        form += '<label for="atxt">Descripci&oacute;n</label>'
        form += '<textarea tabindex="4" rows="10" name="atxt" id="atxt" style="height:60px; width:295px"></textarea>'
  		form += '</div>'
        form += '<div class="form-group">'
        form += '<label for="aID">RefID <a href="#" onclick="$(this).parent().parent().find('
        form += "'span').css({display: 'block'}); return false"
        form += '"><img src="' + global_data.img + '/images/icons/help.png"/></a></label><span style="display:none; margin-bottom:5px">Si utilizas <a href="http://www.tscript.in/"><b>T!Script</b></a> y ya nos enlazaste, ingresa el ID generado en tu panel de adminsitraci&oacute;n.</span>'
        form += '<input type="text" tabindex="5" name="aID" id="aID" value="" style="width:100px!important"/>'
  		form += '</div>'
        form += '</div>'
        //
        mydialog.class_aux = 'registro';
        mydialog.mask_close = false;
        mydialog.close_button = true;
		mydialog.show(true);
		mydialog.title('Nueva Afiliaci&oacute;n');
		mydialog.body(form);
		mydialog.buttons(true, true, 'Enviar', 'afiliado.enviar(0)', true, true, true, 'Cancelar', 'close', true, false);
		mydialog.center();
    },

    enviar: function(){
        var inputs = $('#AFormInputs :input');
        var status = true;
        var params = '';
        //
        inputs.each(function(){
            var val = $(this).val();
            // EL CAMPO AID NO ES NECESARIO
            if($(this).attr('name') == 'aID') val = '0'; 
            // COMPROBAMOS CAMPOS VACIOS
          /*  if((val == '') && status == true) {
                var campo = $(this).parent().find('label');
                $('#AFStatus > span').fadeOut().text('No has completado el campo ' + campo.text()).fadeIn();
                status = false;
            } else*/ if(status == true){
                // JUNTAMOS LOS DATOS
                params += $(this).attr('name') + '=' + val + '&';
            }
		});
        //
        if(status == true){
            mydialog.procesando_inicio('Enviando...', 'Nueva Afiliaci&oacute;n');
            afiliado.enviando(params);
        }
    },
    enviando: function(params){
    	//
        $('#loading').fadeIn(250); 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/afiliado-nuevo.php',
    		data: params,
    		success: function(h){
    		  mydialog.procesando_fin();
    		  switch(h.charAt(0)){
    		      case '0':
                $('#AFStatus > span').fadeOut().text('La URL es incorrecta').fadeIn();
                   // mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
                  break;
                  case '1':
                    mydialog.body(h.substring(3));
                    mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
                  break;
                     case '2':
                $('#AFStatus > span').fadeOut().text('Faltan datos').fadeIn();
                   // mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
                  break;
    		  }
              mydialog.center();
              $('#loading').fadeOut(350); 
    		}
    	});
    },
    detalles: function(aid){
        $('#loading').fadeIn(250); 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/afiliado-detalles.php',
    		data: 'ref=' + aid,
    		success: function(h){
    		    mydialog.class_aux = '';
        		mydialog.show(true);
        		mydialog.title('Detalles');
        		mydialog.body(h);
                mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
                mydialog.center();
                $('#loading').fadeOut(350); 
                
    		}
    	});   
    }
}

/* EMOTICONOS */
function moreEmoticons(margin){
    var emos = $('#emoticons');
    //
    $('#loading').fadeIn(250); 
	$.ajax({
		type: 'GET',
		url: global_data.url + '/emoticones.php',
		data: 'ts=false',
		success: function(h){
		    if(margin) $(emos).css({marginTop : '1em'})
		    $(emos).append(h);
            $('#moreemofn').hide();
            $('#loading').fadeOut(350); 
		}
	});   
}
/* IMAGENES */
var imagenes = {
    total: 0,
    move: '-250px',
    presentacion: function(){
        $('#imContent').animate({top: '0px'}, 1000, 'easeOutQuad', 
        function(){
            // MOSTRAMOS
            // MOVEMOS
            $('#imContent').css({top: imagenes.move})
            // ULTIMO
            var slm = $('#img_' + imagenes.total).html();
            //
            for(var i = imagenes.total; i >= 0; i--){
                $('#img_' + i).html($('#img_' + (i - 1)).html());
            }
            //
            $('#img_0').html(slm);
            // INFINITO :D
            setTimeout("imagenes.presentacion()",5000);
        });

    }
}

// NEWS
var news = {
    total: 0,
    count: 1,
    slider: function(){
        if(news.total > 1){
            if(news.count < news.total) news.count++;
            else news.count = 1;
            //
            $('#top_news > li').hide();
            $('#new_' + news.count).fadeIn();
            // INFINITO :D
            setTimeout("news.slider()",7000);
        }
    }       
}

// READY
$(document).ready(function(){
    /* NOTICIAS */
    news.total = $('#top_news > li').length;
    news.slider();
    /* HOVER CARD */
    $('a[title]').tooltip();
    // LazyLoad
    $('img[src]').lazyload({effect: "fadeIn",effectTime: 1000});
});