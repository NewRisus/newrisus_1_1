<div class="bg-white shadow p-2 rounded">
    <h2 class="h5">&Uacute;ltimas {$tsData.total} notificaciones</h2>
    {if $tsData.data}
    <ul class="list-unstyled p-0">
        {foreach from=$tsData.data item=noti}
        <li class="monitor-item{if $noti.unread > 0} bg-warning{/if}">
            <div class="avatar-box" style="z-index: 99;">
                <a href="{$tsConfig.url}/perfil/{$noti.user}"><img width="45" height="45" class="mr-3" src="{$tsConfig.url}/files/avatar/{$noti.avatar}"/></a>
            </div>
            <div class="notification-info d-flex justify-content-start align-items-start flex-column">
                <span class=" w-100">{if $noti.total == 1}<a href="{$tsConfig.url}/perfil/{$noti.user}">{$noti.user}</a>{/if}
                    <span title="{$noti.date|hace}" class="small float-right">{$noti.date|hace}</span>
                </span>
                <span class="action small">
                    <span class="monac_icons ma_{$noti.style}"></span>{$noti.text}
                    <a href="{$noti.link}">{$noti.ltext}</a>
                </span>
            </div>
        </li>
    {/foreach}
</ul>
{else}
    <div class="alert alert-warning p-2 font-weight-bolder">No tienes notificaciones</div>
{/if}
</div>