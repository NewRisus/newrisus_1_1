<header class="header-desktop2">
   <div class="section__content section__content--p30">
      <div class="container-fluid">
         <div class="header-wrap2">
            <div class="logo d-block d-lg-none">
               <div class="logo">
                  <a href="{$tsConfig.url}">{$tsConfig.titulo}</a>
               </div>
            </div>
            <div class="header-button2">
               <div class="header-button-item{if $tsMPs > 0} has-noti{/if}">
                  <i class="zmdi zmdi-email" onclick="location.href='{$tsConfig.url}/mensajes/'" title="{$tsMPs} Mensaje{if $tsMPs > 1}s{/if}"></i>
               </div>
               <div class="header-button-item{if $tsNots > 0} has-noti{/if}">
                  <i class="zmdi zmdi-notifications" onclick="location.href='{$tsConfig.url}/monitor/'" title="{$tsNots} Notification{if $tsNots > 1}es{/if}"></i>
               </div>
               <div class="header-button-item mr-0 js-sidebar-btn"><i class="zmdi zmdi-menu"></i></div>
               <div class="setting-menu js-right-sidebar d-none d-lg-block">
                  <div class="account-dropdown__body">
                     <div class="account-dropdown__item">
                        <a href="{$tsConfig.url}/perfil/{$tsUser->info.user_name}">
                        <i class="zmdi zmdi-account"></i>Mi perfil</a>
                     </div>
                     <div class="account-dropdown__item">
                        <a href="{$tsConfig.url}/cuenta/">
                        <i class="zmdi zmdi-settings"></i>Ajustes de cuenta</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</header>