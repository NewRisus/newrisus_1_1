<div class="content-tabs cuenta">
    <h4>Ajustes de cuenta</h4>
    <div class="alert-cuenta cuenta-1"></div>
    <form>
        <div class="field form-group">
            <label for="email">E-Mail:</label>
            <div class="input-fake input-hide-email">
            {$tsUser->info.user_email} (<a onclick="input_fake('email')">Cambiar</a>)
            </div>
            <input type="text" style="display: none" value="{$tsUser->info.user_email}" maxlength="35" name="email" id="email" class="text cuenta-save-1 input-hidden-email form-control">
        </div>
        <div class="field form-group">
            <label for="pais">Pa&iacute;s:</label>
            <select onchange="cuenta.chgpais()" class="cuenta-save-1 form-control" name="pais" id="pais">
                <option value="">Pa&iacute;s</option>
                {foreach from=$tsPaises key=code item=pais}
                <option value="{$code}" {if $code == $tsPerfil.user_pais}selected="selected"{/if}>{$pais}</option>
                {/foreach}
            </select>
        </div>
        <div class="field form-group">
            <label for="estado">Estado/Provincia:</label>
            <select name="estado" id="estado" class="cuenta-save-1 form-control">
                {foreach from=$tsEstados key=code item=estado}
                <option value="{$code+1}" {if $code+1 == $tsPerfil.user_estado}selected="selected"{/if}>{$estado}</option>
                {/foreach}
            </select>
        </div>
        <div class="field form-group">
            <label for="sexo">Sexo:</label>
            <select name="sexo" id="sexo" class="cuenta-save-1 form-control">
                <option value="m" name="sexo" {if $tsPerfil.user_sexo == '1'}selected="selected"{/if}>Masculino</option>
                <option value="f" name="sexo" {if $tsPerfil.user_sexo == '0'}selected="selected"{/if}>Femenino</option>
            </select>
        </div>
        <div class="field form-group">
            <label>Fecha de nacimiento:</label>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <select class="cuenta-save-1 form-control" name="dia">
                        {section name=dias start=1 loop=32}
                        <option value="{$smarty.section.dias.index}" {if $tsPerfil.user_dia ==  $smarty.section.dias.index}selected="selected"{/if}>{$smarty.section.dias.index}</option>
                        {/section}                            
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <select class="cuenta-save-1 form-control" name="mes">
                        {foreach from=$tsMeces key=mid item=mes}
                        <option value="{$mid}" {if $tsPerfil.user_mes == $mid}selected="selected"{/if}>{$mes}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <select class="cuenta-save-1 form-control" name="ano">
                        {section name=year start=$tsEndY loop=$tsEndY step=-1 max=$tsMax}
                        <option value="{$smarty.section.year.index}" {if $tsPerfil.user_ano ==  $smarty.section.year.index}selected="selected"{/if}>{$smarty.section.year.index}</option>
                        {/section}
                    </select>
                </div>
            </div>
        </div>
        {if $tsConfig.c_allow_firma}
        <div class="field form-group">
            <label for="firma">Firma</label>
            <textarea name="firma" id="firma" class="cuenta-save-1 form-control">{$tsPerfil.user_firma}</textarea>
            <small id="firma" class="form-text text-muted">Máximo 300 caracteres, acepta BBCodes.</small>
        </div>
        {/if}    
    </form>
    <div class="buttons">
        <input type="button" value="Guardar" onclick="cuenta.save(1)" class="btn btn-primary">
    </div>
    <div class="clearfix"></div>
</div>