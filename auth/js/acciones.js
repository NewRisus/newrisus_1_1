var proc = Array();
if(!lang) var lang = Array();
lang['error procesar'] = 'Error al intentar procesar lo solicitado';

/****** NUEVO MODAL ******/
$( document ).ready(function() { $("#mask").remove(); }); 
var mydialog = {
	is_show: false,
	class_aux: '',
	close_button: false,
	show: function(class_aux){
		if(this.is_show){return}else{this.is_show=true;}

		var ModalNewRisus = '';
	   ModalNewRisus += '<div class="modal" id="dialog" tabindex="-1" role="dialog">'
	   ModalNewRisus += '<div class="modal-dialog modal-dialog-centered" role="document">'
	   ModalNewRisus += '<div class="modal-content">'
	   ModalNewRisus += '<div class="modal-header">'
	   ModalNewRisus += '<h5 class="modal-title"></h5>'
	   ModalNewRisus += '<span onclick="mydialog.close();" style="cursor:pointer;" class="float-right" aria-hidden="true">&times;</span>'
	   ModalNewRisus += '</div>' /* CIERRA MODAL-HEADER */
	   ModalNewRisus += '<div class="modal-body" id="cuerpo">'
	   ModalNewRisus += '<div id="procesando"><div id="mensaje"></div></div>'
	   ModalNewRisus += '<div class="modal_body"></div>'
	   ModalNewRisus += '</div>' /* CIERRA MODAL-BODY */
	   ModalNewRisus += '<div class="modal-footer"><button type="button" class="btn btn-danger" onclick="mydialog.close();">Cerrar</button></div>'
	   ModalNewRisus += '</div>' /* CIERRA MODAL-CONTENT */
	   ModalNewRisus += '</div>' /* CIERRA MODAL-DIALOG */
	   ModalNewRisus += '</div>' /* CIERRA MODAL */

		if($('#mydialog').html() == '');
		$('#mydialog').html(ModalNewRisus);

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
			html += '<input type="button" class="btn btn-success btn-sm'+(btn1_enabled?'':' disabled')+'" style="display:'+(btn1_display?'inline-block':'none')+'"'+(btn1_display?' value="'+btn1_val+'"':'')+(btn1_display?' onclick="'+btn1_action+'"':'')+(btn1_enabled?'':' disabled')+' />';
		if(btn2_display)
			html += ' <input type="button" class="btn btn-danger btn-sm'+(btn1_enabled?'':' disabled')+'" style="display:'+(btn2_display?'inline-block':'none')+'"'+(btn2_display?' value="'+btn2_val+'"':'')+(btn2_display?' onclick="'+btn2_action+'"':'')+(btn2_enabled?'':' disabled')+' />';
		$('.modal-footer').html(html).css('display', 'inline-block');

		if(btn1_focus)
			$('.modal-footer .btn.btn-success').focus();
		else if(btn2_focus)
			$('.modal-footer .btn.btn-danger').focus();
	},
	buttons_enabled: function(btn1_enabled, btn2_enabled){
		if($('.modal-footer .btn.btn-success'))
			(btn1_enabled) ? $('.modal-footer .btn.btn-success').removeClass('disabled').removeAttr('disabled') : $('.modal-footer .btn.btn-success').addClass('disabled').attr('disabled', 'disabled');

		if($('.modal-footer .btn.btn-danger'))
			(btn2_enabled) ? $('.modal-footer .btn.btn-danger').removeClass('disabled').removeAttr('disabled') : $('.modal-footer .btn.btn-danger').addClass('disabled').attr('disabled', 'disabled');
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
		$('.modal-body #procesando #mensaje').html('<div class="text-center" style="padding: 1rem 10px;"><div class="spinner-border text-dark" role="status"><span class="sr-only">Loading...</span></div>');
		$('.modal-body #procesando').fadeIn('slow');
	},
	procesando_fin:function(){$('.modal-body #procesando').fadeOut('slow');}
};
document.onkeydown=function(e){key=(e==null)?event.keyCode:e.which;if(key == 27)mydialog.close();};
/****** FIN MODAL ********/
/* No recuerdo la contraseña */
function remind_password(gew){
	if(!gew){
      var form = '';
      form += '<div id="AFormInputs">'
      form += '<div class="form-group">'
      form += '<label for="r_email">Correo electr&oacute;nico:</label>'
      form += '<input type="text" tabindex="1" class="form-control" name="r_email" id="r_email" maxlength="35"/>'
  		form += '</div>'
		form += '</div>'
      //
      mydialog.class_aux = 'registro';
		mydialog.show(true);
		mydialog.title('Recuperar Contrase&ntilde;a');
		mydialog.body(form);
		mydialog.buttons(true, true, 'Continuar', 'javascript:remind_password(true)', true, true, true, 'Cancelar', 'close', true, false);		
		mydialog.center();
	} else {
      var r_email = $('#r_email').val(); 
      $.post(global_data.url + '/recover-pass.php', 'r_email=' + r_email, function(a){
         mydialog.alert((a.charAt(0) == '0' ? 'Opps!' : 'Hecho'), a.substring(3), false);
         mydialog.center();
      });
	}
}
/* No me llegó el correo de validación */
function resend_validation(gew){
	if(!gew){
	   var form = '';
      form += '<div id="AFormInputs">'
      form += '<div class="form-group">'
      form += '<label for="r_email">Correo electr&oacute;nico:</label>'
      form += '<input type="text" tabindex="1" class="form-control" name="r_email" id="r_email" maxlength="35"/>'
  		form += '</div>'
		form += '</div>'
      //
      mydialog.class_aux = 'registro';
		mydialog.show(true);
		mydialog.title('Reenviar validaci&oacute;n');
		mydialog.body(form);
		mydialog.buttons(true, true, 'Reenviar', 'javascript:resend_validation(true)', true, true, true, 'Cancelar', 'close', true, false);		
		mydialog.center();
	} else {
	   var r_email = $('#r_email').val(); 
      $('#loading').fadeIn(250); 
      $.post(global_data.url + '/recover-validation.php', 'r_email=' + r_email, function(a){
         mydialog.alert((a.charAt(0) == '0' ? 'Opps!' : 'Hecho'), a.substring(3), false);
         mydialog.center();
		   $('#loading').fadeOut(350); 
		});
	}
}
