{if $tsData}
	{foreach from=$tsData item=noti}
   	<li{if $noti.unread > 0} class="bg-info"{/if}>
   		<span class="monac_icons ma_{$noti.style}"></span>
   		{if $noti.total == 1}
   			<a class="font-weight-bolder" href="{$tsConfig.url}/perfil/{$noti.user}" title="{$noti.user}">{$noti.user}</a>
   		{/if} 
   		{$noti.text} <a title="{$noti.ltit}" class="text-{if $noti.unread > 0}red{else}info{/if} font-weight-bold" href="{$noti.link}">{$noti.ltext}</a>
   	</li>
   {/foreach}
{else}
   <div class="alert alert-warning">No hay notificaciones</div>
{/if}