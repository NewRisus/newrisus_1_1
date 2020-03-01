var proc = Array();
//Calcula la edad a partir de la fecha de nacimiento
function edad(mes, dia, anio){
  //Calcular edad
  now = new Date()
  born = new Date(anio, mes*1-1, dia);
  years = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
  return years;
}

function my_number_format(numero){
  return Number(numero).toLocaleString();
}
/****** NUEVO MODAL ******/
$( document ).ready(function() { $("#mask").remove(); }); 
var mydialog = {

is_show: false,
class_aux: '',
close_button: false,
show: function(class_aux){
  if(this.is_show)
    return;
  else
    this.is_show = true;
  if($('#mydialog').html() == '') //Primera vez
  $('#mydialog').html('<div class="modal" id="dialog" tabindex="-1" role="dialog"><div class="modal-dialog modal-dialog-centered" role="document"><div class="modal-content"><div class="modal-header"><h5 class="modal-title"></h5><button type="button" class="close close_dialog" onclick="mydialog.close();"><span aria-hidden="true">&times;</span></button></div><div class="modal-body" id="cuerpo"><div id="procesando"><div id="mensaje"></div></div><div class="modal_body"></div></div><div class="modal-footer"><button type="button" class="btn btn-secondary" onclick="mydialog.close();">Cerrar</button></div></div></div></div>');

  //Esto todavia no lo entiendo, pero bueno...
  if(!this.close_button)
  $('.close_dialog').remove();  

  if(class_aux==true)
    $('#mydialog').addClass(this.class_aux);
  else if(this.class_aux != ''){
    $('#mydialog').removeClass(this.class_aux);
    this.class_aux = '';
  }
  $("#dialog").modal({backdrop: 'static', keyboard: false}); //trigger
},
close: function(){
  this.class_aux = '';
  this.close_button = false;
  this.is_show = false;
  this.procesando_fin();
  $('#mydialog #dialog').modal('toggle'); 
  $('#mydialog #dialog').on('hidden.bs.modal', function (e) { $('#mydialog #dialog').remove(); });  
},
center: function(){},
title: function(title){
  $('.modal-title').html(title);
},
body: function(body, width, height){
  $('.modal_body').html(body);
},
buttons: function(display_all, btn1_display, btn1_val, btn1_action, btn1_enabled, btn1_focus, btn2_display, btn2_val, btn2_action, btn2_enabled, btn2_focus){
  if(!display_all){
    $('.modal-footer').css('display', 'none').html('');
    return;
  }

  if(btn1_action=='close')
    btn1_action='mydialog.close()';
  if(btn2_action=='close' || !btn2_val)
    btn2_action='mydialog.close()';
  if(!btn2_val){
    btn2_val = 'Cancelar';
    btn2_enabled = true;
  }

  var html = '';
  if(btn1_display)
    html += '<input type="button" class="btn btn-primary btn-sm'+(btn1_enabled?'':' disabled')+'" style="display:'+(btn1_display?'inline-block':'none')+'"'+(btn1_display?' value="'+btn1_val+'"':'')+(btn1_display?' onclick="'+btn1_action+'"':'')+(btn1_enabled?'':' disabled')+' />';
  if(btn2_display)
    html += ' <input type="button" class="btn btn-primary btn-sm'+(btn1_enabled?'':' disabled')+'" style="display:'+(btn2_display?'inline-block':'none')+'"'+(btn2_display?' value="'+btn2_val+'"':'')+(btn2_display?' onclick="'+btn2_action+'"':'')+(btn2_enabled?'':' disabled')+' />';
  $('.modal-footer').html(html).css('display', 'inline-block');

  if(btn1_focus)
    $('.modal-footer .btn.btn-success').focus();
  else if(btn2_focus)
    $('.modal-footer .btn.btn-danger').focus();
},
buttons_enabled: function(btn1_enabled, btn2_enabled){
  if($('.modal-footer .btn.btn-success'))
    if(btn1_enabled)
      $('.modal-footer .btn.btn-success').removeClass('disabled').removeAttr('disabled');
    else
      $('.modal-footer .btn.btn-success').addClass('disabled').attr('disabled', 'disabled');

  if($('.modal-footer .btn.btn-danger'))
    if(btn2_enabled)
      $('.modal-footer .btn.btn-danger').removeClass('disabled').removeAttr('disabled');
    else
      $('.modal-footer .btn.btn-danger').addClass('disabled').attr('disabled', 'disabled');
},
alert: function(title, body, reload){
  this.show();
  this.title(title);
  this.body(body);
  this.buttons(true, true, 'Aceptar', 'mydialog.close();' + (reload ? 'location.reload();' : 'close'), true, true, false);
  this.center();
},
error_500: function(fun_reintentar){
  setTimeout(function(){
    mydialog.procesando_fin();
    mydialog.show();
    mydialog.title('Error');
    mydialog.body('Error al procesar');
    mydialog.buttons(true, true, 'Reintentar', 'mydialog.close();'+fun_reintentar, true, true, true, 'Cancelar', 'close', true, false);
    mydialog.center();
  }, 200);
},
procesando_inicio: function(value, title){
  if(!this.is_show){
    this.show();
    this.title(title);
    this.body('');
    this.buttons(false, false);
    this.center();
  }
  $('.modal-body #procesando #mensaje').html('<div class="text-center" style="padding: 2rem 10px;"><h4>Procesando tu petición...</h4><br><i class="fas fa-cog fa-spin fa-10x"></i></div>');
  $('.modal-body #procesando').fadeIn('slow');
},
procesando_fin: function(){
  $('.modal-body #procesando').fadeOut('slow');
}
};
document.onkeydown = function(e){
  key = (e==null)?event.keyCode:e.which;
  if(key == 27) //escape, close mydialog
    mydialog.close();
};
/****** FIN MODAL ********/
/* Mensajes */
var mensaje = {
    cache: {},
    vars: Array(),
    // CREAR HTML
    form: function (){
         var html = '';
        if(this.vars['error']) html += '<div class="emptyData">' + this.vars['error'] + '</div>'
        html += '<div class="form-group"><label>Para:</label>'
        html += '<input type="text" value="' + this.vars['to'] + '" maxlength="16" tabindex="0" size="20" id="msg_to" class="form-control" name="msg_to"/> <span style="font-size: 10px;">(Ingrese el nombre de usuario)</span></div>'
        html += '<div class="form-group"><label>Asunto:</label>'
        html += '<input type="text" value="' + this.vars['sub'] + '" maxlength="100" tabindex="0" size="50" id="msg_subject" class="form-control" name="msg_subject"/></div>'
        html += '<div class="form-group"><label>Mensaje:</label>'
        html += '<textarea tabindex="0" rows="10" id="msg_body" class="form-control" name="msg_body" style="height:100px; width:350px">' + this.vars['msg'] + '</textarea></div>'
        return html;                          
    },
    // FUNCIONES AUX
    checkform: function (h){
        if(parseInt(h) == 0)
            mensaje.enviar(1);
        else if(parseInt(h) == 1) {
            mensaje.nuevo(mensaje.vars['to'], mensaje.vars['sub'], mensaje.vars['msg'], 'No es posible enviarse mensajes a s&iacute; mismo.');
        } else if(parseInt(h) == 2) {
            mensaje.nuevo(mensaje.vars['to'], mensaje.vars['sub'], mensaje.vars['msg'], 'Este usuario no existe. Por favor, verif&iacute;calo.');
        }    
    },
    alert: function(h){
      mydialog.procesando_fin();
      mydialog.alert('Aviso','<div class="emptyData">' + h + '</div>');  
    },
    mostrar: function(show, obj){
        //
        $('.GBTabset a').removeClass('here');
        //
        if(show == 'all'){
            $('#mensajes div').show();
            $(obj).addClass('here');
        } else if(show == 'unread'){
            $('#mensajes div.GBThreadRow').hide();
            $('#mensajes table.unread').parent().show();
            $(obj).addClass('here');
        }
    },
    select: function(act){
        //
        var inputs = $('#mensajes .GBThreadRow :input');
        inputs.each(function(){
           if(act == 'all'){
            $(this).attr({checked: 'checked'});
           } else if(act == 'read'){
                if($(this).attr('class') != 'inread'){
                    $(this).attr({checked: 'checked'});
                } else $(this).attr({checked: ''});
           } else if(act == 'unread'){
                if($(this).attr('class') == 'inread'){
                    $(this).attr({checked: 'checked'});
                } else $(this).attr({checked: ''});                
           } else if(act == 'none'){
            $(this).attr({checked: ''});
           }
        });
    },
    modificar: function(act){
        var inputs = $('#mensajes .GBThreadRow :input');
        var ids = new Array();
        var i = 0;
        //
        inputs.each(function(){
            var este = $(this).prop('checked');
            //
            if(este != false){
                // AGREGAR EL ID
                ids[i] = $(this).val();
                i++;
                // PARA LOS ESTILOS
                var cid = $(this).val().split(':');
                // MARCAR LEIDO
                if(act == 'read'){
                    $('#' + cid[0]).removeClass('unread');
                    $(this).removeClass('inread');
                // MARCAR NO LEIDO
                } else if(act == 'unread'){
                    $('#' + cid[0]).addClass('unread');
                    $(this).addClass('inread');
                // ELIMINAR
                } else if(act == 'delete'){
                    $('#' + cid[0]).parent().remove();
                }
            }
        });
        // ENVIAR CAMBIOS
        if(ids.length > 0){
            var params = ids.join(',');
            mensaje.ajax('editar','ids=' + params + '&act=' + act,function(r){
                //
            });   
        }
    },
    eliminar: function(id,type){
        mensaje.ajax('editar','ids=' + id + '&act=delete',function(r){
            if(type == 1){
                var cid = id.split(':');
                $('#mp_' + cid[0]).remove();
             }else if(type == 2){
                location.href = global_data.url + '/mensajes/';
             }
        });
    },
    marcar: function(id, a, type, obj){
        var act = (a == 0) ? 'read' : 'unread';
        var show = (act == 'read') ? 'unread' : 'read';
        
        //
        mensaje.ajax('editar','ids=' + id + '&act=' + act,function(r){
            // CAMBIAR ENTRE LEIDO Y NO LEIDO
            if(type == 1){
                var cid = id.split(':');
                if(act == 'read')
                $('#mp_' + cid[0]).removeClass('unread');
                else 
                $('#mp_' + cid[0]).addClass('unread');
                //
                $(obj).parent().find('a').hide();
                $(obj).parent().find('.' + show).show();
             } else {
                location.href = global_data.url + '/mensajes/';
             }
        });
    },
    // POST
    ajax: function(action, params, fn){
        $('#loading').fadeIn(250);
        $.ajax({
        type: 'POST',
        url: global_data.url + '/mensajes-' + action + '.php',
        data: params,
        success: function(h){
                fn(h);
                $('#loading').fadeOut(350);                
        }
      });
    },
    // PREPARAR EL ENVIO
  nuevo: function (para, asunto, body, error){
        // GUARDAR
        this.vars['to'] = para;
        this.vars['sub'] = asunto;
        this.vars['msg'] = body;
        this.vars['error'] = error;
        //
        mydialog.procesando_fin();
    mydialog.show(true);
    mydialog.title('Nuevo mensaje');
    mydialog.body(this.form());
    mydialog.buttons(true, true, 'Enviar', '$(\'.wysibb-texarea\').sync(); mensaje.enviar(0)', true, true, true, 'Cancelar', 'close', true, false);
        var wbbOpt = { resize_maxheight: 170, buttons: "smilebox,|,bold,italic,underline,strike,sup,sub,|,img,video,link,|,removeFormat" }
        $('#msg_body').wysibb(wbbOpt);
        mydialog.center();
  },
    // ENVIAR...
    enviar: function (enviar){
        // DATOS
        this.vars['to'] = $('#msg_to').val();
        this.vars['sub'] = encodeURIComponent($('#msg_subject').val()); // FIX: 14/12/2014 - 1.1.000.9
        this.vars['msg'] = encodeURIComponent($('#msg_body').val()); // FIX: 14/12/2014 - 1.1.000.9
        // COMPROBAR
        if(enviar == 0){ // VERIFICAR...
            if(this.vars['to'] == '')
                mensaje.nuevo(mensaje.vars['to'], mensaje.vars['sub'], mensaje.vars['msg'], 'Por favor, especific&aacute; el destinatario.');
            if(this.vars['msg'] == '')
                mensaje.nuevo(mensaje.vars['to'], mensaje.vars['sub'], mensaje.vars['msg'], 'El mensaje esta vac&iacute;o.');
            //
            mydialog.procesando_inicio('Verificando...', 'Nuevo Mensaje');
            this.ajax('validar', 'para=' + this.vars['to'], mensaje.checkform);

        } else if(enviar == 1){
            mydialog.procesando_inicio('Enviando...', 'Nuevo Mensaje');
            // ENVIAR
            this.ajax('enviar', 'para=' + mensaje.vars['to'] + '&asunto=' + mensaje.vars['sub'] + '&mensaje=' + mensaje.vars['msg'], mensaje.alert);
        }
    },
    // RESPONDER
    responder: function(mp_id){
        this.vars['mp_id'] = $('#mp_id').val();
        this.vars['mp_body'] = encodeURIComponent($('#respuesta').bbcode()); // Fix: 06/05/2018 - 1.3
        if(this.vars['mp_body'] == '') {
            $('#respuesta').focus();
            return;
        }
        //
        this.ajax('respuesta','id=' + this.vars['mp_id'] + '&body=' + this.vars['mp_body'], function(h){
            $('#respuesta').val(''); // LIMPIAMOS
            $('.wysibb-body').html('');
            switch(h.charAt(0)){
                case '0':
                    mydialog.alert("Error", h.substring(3));
                break;
                case '1':
          $('#historial').append($(h.substring(3)).fadeIn('slow'));
                break;
            }
            $('#respuesta').focus();
        });
    }
}
/* AFILIACION */
var afiliado = {
    vars: Array(),
    nuevo: function(){
        // CARGAMOS Y BORRAMOS
        var form = '';
        form += '<div class="alert alert-info" id="AFStatus"><span>Ingresa los datos de tu web para afiliarte.</span></div>'
        form += '<div id="AFormInputs">'
        form += '<div class="form-group">'
        form += '<label for="atitle">T&iacute;tulo</label>'
        form += '<input required type="text" class="form-control" tabindex="1" name="atitle" id="atitle" maxlength="35"/>'
      form += '</div>'
        form += '<div class="form-group">'
        form += '<label for="aurl">Direcci&oacute;n</label>'
        form += '<input required type="text" class="form-control" tabindex="2" name="aurl" id="aurl" value="http://"/>'
      form += '</div>'
        form += '<div class="form-group">'
        form += '<label for="aimg">Banner <small>(216x42px)</small></label>'
        form += '<input required type="text" class="form-control" tabindex="3" name="aimg" id="aimg" value="http://"/>'
      form += '</div>'
        form += '<div class="form-group">'
        form += '<label for="atxt">Descripci&oacute;n</label>'
        form += '<textarea required tabindex="4" class="form-control" rows="10" name="atxt" id="atxt" style="height:60px;"></textarea>'
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
/* IE10 viewport hack for Surface/desktop Windows 8 bug */
!function(){"use strict";if(navigator.userAgent.match(/IEMobile\/10\.0/)){var e=document.createElement("style");e.appendChild(document.createTextNode("@-ms-viewport{width:auto!important}")),document.head.appendChild(e)}}();

//Browser Fixes
//Funcion Jquery Browser que fue removida con esta la volvemos a traer
var matched,browser;jQuery.uaMatch=function(e){e=e.toLowerCase();var r=/(chrome)[ \/]([\w.]+)/.exec(e)||/(webkit)[ \/]([\w.]+)/.exec(e)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e)||/(msie) ([\w.]+)/.exec(e)||e.indexOf("compatible")<0&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e)||[];return{browser:r[1]||"",version:r[2]||"0"}},browser={},(matched=jQuery.uaMatch(navigator.userAgent)).browser&&(browser[matched.browser]=!0,browser.version=matched.version),browser.chrome?browser.webkit=!0:browser.webkit&&(browser.safari=!0),jQuery.browser=browser;
