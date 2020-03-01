<div id="collapse-ingreso" class="collapse hide" aria-labelledby="heading-example">
    <div class="card-block">
        <div class="row">
            <div class="col-sm"></div>
            <div class="col-6">
                <form action="javascript:login_ajax()" method="post">
                    <div class="modal-body">
                        <div id="login_box">
                            <div class="login_cuerpo">
                                <span class="gif_cargando floatR" id="login_cargando" style="display: none;"></span>
                                <div id="login_error" style="display: none; padding:3px 0;"></div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Nombre de usuario</label>
                                        <input type="text" class="form-control" id="nickname" name="nick" aria-describedby="emailHelp" placeholder="Ingresa tu usuario">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="password" name="pass" placeholder="Contraseña">
                                        <small id="emailHelp" class="form-text text-muted">Nunca compartas tu contraseña.</small>
                                    </div>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="rem" name="rem" value="true" checked="checked">
                                        <label class="custom-control-label" for="rem">Recordar datos.</label>
                                    </div>
                            </div>
                        </div>
                    </div>
                        <button type="button" class="btn btn-secondary" data-toggle="collapse" href="#collapse-ingreso" aria-expanded="true" aria-controls="collapse-ingreso">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Entrar</button>
                </form>
            </div>
            <div class="col-sm"></div>
        </div>
    </div>
<hr>
</div>

<!-- REGISTRO -->
    <div id="collapse-registro" class="collapse hide" aria-labelledby="heading-example">
        <div class="card-block">
            {if $tsConfig.c_reg_active == 1}
<div class="columns contenedoRegistro">
	<div class="is-9" id="login_box">
		<div id="ocumile">
			<div class="registro-header">
				<h2>Bienvenido a {$tsConfig.titulo}!</h2>
				<p>Crear tu cuenta en {$tsConfig.titulo}! solo te tomará algunos segundos y te permitirá acceder al mejor contenido creado por usuarios como tu</p>
			</div>
		</div>
		<div id="nopw"></div>
		<div id="boxms"></div>
		<div id="RegistroForm">
			<div class="pasoUno pasoDos">
				<div class="field">
					<label for="nick">Nombre de usuario</label>
					<input name="nick" type="text" id="nick" class="input" tabindex="1" title="Ingresa un nombre de usuario &uacute;nico" onfocus="registro.focus(this)" onblur="registro.blur(this)" onkeydown="registro.clear_time(this.name)" onkeyup="registro.set_time(this.name)" autocomplete="off" /> 
					<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
				</div>
				<div class="field">
					<label for="password">Contrase&ntilde;a deseada</label>
					<input name="password" type="password" id="password" class="input" tabindex="2" title="Ingresa una contrase&ntilde;a segura" onfocus="registro.focus(this)" onblur="registro.blur(this)" autocomplete="off" /> 
					<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
				</div>
				<div class="field">
					<label for="email">E-mail</label>
					<input name="email" type="text" id="email" class="input" tabindex="4" title="Ingresa tu direcci&oacute;n de email" onfocus="registro.focus(this)" onblur="registro.blur(this)" onkeydown="registro.clear_time(this.name)" onkeyup="registro.set_time(this.name)" autocomplete="off" /> 
					<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
				</div>
				<div class="field">
					<label  for="sexo">Sexo</label><br>
						<input class="radio" type="radio" id="sexo_m" tabindex="8" name="sexo" value="1" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Selecciona tu g&eacute;nero" /> <label class="list-label" for="sexo_m">Masculino</label>
						<input class="radio" type="radio" id="sexo_f" tabindex="8" name="sexo" value="0" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Selecciona tu g&eacute;nero" /> <label class="list-label" for="sexo_f">Femenino</label><div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
				</div>
					
				<div class="form-line">
					<input type="hidden" name="g-recaptcha-response" id="recaptchaResponse" class="g-recaptcha">
					<div class="help"><span><em></em></span></div>
				</div>﻿﻿﻿﻿﻿

				<div class="footerReg">
					<div class="field">
						<input type="checkbox" class="checkbox" id="terminos" name="terminos" tabindex="14" onblur="registro.blur(this)" onfocus="registro.focus(this)" title="Acepta los T&eacute;rminos y Condiciones?" /> 
						<label  for="terminos"><span></span>Acepto los <a href="{$tsConfig.url}/pages/terminos-y-condiciones/" target="_blank">T&eacute;rminos y Condiciones de uso</a></label> 
						<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
					</div>
				</div>
			</div>	
			<div class="bolo">
				<a onclick="registro.submit();" class="btn btn-primary">Registrar</a>
			</div>	
		</div>
	</div>

	<div class="is-3 sinRegistro">
		<h3>¿Ya tienes una cuenta?</h3>
		<a class="btn btn-outline-primary btn-block" href="{$tsConfig.url}/login?redirect=%2F">Identificarme</a>
		<h3>Registrate para</h3>
		<ul class="olvi">
			<li>Empezar a interactuar con la comunidad.</li>
			<li>Crear y compartir tu contenido favorito.</li>
			<li>Votar lo que más te gusta del sitio.</li>
			<li>Buscar y seguir amigos.</li>
			<li>Promocionar e incrementar el tráfico a tu sitio.</li>
			<li>Ser parte de la <b>Inteligencia Colectiva!</b></li>
			<span>¡Empieza a participar ahora, es gratis!</span>
		</ul>
	</div>
</div>

<script src="https://www.google.com/recaptcha/api.js?render={$tsConfig.pkey}"></script>
<script type="text/javascript">

var keyv3 = '{$tsConfig.pkey}';
$.getScript("{$tsConfig.js}/registro.js{literal}", function(){
	registro.change_paso(1);
	mydialog.procesando_fin();
});
grecaptcha.ready(function (e) {
   grecaptcha.execute(keyv3).then(function (token) {
      var recaptchaResponse = document.getElementById('recaptchaResponse');
      recaptchaResponse.value = token;
   });
});
</script>
{/literal}
{else}
	<div style="margin: 100px 0;text-align: center;">
		<div id="ocumile">
			<div class="melogi">
				<h2>Bienvenido a {$tsConfig.titulo}!</h2>
				<p>Temporalmente el registro de nuevas cuentas esta desactivado</p>
			</div>
			{*<div class="tiide" style="margin: 10px 0 20px 0;"><span>Registrar</span></div>*}
		</div>
	</div>	
{/if}
        </div>
    </div>