<div class="nr-topic">
    <div class="row">
        <div class="col-sm-9">
            <a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
                <img class="nr-iniciado" src="{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg">
            </a>
            <h5>{if $tsPost.post_sticky}<a class="nr-sticky-tema"><i class="fas fa-thumbtack"></i></a>{/if}<b>{$tsPost.post_title}</b></h5>
            <div class="nr-info-iniciado">Iniciado por <a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}"><b>{$tsAutor.user_name}</b></a>, en <b>{$tsPost.categoria.c_nombre}</b> el {$tsPost.post_date|date_format:"%d %B, %Y"}.</div>
            <div class="nr-tag-box">
            {foreach from=$tsPost.post_tags key=i item=tag}
                <a rel="tag" class="nr-tag-info" style="background: #{$tsPost.categoria.c_color};" href="{$tsConfig.url}/buscador/?q={$tag|seo}&e=tags"><span class="nr-tag-punto">&#8226;</span>{$tag}</a>
            {/foreach}
            </div>
        </div>
        <div class="col-sm-3">
        Seguir tema
        </div>
    </div>
</div>