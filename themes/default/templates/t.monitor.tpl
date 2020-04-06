{include file='sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsGlobes}/flags/flag-icon.min.css">
{if $tsAction == ''}
<div class="row">
    <div class="col-xl-8 col-lg-8 col-md-7 col-sm-12 col-12">{include "modulos/monitor/notificaciones.tpl"}</div>
    <div class="col-xl-4 col-lg-4 col-md-5 col-sm-12 col-12">{include "modulos/monitor/m.monitor_sidebar.tpl"}</div>
</div>
{else}
    <ul class="nav justify-content-center nav-pills">
        <li class="nav-item"><a class="nav-link{if $tsAction == 'seguidores'} active{/if}" href="{$tsConfig.url}/monitor/seguidores">Seguidores</a></li>
        <li class="nav-item"><a class="nav-link{if $tsAction == 'siguiendo'} active{/if}" href="{$tsConfig.url}/monitor/siguiendo">Siguiendo</a></li>
        <li class="nav-item"><a class="nav-link{if $tsAction == 'posts'} active{/if}" href="{$tsConfig.url}/monitor/posts">Posts</a></li>
    </ul>
   {include "modulos/monitor/m.monitor_listado.tpl"}
{/if}
{include file='sections/main_footer.tpl'}