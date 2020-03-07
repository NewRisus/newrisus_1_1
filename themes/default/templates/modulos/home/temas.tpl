<div class="nr-home-categorias-padre">
    <h6 style="color: #{$Color};"><b>{if $tsCat}<i class="fa fa-{$Icono}"></i> {$Categoria}{/if}</b></h6>
    <p class="nr-des-categoria">{$Descripcion}</p>
    <hr class="nr-divider">
    <div class="nr-home-categorias-padre-contenido">
    {if $tsPostsStickys}
        <h6 class="nr-title-categoria">TEMAS FIJADOS</h6>
        {foreach from=$tsPostsStickys item=p}
        <div class="nr-last-temas">
            <div class="nr-categoria-left d-none d-sm-none d-md-block">
                <a href="{$tsConfig.url}/perfil/{$p.user_name}">
                    <img src="{$tsConfig.url}/files/avatar/{$p.post_user}_50.jpg" class="nr-categoria-avatar">
                </a>
                <span class="fijado-post" title="Tema fijado"><i class="fas fa-thumbtack"></i></span>
            </div>
            <div class="nr-categoria-right">
                <div class="float-left" style="width: 100%;">
                    <h6 class="nr-categoria-title">{if $p.post_private}<span class="tema-privado" title="Tema privado"><i class="fas fa-lock"></i></span>{/if}<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html"><b>{$p.post_title}</b></a></h6>
                    <span>Publicado por </span><a href="{$tsConfig.url}/perfil/{$p.user_name}"><b>{$p.user_name}</b></a> <span style="text-transform:lowercase;">{$p.post_date|hace}</span><span class="d-block d-sm-block d-md-none"> en <a href="{$tsConfig.url}/posts/{$p.c_seo}/">{$p.c_nombre}</a></span>
                    <span>{$p.post_body}</span>
                </div>
                <div class="float-right d-none d-sm-none d-md-block">
                    {if $p.post_sponsored}
                    <div class="nr-tema-spon">
                        <a href="{$tsConfig.url}/posts/{$p.c_seo}/"><span class="badge badge-primary badge-categoria-inicio" style="background: #{$p.c_color}; border-radius:.25rem 0rem 0rem .25rem;"><i class="{$p.c_fa}"></i> {$p.c_nombre}</span></a><span class="badge badge-primary badge-categoria-inicio" style="border-radius: 0rem .25rem .25rem 0rem;background: #FFAB00;"><i class="far fa-star"></i> Sponsored</span>
                    </div>
                    {else}
                    <a href="{$tsConfig.url}/posts/{$p.c_seo}/"><span class="badge badge-primary badge-categoria-inicio" style="background: #{$p.c_color};"><i class="{$p.c_fa}"></i> {$p.c_nombre}</span></a>
                    {/if}<br>
                    <span style="float: right;padding: .2em 0em;font-weight: 600;font-size: 1.2em;"><i class="far fa-comments"></i> {$p.post_comments}</span>
                </div>
            </div>
        </div>
        {/foreach}
    <hr class="nr-divider">
    {/if}
    {if $tsPosts}
    <h6 class="nr-title-categoria">ÚLTIMOS TEMAS</h6>
    {foreach from=$tsPosts item=p}
        <div class="nr-last-temas">
            <div class="nr-categoria-left d-none d-sm-none d-md-block">
                <a href="{$tsConfig.url}/perfil/{$p.user_name}">
                    <img src="{$tsConfig.url}/files/avatar/{$p.post_user}_50.jpg" class="nr-categoria-avatar">
                </a>
            </div>
            <div class="nr-categoria-right">
                <div class="float-left" style="width: 100%;">
                    <h6 class="nr-categoria-title">{if $p.post_private}<span class="tema-privado" title="Tema privado"><i class="fas fa-lock"></i></span>{/if}<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html"><b>{$p.post_title}</b></a></h6>
                    <span>Publicado por </span><a href="{$tsConfig.url}/perfil/{$p.user_name}"><b>{$p.user_name}</b></a> <span style="text-transform:lowercase;">{$p.post_date|hace}</span><span class="d-block d-sm-block d-md-none"> en <a href="{$tsConfig.url}/posts/{$p.c_seo}/">{$p.c_nombre}</a></span>
                </div>
                <div class="float-right d-none d-sm-none d-md-block">
                    <div class="nr-tema-spon">
                    <a href="{$tsConfig.url}/posts/{$p.c_seo}/"><span class="badge badge-primary badge-categoria-inicio" style="background: #{$p.c_color};"><i class="{$p.c_fa}"></i> {$p.c_nombre}</span></a>
                    </div>
                    <br>
                    <span style="float: right;padding: .2em 0em;font-weight: 600;font-size: 1.2em;"><i class="far fa-comments"></i> {$p.post_comments}</span>
                </div>
            </div>
        </div>
    {/foreach}
    {else}
    <div class="alert alert-warning" role="alert">Aún no hay temas en esta categoría.</div>
    {/if}
    </div>
</div>


<div class="footer size13">
{if $tsPages.prev > 0 && $tsPages.max == false}<a href="pagina{$tsPages.prev}" class="floatL">&laquo; Anterior</a>{/if}
{if $tsPages.next <= $tsPages.pages}<a href="pagina{$tsPages.next}" class="floatR">Siguiente &raquo;</a>
{elseif $tsPages.max == true}<a href="pagina2">Siguiente &raquo;</a>{/if}
</div>

{literal}
<style type="text/css">
    .titulo-temas {
    color: #90A4AE;
    padding: 0.5em 0em;
    font-size: 1.1em;
}
    .titulo-temas:hover {
        color: #607D8B;
    }
</style>
{/literal}