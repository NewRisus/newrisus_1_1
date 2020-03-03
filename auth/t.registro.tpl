{include file='sections/main_header.tpl'}
<div class="container-fluid">
    <div class="row align-items-center">
        <div class="col-sm"></div>
        <div class="col-sm-5">
            <img class="nr-logoi" src="{$tsConfig.tema.t_url}/images/logo-white.png">
            <h5 class="nr-logoi-text">{$tsConfig.titulo}</h5>
        </div>
        <div class="col-sm-5">
        {if $tsConfig.c_reg_active == 1}
        <div class="auth-login-cuerpo nr-auth" id="boxms">
            <div id="nopw" class="d-none">1:</div>
            <div id="RegistroForm">
                <div class="login_cuerpo">
                    <h1>Crear una cuenta</h1>
                    <h6>¿Ya tienes una cuenta? <a href="{$tsConfig.url}/login/">Inicia sesión.</a></h6>
                    <br>
                    <div class="pasoUno pasoDos">
                        <div class="form-group">
                            <label class="d-none" for="nick">Nombre de usuario</label>
                            <input name="nick" onfocus="registro.focus(this);this.removeAttribute('readonly');" readonly placeholder="Nombre de usuario" type="text" id="nick" class="form-control" tabindex="1" title="Ingresa un nombre de usuario &uacute;nico" onblur="registro.blur(this)" onkeydown="registro.clear_time(this.name)" onkeyup="registro.set_time(this.name)" autocomplete="off" /> 
                            <div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
                        </div>
                        <div class="form-group">
                            <label class="d-none" for="password">Contrase&ntilde;a deseada</label>
                            <a title="Mostrar contraseña" id="show_password" class="hide" style="top: 8px;right: 4px;"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12.015 7c4.751 0 8.063 3.012 9.504 4.636-1.401 1.837-4.713 5.364-9.504 5.364-4.42 0-7.93-3.536-9.478-5.407 1.493-1.647 4.817-4.593 9.478-4.593zm0-2c-7.569 0-12.015 6.551-12.015 6.551s4.835 7.449 12.015 7.449c7.733 0 11.985-7.449 11.985-7.449s-4.291-6.551-11.985-6.551zm-.015 7l-3.36-2.171c-.405.625-.64 1.371-.64 2.171 0 2.209 1.791 4 4 4s4-1.791 4-4-1.791-4-4-4c-.742 0-1.438.202-2.033.554l2.033 3.446z"/></svg></a>
                            <input name="password" type="password" id="password" class="form-control" tabindex="2" onfocus="registro.focus(this); this.removeAttribute('readonly');" readonly placeholder="Contrase&ntilde;a deseada" title="Ingresa una contrase&ntilde;a segura" onblur="registro.blur(this)" autocomplete="off" /> 
                            <div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
                        </div>
                        <div class="form-group">
                            <label class="d-none" for="email">E-mail</label>
                            <input name="email" type="text" id="email" class="form-control" tabindex="4" title="Ingresa tu direcci&oacute;n de email" onblur="registro.blur(this)" onfocus="registro.focus(this);this.removeAttribute('readonly');" readonly placeholder="E-mail" onkeydown="registro.clear_time(this.name)" onkeyup="registro.set_time(this.name)" autocomplete="off" /> 
                            <div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
                        </div>
                        <div class="form-group">
                            <label class="d-none" for="sexo">G&eacute;nero</label>
                            <select id="genero" class="form-control" name="sexo" tabindex="8" onblur="registro.blur(this)" onchange="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Selecciona tu g&eacute;nero">
                                <option value="">Seleccionar g&eacute;nero</option>
                                <option value="1" id="sexo_m">Masculino</option>
                                <option value="0" id="sexo_f">Femenino</option>
                            </select> 
                            <div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
                        </div>  
                        <div class="form-line form-group">
                           <input type="hidden" name="g-recaptcha-response" id="response" class="g-recaptcha">
                           <div class="help"><span><em></em></span></div>
                        </div>
                        <div class="footerReg">
                            <div class="form-group">
                                <p class="nr-term">
                                El grupo <a href="{$tsConfig.url}">{$tsConfig.titulo}</a> puede mantenerme informado con correos electrónicos personalizado sobre productos y servicios. Consulta nuestra <a href="{$tsConfig.url}/pages/privacidad/">Política de privacidad</a> para conocer más detalles o darte de baja en cualquier momento.
                                </p>
                                <input class="inp-cbx" id="terminos" name="terminos" tabindex="14" onblur="registro.blur(this)" onfocus="registro.focus(this)" type="checkbox" style="display: none;" {if $tsDraft.b_private == 1}checked="checked"{/if}>
                                <label class="cbx" for="terminos"><span><svg width="12px" height="10px" viewbox="0 0 12 10"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                                    <span><b>Términos y condiciones.</b><br><small>He leído los Términos y condiciones de {$tsConfig.titulo}.</small></span>
                                </label>
                                <p class="nr-term" style="margin-top: 10px;"> 
                                Al hacer clic en Crear cuenta, reconozco que he leído y aceptado los <a href="{$tsConfig.url}/pages/terminos-y-condiciones/" target="_blank">T&eacute;rminos y Condiciones de uso</a> y la <a href="{$tsConfig.url}/pages/privacidad/">Política de privacidad</a> de {$tsConfig.titulo}.
                                </p>
                                <div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button onclick="registro.submit();" class="btn btn-primary">Crear cuenta</button>
                    </div>
                </div>
            </div>
        </div>
        {else}
        <div class="auth-login-cuerpo" id="ocumile">
            <div class="melogi">
                <h2>Bienvenido a {$tsConfig.titulo}!</h2>
                <p>Temporalmente el registro de nuevas cuentas esta desactivado</p>
            </div>
        </div>
        {/if}
        </div>
        <div class="col-sm"></div>
    </div>
</div>

<script src="https://www.google.com/recaptcha/api.js{if $tsConfig.c_recaptcha == 0}" async defer{else}?render={RC_PUK}"{/if}></script>
<script type="text/javascript">
const SelectR = '{$tsConfig.c_recaptcha}';
$.getScript("{$tsConfig.url}/auth/js/registro.js{literal}", function(){
   registro.change_paso(1);
   mydialog.procesando_fin();
});
$('#show_password').click(function(e){
   e.preventDefault();
   $(this).toggleClass('see', 'hide');

   var newType = $('#password').attr('type') == 'text' ? 'password' : 'text';
   $('#password').attr('type', newType);
});
</script>
{/literal}
{if $tsConfig.c_recaptcha == 1}
<script type="text/javascript">
   var keyv3 = '{RC_PUK}';
   grecaptcha.ready(function () {
      grecaptcha.execute(keyv3{literal}, {action: 'homepage'}).then(function (token) {
         var response = document.getElementById('response');
         response.value = token;
      });
   });
   {/literal}
</script>
{/if}
{include file='sections/main_footer.tpl'}