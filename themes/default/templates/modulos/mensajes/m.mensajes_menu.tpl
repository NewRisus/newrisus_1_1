<div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
   <a href="#" class="btn btn-success text-light mx-2 my-3 btn-block" onclick="mensaje.nuevo('','','',''); return false;">Escribir Nuevo Mensaje</a>
   <div class="menu-message" id="admin_menu">
      {if $tsAction != 'avisos' || $tsAction != 'search'}
      <div class="who">Solo <a href="{$tsConfig.url}/perfil/{$tsMensajes.ext.user}">{$tsMensajes.ext.user}</a> y <a href="{$tsConfig.url}/perfil/{$tsUser->nick}">T&uacute;</a></div>
      {/if}
      <form method="get" class="form-group" action="{$tsConfig.url}/mensajes/search/">
         <div class="input-group mb-2">
            <div class="input-group-prepend">
               <div class="input-group-text"><i class="fas fa-search"></i></div>
            </div>
            <input type="text" class="search_mp form-control" name="qm" placeholder="Buscar en Mensajes" title="Buscar en Mensajes" value="{$tsMensajes.texto}">
         </div>
      </form>
      <ul id="mp-menu" class="menu-message-list">
         <li class="mp_inbox{if $tsAction == ''} font-weight-bold{/if}">
            <a href="{$tsConfig.url}/mensajes/">Mensajes Recibidos</a>
         </li>
         <li class="mp_send{if $tsAction == 'enviados'} font-weight-bold{/if}">
            <a href="{$tsConfig.url}/mensajes/enviados/">Mensajes Enviados</a>
         </li>
         <li class="mp_return{if $tsAction == 'respondidos'} font-weight-bold{/if}">
            <a href="{$tsConfig.url}/mensajes/respondidos/">Mensajes Respondidos</a>
         </li>
         {if $tsAction == 'search'}
         <li class="divider"></li>
            <li class="mp_search font-weight-bold">
               <a href="#">Resultados de b&uacute;squeda</a>
            </li>
         <li class="divider"></li>
         {/if}
         <li class="mp_avisos{if $tsAction == 'avisos'} font-weight-bold{/if}">
            <a href="{$tsConfig.url}/mensajes/avisos/">Avisos/Alertas</a>
         </li>
      </ul>
   {if $tsMensajes}<br /><center>{$tsConfig.ads_160}</center>{/if}
   </div>
</div>