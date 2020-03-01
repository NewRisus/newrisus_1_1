<div class="nr-home-box">
    <h6><b>Comentarios recientes</b></h6>
    <hr class="nr-divider">
    {foreach from=$tsComments key=i item=c}
    <ul>
        <li class="nr-home-comments">
            <a href="{$tsConfig.url}/perfil/{$c.user_name}/"><img class="nr-home-comments-img" src="{$tsConfig.url}/files/avatar/{$c.user_id}_50.jpg"></a>
            <div class="nr-home-comments-content">
                <a href="{$tsConfig.url}/perfil/{$c.user_name}/"><b style="color: #{$c.r_color};">{$c.user_name}</b></a> <span>comentó {$c_html} en</span> 
                <a href="{$tsConfig.url}/posts/{$c.c_seo}/{$c.post_id}/{$c.post_title|seo}.html"><b>{$c.post_title|truncate:45}</b></a>
            </div>
        </li>
    </ul>
    {/foreach}
</div>