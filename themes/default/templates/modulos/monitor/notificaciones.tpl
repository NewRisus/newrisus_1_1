<div>
    <h3><b>Notificaciones</b></h3>
    <p>Revisa tus últimas notificaciones.</p>
    {if $tsData.data}    
    <b>ÚLTIMAS NOTIFICACIONES RECIBIDAS</b>
    <ul class="notification-detail listado-content" style="padding: 1.2em;">
        {foreach from=$tsData.data item=noti}
        <div class="row {if $noti.unread > 0}listado-notis-new{else}listado-notis{/if}">
            <div class="col-sm-1">
                <a href="{$tsConfig.url}/perfil/{$noti.user}">
                    <img src="{$tsConfig.url}/files/avatar/{$noti.avatar}" class="avatar-notis">
                </a>
            </div>
            <div class="col-sm-11">
                <h6>{if $noti.total == 1}<b><a href="{$tsConfig.url}/perfil/{$noti.user}">{$noti.user}</a></b>{/if}
                    <small class="text-muted">{$noti.date|fecha}</small>
                </h6>
                <p class="noti-texto">
                    <span class="monac_icons ma_{$noti.style}"></span>{$noti.text}
                    <a href="{$noti.link}">{$noti.ltext}</a>
                </p>
            </div>
        </div>
        
        {/foreach}
    </ul>
    {else}
    <div class="alert alert-warning" role="alert">
    No hay notificaciones que mostrar.
    </div>
    {/if}
</div>
