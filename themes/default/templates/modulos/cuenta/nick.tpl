<h4>Cambio de nick</h4>
<div class="content-tabs cambiar-nick" style="display:none">
<fieldset>
    <div class="alert-cuenta cuenta-8"></div>
    {if $tsUser->info.user_name_changes > 0}
    <p>Hola {$tsUser->nick}, le recordamos que dispone de {$tsUser->info.user_name_changes} cambios este a&ntilde;o. Recuerde que si su cambio no es aprobado, no se le devolver&aacute; la disponibilidad de otro cambio.</p>
    <div class="field form-group">
        <label for="new_nick">Nombre de usuario</label>
        <input type="text" value="{$tsUser->nick}" maxlength="15" name="new_nick" id="new_nick" class="text cuenta-save-8 form-control">
    </div>
    <div class="field form-group">
        <label for="password">Contrase&ntilde;a actual:</label>
        <input type="password" maxlength="32" name="password" id="password" class="text cuenta-save-8 form-control">
    </div>
    <div class="field form-group">
        <label for="pemail">Recibir respuesta en</label>
        <div class="input-fake input-hide-pemail">
            {$tsUser->info.user_email} (<a onclick="input_fake('pemail')">Cambiar</a>)
        </div>
        <input type="text" style="display: none" value="{$tsUser->info.user_email}" maxlength="35" name="pemail" id="pemail" class="text cuenta-save-8 input-hidden-pemail form-control">
    </div>
</fieldset>
    <div class="buttons">
        <input type="button" value="Guardar" onclick="cuenta.save(8)" class="btn btn-primary"/>
    </div>
    {else}
    <p>Hola {$tsUser->nick}, lamentamos informarle de su nula disponibilidad de cambios, contacte con la administraci&oacute;n o espere un a&ntilde;o.
    {/if}
    <div class="clearfix"></div>
</div>