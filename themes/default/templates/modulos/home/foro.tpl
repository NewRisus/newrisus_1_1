{foreach from=$tsHCats item=i}
<div class="nr-home-categorias-padre">
    <h6><b><i class="fab fa-buffer"></i> {$i.name}</b></h6>
    <span class="nr-eye-hom">
        <b onclick="$('#{$i.name|seo}').slideToggle();" title="Ocultar/mostrar categoría"><i class="far fa-eye"></i></b>
    </span>
    <hr class="nr-divider">
    <div id="{$i.name|seo}" class="nr-home-categorias-padre-contenido">
        {foreach from=$i.cats item=c}
        <div class="nr-home-categorias">
            <div class="nr-sector-uno">
                <div class="nr-home-categoria-icono d-none d-sm-none d-md-block" style="background-color: #{$c.c_color}">
                    <i class="{$c.c_fa}"></i>
                </div>
                <div class="nr-home-categoria-titulo">
                    <a rel="dofollow" href="{$tsConfig.url}/posts/{$c.c_seo}/">{$c.c_nombre}</a><br>
                    <span>{$c.c_desc}</span>
                </div>
            </div>
            <div class="nr-sector-dos">
                <div class="nr-categoria-info">
                    <b>{$c.posts|kmg}</b>
                    <span>TEMAS</span>
                </div>
                <div class="nr-categoria-info">
                    <b>{$c.comments|kmg}</b>
                    <span>RESPUESTAS</span>
                </div>
            </div>
            <div class="nr-sector-tres">
                <div class="nr-categoria-activity">
                    {if $c.ultimo}
                    <a href="{$tsConfig.url}/perfil/{$c.ultimo.user_name}/"><img src="{$tsConfig.url}/files/avatar/{$c.ultimo.user_id}_50.jpg"></a>
                    <a href="{$tsConfig.url}/posts/{$c.c_seo}/{$c.ultimo.post_id}/{$c.ultimo.post_title|seo}.html">{$c.ultimo.post_title|truncate:80}</a>
                    <span>{$c.ultimo.post_date|hace}</span>
                    {else}
                    <div class="alert alert-warning nr-categoria-sin-temas" role="alert">
                        No hay temas en esta categoría.
                    </div>
                    {/if}
                </div>
            </div>
        </div>
        {/foreach}
    </div>
</div>
{/foreach}