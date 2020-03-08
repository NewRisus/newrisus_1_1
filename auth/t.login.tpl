{include file='sections/header.tpl'}
<div id="load" style="display:none;"></div>
<div class="container-fluid">
    <div class="row align-items-center">
        <div class="col-sm"></div>
        <div class="col-sm-5">
            <img class="nr-logoi" src="{$tsConfig.tema.t_url}/images/logo-white.png">
            <h5 class="nr-logoi-text">{$tsConfig.titulo}</h5>
        </div>
        <div class="col-sm-5">
            <div class="auth-content nr-auth" id="login_box">
                <div class="auth-login-cuerpo">
                    <div class="auth-login-cargando" style="display:none;">
                        <div class="auth-load">
                            <div class="spinner-border text-dark" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>
                    </div>
                    <div class="auth-login-error position-fixed alert alert-danger" style="display:none;"></div>
                    <form action="javascript:login__web()" method="post" autocomplete="OFF">
                    {* TOKEN INVISIBLE *}
                    <input type="hidden" name="csrf" value="{php} echo $_SESSION['token']; {/php}">
                        <h1>Iniciar sesión</h1>
                        <h6>¿Eres un nuevo usuario? <a href="{$tsConfig.url}/registro/">Crea tu cuenta gratis.</a></h6>
                        <br>
                        <div class="form-group">
                            <input type="nick" class="form-control" placeholder="Nombre de usuario o Email" id="nickname" type="text" for="nickname" name="nick" onfocus="this.removeAttribute('readonly');" readonly>
                        </div>
                        <div class="form-group">
                           <input type="password" class="form-control" placeholder="Contraseña" id="password" name="pass" onfocus="this.removeAttribute('readonly');" readonly>
                        </div>
                        <div class="form-group">
                           <div class="custom-control custom-switch">
                              <input type="checkbox" class="custom-control-input" id="rem" name="rem" value="true" checked="checked">
                              <label class="custom-control-label" for="rem" style="line-height: 1.8em;">Recordarme</label>
                           </div>
                        </div>
                        <div class="d-flex justify-content">
                           <input type="submit" class="btn btn-primary" value="Iniciar Sesi&oacute;n">
                        </div>
                        <div class="auth-footer">
                           <a href="#" onclick="remind_password();" class="float-left">Olvid&eacute; mi contrase&ntilde;a.</a>
                           <a href="#" onclick="resend_validation();" class="float-right">No me lleg&oacute; el email de confirmaci&oacute;n.</a>
                        </div>
                        <p class="nr-term" style="margin-top: 60px;color: grey;display: block;position: relative;font-size: 11px;">
                        Protegido por reCAPTCHA y sujeto a <a href="https://policies.google.com/privacy?hl=es">Política de privacidad</a> y <a href="https://policies.google.com/terms?hl=es">Condiciones del servicio</a> de Google.
                        </p>
                    </form>
                </div>      
            </div>
        </div>
        <div class="col-sm"></div>
    </div>
</div>
{include file='sections/footer.tpl'}