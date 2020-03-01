{include file='sections/main_header.tpl'}
<div class="d-flex justify-content-center align-items-center" id="main">
    <h3 class="mr-3 pr-3 align-top border-right inline-block align-content-center">Error 404</h3>
    <div class="inline-block align-middle">
    	<h2 class="font-weight-normal lead" id="desc">No se encontró la página solicitada.</h2>
    </div>
</div>


				<div class="post-{$tsAviso.0}">
                    <h3>{$tsAviso.1}</h3>
                    Pero no pierdas las esperanzas, no todo est&aacute; perdido, la soluci&oacute;n est&aacute; en:
                    <h4>Post Relacionados</h4>
                    <ul>
                        {if $tsRelated}
                        {foreach from=$tsRelated item=p}
                        <li class="categoriaPost {$p.c_seo}">
                            <a class="{if $p.post_private}categoria privado{/if}"title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" rel="dc:relation">{$p.post_title}</a>
                        </li>
                        {/foreach}
                        {else}
                        <li>No se encontraron posts relacionados.</li>
                        {/if}
                    </ul>
                </div>
                
{include file='sections/main_footer.tpl'}