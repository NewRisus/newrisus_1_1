{if $tsAction == 'denuncia-post'}
<div>
    <b>Nombre del tema a denunciar:</b><br />
    <h6>{$tsData.obj_title}</h6><br />
    <b>Razón de la denuncia:</b><br />
    <select name="razon" class="form-control">
    {foreach from=$tsDenuncias key=i item=denuncia}
    	{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
    {/foreach}
    </select><br />
    <b>Aclaraci&oacute;n y comentarios:</b><br />
    <textarea tabindex="6" rows="5" cols="40" name="extras" class="form-control"></textarea><br />
    <small>En el caso de ser Re-post, debe indicar el link del tema original.</small>
</div>
{elseif $tsAction == 'denuncia-foto'}
<div align="center" style="padding:10px 10px 0">
    <b>Denunciar foto:</b><br />
    <h6>{$tsData.obj_title}</h6><br />
    <b>Razón de la denuncia:</b><br />
    <select name="razon" class="form-control">
    {foreach from=$tsDenuncias key=i item=denuncia}
    	{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
    {/foreach}
    </select><br />
    <b>Aclaraci&oacute;n y comentarios:</b><br />
    <textarea tabindex="6" class="form-control" rows="5" cols="40" name="extras"></textarea><br />
    <small>Para atender tu caso r&aacute;pidamente, adjunta pruevas de tu denuncia.<br /> (capturas de pantalla)</small>
</div>
{elseif $tsAction == 'denuncia-mensaje'}
<div class="alert alert-warning" role="alert">Si reportas este mensaje ser&aacute; eliminado de tu bandeja. <br />&iquest;Realmente quieres denunciar este mensaje como correo no deseado?</div>
<input type="hidden" name="razon" value="spam" />
{elseif $tsAction == 'denuncia-usuario'}
<div align="center" style="padding:10px 10px 0">
    <b>Denunciar usuario:</b><br />
    <h6>{$tsData.nick}</h6><br />
    <b>Razón de la denuncia:</b><br />
    <select name="razon" class="form-control">
    {foreach from=$tsDenuncias key=i item=denuncia}
    	{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
    {/foreach}
    </select><br />
    <b>Aclaración y comentarios:</b><br />
    <textarea tabindex="6" class="form-control" rows="5" cols="40" name="extras"></textarea><br />
    <small>Para atender tu caso rápidamente, adjunta pruevas de tu denuncia.<br /> (capturas de pantalla)</small>
</div>
{/if}