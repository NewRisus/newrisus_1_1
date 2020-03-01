<div class="mpRContent">
   <div class="mpHeader">
      <h2><span class="acciones dno" onclick="$('.mpOptions').toggle();$(this).toggleClass('open','dno');"></span> {$tsMensajes.msg.mp_subject}</h2>
      <div class="mpOptions" style="display:none;">
         <ul class="actions-list">
            <li><a href="#" onclick="mensaje.marcar('{$tsMensajes.msg.mp_id}:{$tsMensajes.msg.mp_type}', 1, 2, this); return false;">Marcar como no le&iacute;do</a></li>
            <li><a href="#" onclick="mensaje.eliminar('{$tsMensajes.msg.mp_id}:{$tsMensajes.msg.mp_type}',2); return false;">Eliminar</a></li>
            <li><a href="#" onclick="denuncia.nueva('mensaje',{$tsMensajes.msg.mp_id}, '', ''); return false;">Marcar como correo no deseado...</a></li>
            <li><a href="#" onclick="denuncia.nueva('usuario',{if $tsMensajes.msg.mp_from != $tsUser->uid}{$tsMensajes.msg.mp_from}{else}{$tsMensajes.msg.mp_to}{/if}, '', '{if $tsMensajes.msg.mp_from != $tsUser->uid}{$tsMensajes.msg.user_name}{else}{$tsUser->getUsername($tsMensajes.msg.mp_to)}{/if}'); return false">Denunciar a este usuario...</a></li>
             <li><a href="javascript:bloquear({$tsMensajes.ext.uid}, {if $tsMensajes.ext.block}false{else}true{/if}, 'mensajes')" id="bloquear_cambiar">{if $tsMensajes.ext.block}Desbloquear{else}Bloquear{/if} a <u>{$tsMensajes.ext.user}</u>...</a></li>
            <li><a href="{$tsConfig.url}/mensajes/">&laquo; Volver a mensajes</a></li>
         </ul>
      </div>
   </div>
   <div class="mpHistory" id="historial">
      {if $tsMensajes.res}{foreach from=$tsMensajes.res item=mp}
         <div class="main{if $mp.user_name != $tsUser->nick}1{else}2{/if} both">
            {if $mp.user_name != $tsUser->nick}
            <div class="autor-image">
               <a href="{$tsConfig.url}/perfil/{$mp.user_name}">
                  <img src="{$tsConfig.url}/files/avatar/{$mp.mr_from}_120.jpg" />
               </a>
            </div>
            {/if}
            <div class="messages">
               <div>
                  <a href="{$tsConfig.url}/perfil/{$mp.user_name}" class="autor-name">{$mp.user_name}</a>
                  <time class="mp-date">{$mp.mr_date|hace} {if $tsUser->is_admod}(<a href="{$tsConfig.url}/moderacion/buscador/1/1/{$mp.mr_ip}">{$mp.mr_ip}</a>){/if}</time>
                  <div class="body">{$mp.mr_body|nl2br}</div>
               </div>
            </div>
            {if $mp.user_name == $tsUser->nick}
            <div class="autor-image">
               <a href="{$tsConfig.url}/perfil/{$mp.user_name}">
                  <img src="{$tsConfig.url}/files/avatar/{$mp.mr_from}_120.jpg" />
               </a>
            </div>
            {/if}
         </div>
      {/foreach}{else}
      <li class="emptyData">No se pudieron cargar los mensajes.</li>
      {/if}
   </div>
   {if $tsUser->is_admod || ($tsMensajes.msg.mp_del_to == 0 && $tsMensajes.msg.mp_del_from == 0 && $tsMensajes.ext.can_read == 1)}
   <div class="mpForm">
      <div class="form">
         <textarea id="respuesta" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="Escribe una respuesta..." class="autogrow onblur_effect">Escribe una respuesta...</textarea>
         <input type="hidden" id="mp_id" value="{$tsMensajes.msg.mp_id}" />
         <a class="btn btn-info text-white resp" onclick="mensaje.responder(); return false;">Responder</a>
      </div>
   </div>
   {else}
   <li class="emptyData">Un participante abandon&oacute; la conversaci&oacute;n o no tienes permiso para responder</li>
   {/if}
</div>