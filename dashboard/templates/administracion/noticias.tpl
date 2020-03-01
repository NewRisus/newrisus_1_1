<div id="res" class="boxy-content">
	{if $tsSave}<div class="alert alert-success">Tus cambios han sido guardados.</div>{/if}{if $tsDelete == 'true'}<div class="alert alert-danger">Noticia eliminada.</div>{/if}
	{if $tsAct == ''}
	Si necesitas hacer un comunicado a todos los usuarios en general, desde aqu&iacute; podr&aacute;s administrar tus anuncios y los usuarios sin importar donde se encuentren navegando podr&aacute;n visualizarlos.
	<hr class="separator" />
	<b>Lista de noticias</b>
	<div class="table-responsive">
      <table class="table table-data2">
		<thead>
			<th>ID</th>
			<th>Noticia</th>
			<th>Autor</th>
			<th>Fecha</th>
			<th>Estado</th>
			<th>Acciones</th>
		</thead>
		<tbody>
			{foreach from=$tsNews item=n}
			<tr>
				<td>{$n.not_id}</td>
				<td>{$n.not_body}</td>
				<td><a href="{$tsConfig.url}/perfil/{$n.user_name}" uid="{$n.user_id}">{$n.user_name}</a></td>
				<td>{$n.not_date|hace:true}</td>
				<td id="status_noticia_{$n.not_id}">{if $n.not_active == 0}<font color="purple">Inactiva</font>{else}<font color="green">Activa</font>{/if}</td>
				<td class="admin_actions">
					<a href="{$tsConfig.url}/admin/news/editar/{$n.not_id}" title="Editar"><i class="fas fa-edit"></i></a>
					<a onclick="admin.news.accion({$n.not_id}); return false" title="Activar/Desactivar Noticia"><i class="fas fa-sync"></i></a>
					<a href="{$tsConfig.url}/admin/news?act=borrar&nid={$n.not_id}" title="Borrar"><i class="fas fa-times"></i></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
		<tfoot>
			<th colspan="6" style="text-align:right;"><input type="button" onclick="location.href = '{$tsConfig.url}/admin/news/nueva'" class="btn btn-success" value="Nueva noticia"/></th>
		</tfoot>
	</table>
	</div>
	{elseif $tsAct == 'nuevo' || $tsAct == 'editar'}
	<form action="" method="post" autocomplete="off">
		<fieldset>
			<legend>{if $tsAct == 'nuevo'}Agregar nueva{else}Editar{/if} noticia</legend>
			<dl>
				<dt><label for="ai_new">Noticia:</label><span>Puedes utilizar los siguentes BBCodes [url], [i] [b] y [u]. El m&aacute;ximo de caracteres permitidos es de <b>190</b>.</span></dt>
				<dd><textarea name="not_body" class="form-control" id="ai_new" rows="3" cols="50">{$tsNew.not_body}</textarea></dd>
			</dl>
			<dl>
				<dt><label for="ai_not_active">Activar noticia:</label><span>Activar inmediatamente esta noticia en {$tsConfig.titulo}.</span></dt>
				<dd>
               <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="ai_not_active" name="not_active" class="custom-control-input" value="1"{if $tsNew.not_active == 1 } checked="checked"{/if}>
                  <label class="custom-control-label" for="ai_not_active">S&iacute;</label>
               </div>
               <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" name="not_active" id="ai_not_active" value="0"{if $tsNew.not_active !=1 } checked="checked"{/if} class="custom-control-input">
                  <label class="custom-control-label" for="ai_not_active">No</label>
               </div> 
				</dd>
			</dl>
			<p><input type="submit" name="save" value="{if $tsAct == 'new'}Agregar noticia{else}Guardar Cambios{/if}" class="btn btn-success"/></p>
		</fieldset>
	</form>
	{elseif $tsAct == 'borrar'}
	<form action="" method="post" id="admin_form" autocomplete="off">
		<center><font color="red">Noticia eliminada</font>
		<hr />
		<input type="button" name="confirm" style="cursor:pointer;" onclick="location.href = '{$tsConfig.url}/admin/news?borrar=true'" value="Volver &#187;" class="btn btn-danger">
		{/if}
	</div>