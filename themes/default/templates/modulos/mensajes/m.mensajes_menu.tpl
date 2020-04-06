<div class="col-xl-4 col-lg-4 col-md-5 col-sm-12 col-12">   
   {if $tsAction == 'leer'}
   <div class="bg-white p-2 shadow rounded mb-3">
      <div class="nav flex-column nav-pills">
         <a class="nav-link" href="#" onclick="mensaje.marcar('{$tsMensajes.msg.mp_id}:{$tsMensajes.msg.mp_type}', 1, 2, this); return false;">Marcar como no le&iacute;do</a>
         <a class="nav-link" href="#" onclick="mensaje.eliminar('{$tsMensajes.msg.mp_id}:{$tsMensajes.msg.mp_type}',2); return false;">Eliminar Enviados</a>
         <a class="nav-link" href="#" onclick="denuncia.nueva('mensaje',{$tsMensajes.msg.mp_id}, '', ''); return false;">Marcar como correo no deseado...</a>
         <a class="nav-link" href="#" onclick="denuncia.nueva('usuario',{if $tsMensajes.msg.mp_from != $tsUser->uid}{$tsMensajes.msg.mp_from}{else}{$tsMensajes.msg.mp_to}{/if}, '', '{if $tsMensajes.msg.mp_from != $tsUser->uid}{$tsMensajes.msg.user_name}{else}{$tsUser->getUsername($tsMensajes.msg.mp_to)}{/if}'); return false">Denunciar a este usuario...</a>
         <a class="nav-link" href="javascript:bloquear({$tsMensajes.ext.uid}, {if $tsMensajes.ext.block}false{else}true{/if}, 'mensajes')" id="bloquear_cambiar">{if $tsMensajes.ext.block}Desbloquear{else}Bloquear{/if} a <u>{$tsMensajes.ext.user}</u>...</a>
         <a class="nav-link" href="{$tsConfig.url}/mensajes/">Regresar a mensajes</a>
      </div>
   </div>
   {/if}
   <div class="bg-white p-2 shadow rounded mb-3">
      {if $tsAction != 'leer'}
      <form method="get" action="{$tsConfig.url}/mensajes/search/">
         <label class="sr-only" for="inlineFormInputGroup">Username</label>
         <div class="input-group mb-2">
            <input type="text" class="form-control" name="qm" value="{$tsMensajes.texto}" placeholder="Buscar en Mensajes">
            <div class="input-group-prepend">
               <button type="submit" class="input-group-text"><i class="lni lni-search"></i></button>
            </div>
         </div>
      </form>
      {/if}
      <div class="nav flex-column nav-pills">
         <a class="nav-link{if $tsAction == ''} active{/if}" href="{$tsConfig.url}/mensajes/">Mensajes Recibidos</a>
         <a class="nav-link{if $tsAction == 'enviados'} active{/if}" href="{$tsConfig.url}/mensajes/enviados/">Mensajes Enviados</a>
         <a class="nav-link{if $tsAction == 'respondidos'} active{/if}" href="{$tsConfig.url}/mensajes/respondidos/">Mensajes Respondidos</a>
         {if $tsAction == 'search'}
         <a class="nav-link active" href="#">Resultados de b&uacute;squeda</a>
         {/if}
         <a class="nav-link" href="#new-message" onclick="mensaje.nuevo('','','',''); return false;">Escribir Nuevo Mensaje</a>
         <a class="nav-link{if $tsAction == 'avisos'} active{/if}" href="{$tsConfig.url}/mensajes/avisos/">Avisos/Alertas</a>
         {if $tsAction == 'search' || $tsAction == 'avisos'}
         <a class="nav-link" href="{$tsConfig.url}/mensajes/{if $tsAction == 'avisos'}avisos/">&laquo; Volver a avisos{else}">Regresar a mensajes{/if}</a>
         {/if}
      </div>
   </div>
   {if $tsMensajes}
      <div class="text-center">{include file="modulos/ads/160.tpl"}</div>
   {/if}
</div>