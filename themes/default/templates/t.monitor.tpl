{include file='sections/main_header.tpl'}
<div class="row">
	{if $tsAction == ''}
    <div class="col-sm-9">
        {include file='modulos/monitor/notificaciones.tpl'}
    </div>
    <div class="col-sm-3">
    {include file='modulos/monitor/m.monitor_sidebar.tpl'}
    </div>
    {else}
	<div class="col-sm-9">
    {include file='modulos/monitor/m.monitor_menu.tpl'}
    </div>
    <div class="col-sm-3">
    {include file='modulos/monitor/m.monitor_listado.tpl'}
    </div>
    {/if}
</div>
                <div style="clear: both;"></div>
                
{include file='sections/main_footer.tpl'}