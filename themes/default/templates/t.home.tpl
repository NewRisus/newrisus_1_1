{include file='sections/main_header.tpl'}
{$tsInstall}
<div class="row">
    <div class="col-sm-9">
        {include file='modulos/home/noticias.tpl'}
        {if !$tsCat}
            {include file='modulos/home/foro.tpl'}
        {else}
            {include file='modulos/home/temas.tpl'}
        {/if}
        {include file='modulos/ads/728.tpl'}
    </div>
    <div class="col-sm-3">
        {if !$tsUser->is_member}
        <a class="btn btn-primary btn-sm btn-block btnhome" href="{$tsConfig.url}/registro/"><i class="fas fa-plus-circle"></i> Nuevo tema</a><br>
        {else}
        <a class="btn btn-primary btn-sm btn-block btnhome" href="{$tsConfig.url}/agregar/"><i class="fas fa-plus-circle"></i> Nuevo tema</a><br>
        {/if}
    	{include file='modulos/home/comentarios.tpl'}
    	{include file='modulos/home/temas-simple.tpl'}
    	{include file='modulos/home/ranking.tpl'}
    	<!--{include file='modulos/home/afiliacion.tpl'}-->
    </div>
</div>

<div class="row">
    <div class="col-12">
        {include file='modulos/home/estadisticas.tpl'}
    </div>
</div>
{include file='sections/main_footer.tpl'}