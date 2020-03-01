<div id="res" class="boxy-content" style="position:relative">
	{if !$tsAct}
	{if !$tsAdminNicks.data}
	<div class="phpostAlfa">No hay cambios esperando aprobaci&oacute;n</div>
	{else}
   <div class="table-responsive">
      <table class="table table-data2">
		<thead>
			<th>Nick actual</th>
			<th>Nuevo nick</th>
			<th>Fecha</th>
			<th>IP</th>
			<th>Acciones</th>
		</thead>
		<tbody>
			{foreach from=$tsAdminNicks.data item=n}
			<tr id="nick_{$n.id}">
				<td align="left"><a href="{$tsConfig.url}/perfil/{$n.user_name}" class="hovercard" uid="{$n.user_id}">{$n.user_name}</a></td>
				<td>{$n.name_2}</td>
				<td>{$n.time|hace:true}</td>
				<td><a href="https://extreme-ip-lookup.com/{$n.ip}" class="geoip" target="_blank">{$n.ip}</a></td>
				<td class="admin_actions">
					<a href="#" onclick="admin.nicks.accion('{$n.id}', 'aprobar'); return false" title="Aprobar"><i class="fas fa-thumbs-up"></i></a>
					<a href="#" onclick="admin.nicks.accion('{$n.id}', 'denegar'); return false" title="Denegar"><i class="fas fa-power-off"></i></a>
				</td>
			</tr>
			{/foreach}
		</tbody>
		<tfoot>
		<td colspan="7">P&aacute;ginas: {$tsAdminNicks.pages}</td>
		</tfoot>
	</table>
</div>
	{/if}
	<input type="button" onclick="location.href = '{$tsConfig.url}/admin/nicks?act=realizados'" value="Ver decisiones tomadas" class="btn btn-info" />
	{elseif $tsAct == 'realizados'}
	{if !$tsAdminNicks.data}
	<div class="phpostAlfa">No hay cambios hasta ahora</div>
	{else}
   <div class="table-responsive">
      <table class="table table-data2">
		<thead>
			<th>Nick antes</th>
			<th>Nick despu&eacute;s</th>
			<th>Fecha</th>
			<th>Estado</th>
			<th>IP</th>
		</thead>
		<tbody>
			{foreach from=$tsAdminNicks.data item=n}
			<tr id="nick_{$n.id}">
				<td>{$n.name_1}</td>
				<td>{$n.name_2}</td>
				<td>{$n.time|hace:true}</td>
				<td>{if $n.estado == 1}<font color="green">Aprobado</font>{else}<font color="red">Cancelado</font>{/if}</td>
				<td><a href="https://extreme-ip-lookup.com/{$n.ip}" class="geoip" target="_blank">{$n.ip}</a></td>
			</tr>
			{/foreach}
		</tbody>
		<tfoot>
		<td colspan="7">P&aacute;ginas: {$tsAdminNicks.pages}</td>
		</tfoot>
	</table>
</div>
	{/if}
	{/if}
</div>