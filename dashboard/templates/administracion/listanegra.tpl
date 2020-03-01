<div id="res" class="boxy-content">
   {if $tsSave}<div class="alert alert-success">Tus cambios han sido guardados.</div>{/if}
   {if $tsError}<div class="alert alert-danger">{$tsError}</div>{/if}
   {if !$tsAct}
   {if !$tsBlackList.data}
   <div class="phpostAlfa">No hay nada en tu lista negra.</div>
   <input type="button"  onclick="location.href = '{$tsConfig.url}/admin/blacklist?act=nuevo'" value="Agregar nuevo bloqueo" class="btn btn-success"/>
   {else}
   <div class="table-responsive">
      <table class="table table-data2">
      <thead>
         <th>ID</th>
         <th>Tipo</th>
         <th>Texto</th>
         <th>Raz&oacute;n</th>
         <th>Autor</th>
         <th>Fecha</th>
         <th>Acciones</th>
      </thead>
      <tbody>{foreach from=$tsBlackList.data item=b}
         <tr id="block_{$b.id}">
            <td>{$b.id}</td>
            <td>{if $b.type == 1}IP{elseif $b.type == 2}Email{elseif $b.type == 3}Proveedor{elseif $b.type == 4}Nombre{else}Indefinido{/if}</td>
            <td>{$b.value}</td>
            <td>{$b.reason}</td>
            <td><a href="{$tsConfig.url}/perfil/{$b.user_name}" class="hovercard" uid="{$b.user_id}">{$b.user_name}</a></td>
            <td>{$b.date|hace}</td>
            <td class="admin_actions">
               <a href="{$tsConfig.url}/admin/blacklist?act=editar&id={$b.id}" title="Editar"><i class="fas fa-edit"></i></a>
               <a href="#" onclick="admin.blacklist.borrar({$b.id}); return false" title="Eliminar"><i class="fas fa-times"></i></a>
            </td>
         </tr>{/foreach}
      </tbody>
      <tfoot>
      <td colspan="7">P&aacute;ginas: {$tsBlackList.pages}</td>
      </tfoot>
   </table>
</div>
   <br />
   <input type="button"  onclick="location.href = '{$tsConfig.url}/admin/blacklist?act=nuevo'" value="Agregar nuevo bloqueo" class="btn btn-success"/>
   {/if}
   {elseif $tsAct == 'editar' || $tsAct == 'nuevo'}
   <form action="" method="post" autocomplete="off">
      <fieldset>
         <div class="alert alert-warning">Para bloquear correos masivos como <b>{$tsConfig.titulo|lower|replace:' ': ''}@yahoo.com</b>, seleccione "<i>proveedor de correo<i>" e introduzca yahoo.com en valor.</div>
         <dl>
            <dt><label for="b_type">Tipo:</label></dt>
            <dd>
            <select name="type" class="form-control" id="b_type" style="width:250px">
               <option value="1" {if $tsBL.type == 1}selected{/if}>IP</option>
               <option value="2" {if $tsBL.type == 2}selected{/if}>Email concreto</option>
               <option value="3" {if $tsBL.type == 3}selected{/if}>Proveedor de correo</option>
               <option value="4" {if $tsBL.type == 4}selected{/if}>Nombre</option>
            </select>
            </dd>
         </dl>
         <dl>
            <dt><label for="b_value">Valor:</label></dt>
            <dd><input type="text" class="form-control" id="b_value" name="value" value="{$tsBL.value}" /></dd>
         </dl>
         {if $tsAct == 'nuevo'}
         <dl>
            <dt><label for="b_reason">Raz&oacute;n:</label><span>Indica el motivo por el cual quiere agregarlo a la lista negra.</span></dt>
            <dd><textarea name="reason" class="form-control" id="b_reason" rows="3" cols="40">{$tsBL.reason}</textarea></dd>
         </dl>
         {/if}
         <hr />
         <p><input type="submit" name="{if $tsAct == 'editar'}edit{else}new{/if}" value="{if $tsAct == 'editar'}Guardar{else}Agregar nuevo bloqueo{/if}" class="btn btn-{if $tsAct == 'editar'}info{else}success{/if}"/>
      </fieldset>
   </form>
   {/if}
</div>