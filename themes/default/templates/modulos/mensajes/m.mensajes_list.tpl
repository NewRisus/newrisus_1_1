{if $tsMensajes.data}
<div id="mpList">
   {foreach from=$tsMensajes.data item=mp}
   <div id="mp_{$mp.mp_id}" class="mp-group{if $mp.mp_read_to == 0} unread{/if}">
      <div class="mp-item">
         <a class="mensaje" href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}">
            <img src="{$tsConfig.url}/files/avatar/{$mp.mp_from}_120.jpg" />
            <div class="mp_desc">
               <div class="mp_time">{$mp.mp_date|fecha:'d_Ms_a'}</div>
               <div class="autor">{$mp.user_name}</div>
               <div class="subject">{$mp.mp_subject}</div>
               <div class="preview">{if $mp.mp_type == 1}<i class="return"></i>{/if}{$mp.mp_preview}</div>
            </div>
         </a>
      </div>
      <div class="mp-item">
         <a href="#" class="read" title="Marcar como le&iacute;do" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 0, 1, this); return false;" {if $mp.mp_read_to == 1}style="display:none"{/if}><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0v24h24v-24h-24zm10.041 17l-4.5-4.319 1.395-1.435 3.08 2.937 7.021-7.183 1.422 1.409-8.418 8.591z"/></svg></a>
         <a href="#" class="unread" title="Marcar como no le&iacute;do" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 1, 1, this); return false;" {if $mp.mp_read_to == 0}style="display:none"{/if}><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M22 2v20h-20v-20h20zm2-2h-24v24h24v-24z"/></svg></a>
         <a href="#" title="Eliminar" onclick="mensaje.eliminar('{$mp.mp_id}:{$mp.mp_type}',1); return false;"><svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M24 21h-17l-7-7.972 7-8.028h17v16zm-16.09-14l-5.252 6.023 5.247 5.977h14.095v-12h-14.09zm6.09 4.586l2.586-2.586 1.414 1.414-2.586 2.586 2.586 2.586-1.414 1.414-2.586-2.586-2.586 2.586-1.414-1.414 2.586-2.586-2.586-2.586 1.414-1.414 2.586 2.586z"/></svg></a>
      </div>
   </div>
   {/foreach}
</div>
{else}
<div class="emptyMensajes">No hay mensajes</div>
{/if}
<div class="mpFooter">
   <div class="actions">{if $tsAction == ''}<strong>Ver: </strong> {if $tsQT == ''}<a href="{$tsConfig.url}/mensajes/?qt=unread">No le&iacute;dos</a>{else}<a href="{$tsConfig.url}/mensajes/">Todos los mensajes</a>{/if}{/if}</div>
   <div class="paginador">
      {if $tsMensajes.pages.prev != 0}<div style="text-align:left" class="floatL"><a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.prev}{if $tsQT != ''}&qt=unread{/if}">&laquo; Anterior</a></div>{/if}
      {if $tsMensajes.pages.next != 0}<div style="text-align:right" class="floatR"><a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.next}{if $tsQT != ''}&qt=unread{/if}">Siguiente &raquo;</a></div>{/if}
   </div>
   <div class="clearBoth"></div>
</div>