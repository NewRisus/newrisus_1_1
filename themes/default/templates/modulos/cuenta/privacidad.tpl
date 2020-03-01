<h4>Ajustes de privacidad</h4>
<div class="content-tabs privacidad" style="display:none">
    <fieldset>
        <div class="alert-cuenta cuenta-7"></div>
        <div class="field form-group">
            <label>Quien puede ver tu muro</label>
            <div class="input-fake">
                <select name="muro" class="cuenta-save-7 form-control">
                    {foreach from=$tsPrivacidad item=p key=i}
                    <option value="{$i}"{if $tsPerfil.p_configs.m == $i} selected="true"{/if}>{$p}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        {$tsPerfil.p_configs.muro}
        <div class="field form-group">
            <label>Quien puede escribir en tu muro</label>
            <div class="input-fake">
                <select name="muro_firm" class="cuenta-save-7 form-control">
                    {foreach from=$tsPrivacidad item=p key=i}
                    {if $i != 6}<option value="{$i}"{if $tsPerfil.p_configs.mf == $i}selected{/if}>{$p}</option>{/if}
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="field form-group">
            <label>Quien puede ver tus últimas visitas</label>
            <div class="input-fake">
                <select name="last_hits" class="cuenta-save-7 form-control">
                    {foreach from=$tsPrivacidad item=p key=i}
                    {if $i != 1 && $i != 2}<option value="{$i}"{if $tsPerfil.p_configs.hits == $i}selected{/if}>{$p}</option>{/if}
                    {/foreach}
                </select>
            </div>
        </div>
        {if !$tsUser->is_admod}
        {if $tsPerfil.p_configs.rmp != 8}
        <div class="field form-group">
            <label>Quien puede enviarte mensajes privados</label>
            <div class="input-fake">
                <select name="rec_mps" class="cuenta-save-7 form-control">
                    {foreach from=$tsPrivacidad item=p key=i}
                    {if $i != 6}<option value="{$i}"{if $tsPerfil.p_configs.rmp == $i}selected{/if}>{$p}</option>{/if}
                    {/foreach}
                </select>
            </div>
        </div>
        {else}
        <div class="alert alert-danger" role="alert">Algunas opciones de su privacidad han sido deshabilitadas, contacte con la administración.</div>
        {/if}
        {/if}
    </fieldset>
    {if !$tsUser->is_admod}
	<a onclick="$('#primi').slideUp(); $('#passi').slideDown(); $('#informa').slideDown(); $('#btninforma').slideDown();" id="primi">Desactivar Cuenta</a>
    <p style="display:none;" id="informa"> Si desactiva su cuenta, todo el contenido relacionado a usted dejar&aacute; de ser visible durante un tiempo. Pasado ese tiempo, la administraci&oacute;n borrar&aacute; todo su contenido y no podr&aacute; recuperarlo.</p>
    <a onclick="desactivate()" style="display:none;" id="btninforma"><input type="button" value="Lo s&eacute;, pero quiero desactivarla" style="position:right;" class="mBtn btnDelete"></a>
	{/if}
    <div class="buttons">
        <input type="button" value="Guardar" onclick="cuenta.save(7)" class="btn btn-primary">
    </div>
    <div class="clearfix"></div>
</div>