{if $tsPosts}
<div class="nr-home-box">
    <h6><b>Temas recientes</h6>
    <hr class="nr-divider">
    {foreach from=$tsPosts item=p}
    <ul>
        <li class="nr-home-comments">
            <a href="{$tsConfig.url}/perfil/{$p.user_name}/"><img class="nr-home-comments-img" src="{$tsConfig.url}/files/avatar/{$p.post_user}_50.jpg"></a>
            <div class="nr-home-comments-content">
                <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html"><b>{$p.post_title|truncate:45}</b></a> <span>creado por</span> 
                <a href="{$tsConfig.url}/perfil/{$p.user_name}/"><b style="color: #{$c.r_color};">{$p.user_name}</b></a>
            </div>
        </li>
    </ul>
    {/foreach}
</div>
{/if}