<h4>Información sobre mí</h4>
<field class="form-groupset">
    <div class="alert-cuenta cuenta-2"></div>
        <div class="field form-group">
            <label for="nombrez">Nombre completo</label>
            <input type="text" value="{$tsPerfil.p_nombre}" maxlength="60" name="nombrez" id="nombrez" class="text cuenta-save-2 form-control">
        </div>
        <div class="field form-group">
            <label for="sitio">Mensaje Personal</label>
            <textarea value="" maxlength="200" name="mensaje" id="mensaje" class="cuenta-save-2 form-control">{$tsPerfil.p_mensaje}</textarea>
        </div>                                
        <div class="field form-group">
            <label for="sitio">Sitio Web</label>
            <input type="text" value="{$tsPerfil.p_sitio}" maxlength="60" name="sitio" id="sitio" class="text cuenta-save-2 form-control">
        </div>
        <div class="field form-group">
            <label for="sitio">Fondo de cabecera</label><br>
            <small>La imagen debe ser de 1300x180px para que se ajuste a la cabecera de tu perfil.</small>
            <input type="text" value="{$tsPerfil.p_cabecera}" maxlength="120" name="cabecera" id="cabecera" class="text cuenta-save-2 form-control">
        </div>    
        <div class="field form-group">
            <label for="ft">Redes sociales</label><br/>
            <b>Facebook</b>
            <input type="text" value="{$tsPerfil.p_socials.f}" maxlength="64" name="facebook" id="ft" class="text cuenta-save-2 form-control"><br />
            <b>Twitter</b><input type="text" value="{$tsPerfil.p_socials.t}" maxlength="64" name="twitter" id="ft2" class="text cuenta-save-2 form-control"><br />
        </div>
        <div class="buttons">
            <input type="button" value="Guardar datos" onclick="cuenta.save(2, true)" class="btn btn-primary">
        </div>
</field>