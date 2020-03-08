/* Se creó esta función para obtener el valor del parámetros  */
function regresar(name) {
   name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
   var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
   results = regex.exec(location.search);
   return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
/* Buscamos el parámetros | Mostramos URL | Si se usa en xampp | Reemplazamos /login por nada */
var Redireccionar = regresar('NewRisus'), MyUrl = window.location.origin, Local = window.location.pathname, l2 = Local.replace('/login', '');

function login__web(){
	if ( empty( $('#nickname').val() ) ) { $('#nickname').focus(); return; }
	if ( empty( $('#password').val() ) ) { $('#password').focus(); return; }
	var rem = ($('#rem').is(':checked')) ? 'true' : 'false',
	style = {'background': '#F003','color': '#F00D','padding': '8px 12px','display': 'block','margin-bottom': '10px'};
	$('#load').html('<div id="load"><svg width="38" height="38" viewBox="0 0 38 38" xmlns="http://www.w3.org/2000/svg" stroke="#fff"><g fill="none" fill-rule="evenodd"><g transform="translate(1 1)" stroke-width="2"><circle stroke-opacity=".5" cx="18" cy="18" r="18"/><path d="M36 18c0-9.94-8.06-18-18-18"><animateTransform attributeName="transform" type="rotate" from="0 18 18" to="360 18 18" dur="1s" repeatCount="indefinite"/></path></g></g></svg><br><p>Cargando usuario...</p></div>').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url + '/login-user.php',
		cache: false,
		data: 'nick='+encodeURIComponent($('#nickname').val())+'&pass='+encodeURIComponent($('#password').val())+'&rem='+rem
	}).done(function(resp) {
		switch(resp.charAt(0)) {
			case '0': 
				$('.auth-login-error').html(resp.substring(3)).css(style);
				$('#nickname').focus();
				$('#load').remove();
			break;
			case '1':
				(Redireccionar != '') ? location.href = atob(Redireccionar) : (window.location.pathname) ? location.href = MyUrl + l2 : location.href = MyUrl;
            $('#loading').fadeOut(350);
			break;
			case '2':
				$('.login_cuerpo').css({'text-align': 'center','line-height': '150%'}).html(resp.substring(3));
			break;
		}
	}).fail(function(data) {
		$('.auth-login-error').html('Error al processar!').css(style);
		$('#load').remove();
	}).always(function(h) {
		$('#load').css('background-color', '#285e61CC');
		$('#load p').html('Redireccionando a <b>'+global_data.s_title+'</b>');
		$('#loading').fadeOut(250);
	});
}