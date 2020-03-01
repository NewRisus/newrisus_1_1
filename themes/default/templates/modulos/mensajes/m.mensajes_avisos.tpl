{if $tsMensajes}
<div id="mpList">
   {foreach from=$tsMensajes item=av}
   <div id="av_{$av.av_id}" class="mp-group{if $av.av_read == 0} unread{/if}">
      <div class="mp-item">
         <a class="mensaje" href="{$tsConfig.url}/mensajes/avisos/?aid={$av.av_id}">
            <img src="{$tsConfig.images}/icons/avtype_{$av.av_type}.png" />
            <div class="mp_desc">
               <div class="mp_time">{$av.av_date|fecha}</div>
               <div class="autor">{$tsConfig.titulo}</div>
               <div class="subject">{$av.av_subject}</div>
               <div class="preview">{$av.av_body|escape|truncate:120}</div>
            </div>
         </a>
      </div>
      <div class="mp-item">
         <a href="{$tsConfig.url}/mensajes/avisos/?did={$av.av_id}" title="Eliminar"><svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M24 21h-17l-7-7.972 7-8.028h17v16zm-16.09-14l-5.252 6.023 5.247 5.977h14.095v-12h-14.09zm6.09 4.586l2.586-2.586 1.414 1.414-2.586 2.586 2.586 2.586-1.414 1.414-2.586-2.586-2.586 2.586-1.414-1.414 2.586-2.586-2.586-2.586 1.414-1.414 2.586 2.586z"/></svg></a>
      </div>
   </div>
   {/foreach}
</div>
{elseif $tsMensaje.av_id > 0}
<div class="mpRContent">
   <div class="mpHeader mpAviso" style="background-image: url('{$tsConfig.images}/icons/avtype_{$tsMensaje.av_type}.png');">
      <h2>{$tsMensaje.av_subject}</h2>
      <span class="info">
         <a href="{$tsConfig.url}">{$tsConfig.titulo}</a> - {$tsMensaje.av_date|hace}
      </span>
   </div>
   <ul class="mpHistory row" id="historial">
      <li class="col-sm-9">
         <div class="main clearBoth">
            <div class="mensaje">
               <div><a href="{$tsConfig.url}/perfil/{$mp.user_name}" class="autor-name">{$mp.user_name}</a> </div>
               <div>{$tsMensaje.av_body|nl2br}</div>
            </div>
         </div>
      </li>
      <div class="col-sm-3 mpOptions">
         <div class="info"><h2>Acciones</h2></div>
         <ul class="actions-list">
            <li><a href="{$tsConfig.url}/mensajes/avisos/?did={$tsMensaje.av_id}">Eliminar</a></li>
            <li class="div"></li>
            <li><a href="{$tsConfig.url}/mensajes/avisos/">&laquo; Volver a avisos</a></li>
         </ul>
      </div>
   </ul>
</div>
<div class="clearBoth"></div>
{else}
<div class="emptyMensajes">{if $tsMensaje}{$tsMensaje}{else}No hay avisos o alertas{/if}</div>
{/if}