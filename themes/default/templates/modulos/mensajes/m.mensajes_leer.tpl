<div class="mpHeader">
   <span class="h3 d-block" style="margin-bottom: -7px">{$tsMensajes.msg.mp_subject}</span>
   <span class="small font-italic">Entre <a href="{$tsConfig.url}/perfil/{$tsUser->nick}">T&uacute;</a> y <a href="{$tsConfig.url}/perfil/{$tsMensajes.ext.user}">{$tsMensajes.ext.user}</a> </span>
</div>
<div class="px-2 py-5 chat-box bg-white">
   <div id="historial">
   {if $tsMensajes.res}
      {foreach from=$tsMensajes.res item=mp}
         <!-- Sender Message-->
         <div class="media w-50 mb-3{if $mp.user_name == $tsUser->nick} ml-auto{/if}">
            {if $mp.user_name != $tsUser->nick}
            <img onclick="location.href='{$tsConfig.url}/perfil/{$mp.user_name}'" src="{$tsConfig.url}/files/avatar/{$mp.mr_from}_50.jpg" alt="user" width="50" class="rounded-circle" style="cursor:pointer;">
            {/if}
            <div class="media-body ml-3">
               <div class="bg-{if $mp.user_name == $tsUser->nick}primary{else}light{/if} rounded py-2 px-3 mb-2">
                  <p class="text-small mb-0 text-{if $mp.user_name == $tsUser->nick}white{else}muted{/if}">{$mp.mr_body|nl2br}</p>
               </div>
               <p class="small text-muted">{$mp.mr_date|date_format:"🕒 %H:%M %p | 📅 %b %e"} | <a href="{$tsConfig.url}/perfil/{$mp.user_name}">👤 {$mp.user_name}</a>{if $tsUser->is_admod} |<a href="{$tsConfig.url}/moderacion/buscador/1/1/{$mp.mr_ip}">{$mp.mr_ip}</a>{/if}</p>
            </div>
         </div>
      {/foreach}
   {else}
      <li class="emptyData">No se pudieron cargar los mensajes.</li>
   {/if}
   </div>
</div>
{if $tsUser->is_admod || ($tsMensajes.msg.mp_del_to == 0 && $tsMensajes.msg.mp_del_from == 0 && $tsMensajes.ext.can_read == 1)}
   <!-- Typing area -->
   <div class="bg-light">
      <div class="input-group">
         <input type="text" id="respuesta" placeholder="Escribe una respuesta..." class="form-control rounded-0 border-0 py-4 bg-light">
         <input type="hidden" id="mp_id" value="{$tsMensajes.msg.mp_id}" />
         <div class="input-group-append">
            <button onclick="mensaje.responder(); return false;" class="btn btn-link"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 12l11 3.1 7-8.1-8.156 5.672-4.312-1.202 15.362-7.68-3.974 14.57-3.75-3.339-2.17 2.925v-.769l-2-.56v7.383l4.473-6.031 4.527 4.031 6-22z"/></svg></button>
         </div>
      </div>
   </div>
   {else}
   <li class="emptyData">Un participante abandon&oacute; la conversaci&oacute;n o no tienes permiso para responder</li>
{/if}
<style>
.messages-box,
.chat-box {
  height: 610px;
  overflow-y: auto;
}
</style>