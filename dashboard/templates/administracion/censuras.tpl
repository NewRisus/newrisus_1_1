<div id="res" class="boxy-content">
   {if $tsSave}<div class="alert alert-success">Tus cambios han sido guardados.</div>{/if}
   {if $tsError}<div class="alert alert-danger">{$tsError}</div>{/if}
   {if !$tsAct}
   {if !$tsBadWords.data}
   <div class="phpostAlfa">No hay filtros de palabras</div>
   {else}
   <div class="table-responsive">
      <table class="table table-data2">
      <thead>
         <th>ID</th>
         <th>M&eacute;todo</th>
         <th>Tipo</th>
         <th>Antes</th>
         <th>Despu&eacute;s</th>
         <th>Raz&oacute;n</th>
         <th>Autor</th>
         <th>Fecha</th>
         <th>Acciones</th>
      </thead>
      <tbody>{foreach from=$tsBadWords.data item=b}
         <tr id="wid_{$b.wid}">
            <td>{$b.wid}</td>
            <td>{if $b.method == 1}Exacto{else}Parcial{/if}</td>
            <td>{if $b.type == 1}Smiley{else}Texto{/if}</td>
            <td>{$b.word}</td>
            <td>{if $b.type == 1}<img src="{$b.swop}" style="max-width:32px; max-height:32px;"/>{else}{$b.swop}{/if}</td>
            <td>{$b.reason}</td>
            <td><a href="{$tsConfig.url}/perfil/{$b.user_name}" class="hovercard" uid="{$b.user_id}">{$b.user_name}</a></td>
            <td>{$b.date|hace}</td>
            <td class="admin_actions">
               <a href="{$tsConfig.url}/admin/badwords?act=editar&id={$b.wid}" title="Editar"><i class="fas fa-edit"></i></a>
               <a href="#" onclick="admin.badwords.borrar({$b.wid}); return false" title="Eliminar"><i class="fas fa-times"></i></a>
            </td>
         </tr>{/foreach}
      </tbody>
      <tfoot>
      <td colspan="9">P&aacute;ginas: {$tsBadWords.pages}</td>
      </tfoot>
   </table>
</div>
   {/if}
   <br>
   <input type="button"  onclick="location.href = '{$tsConfig.url}/admin/badwords?act=nuevo'" value="Agregar nuevo filtro" class="btn btn-success"/>
   {elseif $tsAct == 'editar' || $tsAct == 'nuevo'}
   <form action="" method="post" autocomplete="off">
      <fieldset>
         <div class="alert">El m&eacute;todo exacto filtra s&oacute;lo palabras completas, mientras que el parcial filtra todas las coincidencias, aunque forme parte de una palabra. Si opta por usar un smiley, introduzca el enlace directo hacia la imagen.</div>
         <dl>
            <dt><label for="bw_before">Antes:</label></dt>
            <dd><input type="text" class="form-control" id="bw_before" name="before" value="{$tsBW.word}" /></dd>
         </dl>
         <dl>
            <dt><label for="bw_after">Despu&eacute;s:</label></dt>
            <dd><input type="text" class="form-control" id="bw_after" name="after" value="{$tsBW.swop}" /></dd>
         </dl>
         <dl>
            <dl>
               <dt><label for="bw_method">M&eacute;todo:</label></dt>
               <dd>
                  <div class="custom-control custom-radio custom-control-inline">
                     <input type="radio" name="method" id="bw_method0" value="0"{if $tsBW.method == 0} checked="checked"{/if} class="custom-control-input">
                     <label class="custom-control-label" for="bw_method0">Parcial</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                     <input type="radio" name="method" id="bw_method1" value="1"{if $tsBW.method == 1} checked="checked"{/if} class="custom-control-input">
                     <label class="custom-control-label" for="bw_method1">Exacto</label>
                  </div>
               </dd>
            </dl>
         </dl>
         <dl>
            <dl>
               <dt><label for="bw_type">Tipo:</label></dt>
               <dd>
                  <div class="custom-control custom-radio custom-control-inline">
                     <input type="radio" name="type" id="bw_type0" value="0"{if $tsBW.type == 0} checked="checked"{/if} class="custom-control-input">
                     <label class="custom-control-label" for="bw_type0">Texto</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                     <input type="radio" name="type" id="bw_type1" value="1"{if $tsBW.type == 1} checked="checked"{/if} class="custom-control-input">
                     <label class="custom-control-label" for="bw_type1">Smiley</label>
                  </div>
               </dd>
            </dl>
         </dl>
         {if $tsAct == 'nuevo'}
         <dl>
            <dt><label for="bw_reason">Raz&oacute;n:</label><span>Indica el motivo por el cual quiere agregar este filtro.</span></dt>
            <dd><textarea name="reason" class="form-control" id="bw_reason" rows="3" cols="40">{$tsBW.reason}</textarea></dd>
         </dl>
         {/if}
         <hr />
         <p><input type="submit" name="{if $tsAct == 'editar'}edit{else}new{/if}" value="{if $tsAct == 'editar'}Guardar{else}Agregar{/if}" class="btn btn-{if $tsAct == 'editar'}info{else}success{/if}"/>
      </fieldset>
   </form>
   {/if}
</div>