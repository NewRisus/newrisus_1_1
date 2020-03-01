/* Se creó esta función para obtener el valor del parámetros  */
function regresar(name) {
   name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
   var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
   results = regex.exec(location.search);
   return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
/* Buscamos el parámetros | Mostramos URL | Si se usa en xampp | Reemplazamos /login por nada */
var Redireccionar = regresar('NewRisus'), MyUrl = window.location.origin, Local = window.location.pathname, l2 = Local.replace('/login', '');

function login_ajax(form, connect){
	var el = new Array(), params = '';
	if (form != 'logueo-form') {
		el['nick'] = $('#login_box #nickname');
		el['pass'] = $('#login_box #password');
		el['error'] = $('#login_box .auth-login-error');
		el['cargando'] = $('#login_box #login_cargando');
		el['cuerpo'] = $('#login_box .auth-login-cuerpo');
		el['button'] = $('#login_box input[type="submit"]');
	}
	if (typeof connect == 'undefined')  {
		if (empty($(el['nick']).val())) {
			$(el['nick']).focus();
			return;
		}
		if (empty($(el['pass']).val())) {
			$(el['pass']).focus();
			return;
		}
		$(el['error']).css('display', 'none');
		$(el['cargando']).css('display', 'block');
		$(el['button']).attr('disabled', 'disabled').addClass('disabled');
		var remember = ($('#rem').is(':checked')) ? 'true' : 'false';
		params = 'nick='+encodeURIComponent($(el['nick']).val())+'&pass='+encodeURIComponent($(el['pass']).val())+'&rem='+remember;
	}
   $('#loading').fadeIn(250);    
	$('.auth-login-cargando').css('display', 'block');
	$.ajax({
		type: 'post', 
		url: global_data.url + '/login-user.php', 
		cache: false, 
		data: params,
		success: function (h) {
			switch(h.charAt(0)){
				case '0':
					$(el['error']).html(h.substring(3)).show();
					$(el['nick']).focus();
					$(el['button']).removeAttr('disabled').removeClass('disabled');
					break;
				case '1':
					(Redireccionar != '') ? location.href = atob(Redireccionar) : (window.location.pathname) ? location.href = MyUrl + l2 : location.href = MyUrl;
               $('#loading').fadeOut(350);
					break;
				case '2':
					$(el['cuerpo']).css('text-align', 'center').css('line-height', '150%').html(h.substring(3));
				break;
			}
		},
		error: function() {
			$(el['error']).html(lang['error procesar']).show();
		},
		complete: function(){
			$('.auth-login-cargando').css('display', 'none');
			$('#loading').fadeOut(250);
		}
	});
}

$(document).ready(function(){
	$('#nickname').focus();
});	

function AuthLogin(b){
	$('#ver'+b).hide();
}