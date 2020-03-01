<div id="res" class="boxy-content" style="position:relative">
	{if $tsSave}
    <div class="alert alert-success">Configuraciones guardadas</div>{/if}
	{if $tsAct == ''}
	<div class="table-responsive">
		<table class="table table-data2">
		<thead>
			<th>ID</th>
			<th>Nombre</th>
			<th>Acciones</th>
		</thead>
		<tbody>
			{foreach from=$tsCats item=c}
			<tr>
				<td>{$c.id}</td>
				<td>{$c.name}</td>
				<td class="admin_actions">
					<a href="{$tsConfig.url}/admin/hcats/?act=editar&id={$c.id}" title="Editar Categoria" ><i class="fas fa-edit"></i></a>					
					<a href="{$tsConfig.url}/admin/hcats/?act=borrar&id={$c.id}" title="Borrar cat"><i class="fas fa-times"></i></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
	<input type="button"  onclick="location.href = '{$tsConfig.url}/admin/hcats?act=nueva'" value="Agregar Nueva Categor&iacute;a padre" class="btn btn-success"/>
	{elseif $tsAct == 'nueva'}
	<form action="" method="post">
		<fieldset>
			<dl>
				<dt><label for="hcat_name">Nombre de la categor&iacute;a:</label></dt>
				<dd><input type="text" class="form-control" id="hcat_name" name="h_nombre" value="" /></dd>
			</dl>
			<p><input type="submit" name="save" value="Crear Categor&iacute;a" class="btn btn-success"/></p>
		</fieldset>
	</form>
	{elseif $tsAct == 'editar'}
	<form action="" method="post" autocomplete="off">
		<fieldset>
			<dl>
				<dt><label for="cat_name">Nombre de la categor&iacute;a:</label></dt>
				<dd><input type="text" class="form-control" id="cat_name" name="h_nombre" value="{$tsCat.name}" /></dd>
			</dl>			
			<p><input type="submit" name="save" value="Guardar cambios" class="btn btn-success"/  ></p>
		</fieldset>
	</form>
	{/if}
</div>