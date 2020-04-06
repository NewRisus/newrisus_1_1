{if $tsMensajes}
<ul class="list-unstyled p-0" id="mpList">
   {foreach from=$tsMensajes item=av}
   <li id="av_{$av.av_id}" {if $av.av_read == 0} class="bg-warning"{/if}>
      <div class="uiGrid media border-bottom border-dark position-relative pb-2">
         <img src="{$tsConfig.images}/icons/avtype_{$av.av_type}.svg" width="60" height="60" class="align-self-start m-1 fill-aviso" alt="{$mp.user_name}">
         <div class="media-body pr-2">
            <small onclick="location.href='{$tsConfig.url}/mensajes/avisos/?did={$av.av_id}'" class="font-weight-bolder text-danger float-right mt-1">Borrar</small>
            <h5 class="m-0">{$tsConfig.titulo}</h5>
            <p class="font-weight-bold m-0 p-0"><a href="{$tsConfig.url}/mensajes/avisos/?aid={$av.av_id}">{$av.av_subject}</a> <time class="small float-right">{$av.av_date|date_format:"%d/%m/%Y"}</time></p>
            <p class="small m-0 p-0"><a href="{$tsConfig.url}/mensajes/avisos/?aid={$av.av_id}">{$av.av_body|truncate:70}</a></p>
         </div>
      </div>
   </li>
   {/foreach}
</ul>
{elseif $tsMensaje.av_id > 0}
<div class="mpRContent">
   <div class="mpHeader">
      <a class="float-right mr-2 mt-2" href="{$tsConfig.url}/mensajes/avisos/?did={$tsMensaje.av_id}">Eliminar</a>
      <h2 class="m-0 p-0">{$tsMensaje.av_subject}</h2>
      <span class="small font-weight-bolder"><a href="{$tsConfig.url}/">{$tsConfig.titulo}</a> - {$tsMensaje.av_date|date_format:"%e %b, %Y"}</span>
   </div>
   <div class="px-2 py-5 chat-box bg-white">
      <div id="historial">
         <!-- Sender Message-->
         <div class="media w-100 mb-3">
            <img src="{$tsConfig.images}/icons/avtype_{$tsMensaje.av_type}.svg" alt="user" width="50" class="rounded-circle fill-aviso">
            <div class="media-body ml-3">
                  <p class="text-small mb-0 text-muted">{$tsMensaje.av_body|nl2br}</p>
            </div>
         </div>
      </div>
   </div>
</div>
{else}
<div class="emptyMensajes">{if $tsMensaje}{$tsMensaje}{else}No hay avisos o alertas{/if}</div>
{/if}