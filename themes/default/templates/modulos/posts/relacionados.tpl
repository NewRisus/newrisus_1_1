<div class="nr-home-box">
    <h6><b>Temas relacionados</b></h6>
    <hr class="nr-divider">
    {if $tsRelated}
    {foreach from=$tsRelated item=p}
    <ul>
        <li class="nr-home-comments">
            <a href="{$tsConfig.url}/posts/{$p.c_seo}/" style="background: #{$p.c_color}; color: #fff; border-radius: 3px; width: 15px;font-size: .8em;text-align: center;"><i class="{$p.c_fa}"></i></a>
            <div class="nr-home-comments-content">
                <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html"><b>{$p.post_title|truncate:45}</b></a>
            </div>
        </li>
    </ul>
    {/foreach}
    {else}
    <li>No se encontraron posts relacionados.</li>
    {/if}
</div>