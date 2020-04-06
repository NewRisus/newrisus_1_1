{if $tsMensajes.data}
<ul class="list-unstyled p-0" id="mpList">
   {foreach from=$tsMensajes.data item=mp}
   <li id="mp_{$mp.mp_id}" class="{if $mp.mp_read_to == 0}bg-warning{/if}">
      <div class="uiGrid media border-bottom border-dark position-relative pb-2">
         <img src="{$tsConfig.url}/files/avatar/{$mp.mp_from}_120.jpg" width="60" height="60" class="align-self-start m-1" alt="{$mp.user_name}">
         <div class="media-body pr-2">
            <small onclick="mensaje.eliminar('{$mp.mp_id}:{$mp.mp_type}',1); return false;" class="font-weight-bolder text-danger float-right mt-1">Borrar</small>
            <h5 class="m-0">{$mp.user_name} </h5>
            <p class="font-weight-bold m-0 p-0"><a href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}">{$mp.mp_subject}</a> <time class="small float-right">{$mp.mp_date|date_format:"%d/%m/%Y"}</time></p>
            <p class="small m-0 p-0"><a href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}">{$mp.mp_preview}</a></p>
               <a href="#" class="position-absolute read" style="bottom: 3px;right: 10px;background-color:none!important;{if $mp.mp_read_to == 1}display:none{/if}" title="Marcar como le&iacute;do" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 0, 1, this); return false;"><i class="read lni lni-checkmark"></i></a>
               <a href="#" class="position-absolute unread" style="bottom: 3px;right: 10px;background-color:none!important;{if $mp.mp_read_to == 0}display:none{/if}" title="Marcar como no le&iacute;do" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 1, 1, this); return false;"><i class="unread lni lni-close"></i></a>
         </div>
      </div>
   </li>
   {/foreach}
</ul>
{else}
<div class="alert alert-warning h5 font-weight-bolder text-center">No hay mensajes</div>
{/if}
<div class="mpFooter">
   {if $tsAction == ''}
   <div class="actions">
      <strong>Ver: </strong> 
      <a href="{$tsConfig.url}/mensajes/{if $tsQT == ''}?qt=unread">No le&iacute;dos{else}">Todos los mensajes{/if}</a>
   </div>
   {/if}
   <div class="paginador">
      {if $tsMensajes.pages.prev != 0}<div style="text-align:left" class="floatL"><a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.prev}{if $tsQT != ''}&qt=unread{/if}">&laquo; Anterior</a></div>{/if}
      {if $tsMensajes.pages.next != 0}<div style="text-align:right" class="floatR"><a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.next}{if $tsQT != ''}&qt=unread{/if}">Siguiente &raquo;</a></div>{/if}
   </div>
   <div class="clearBoth"></div>
</div>