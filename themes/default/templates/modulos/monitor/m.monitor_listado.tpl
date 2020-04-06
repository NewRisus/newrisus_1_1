{if $tsData}
<ul class="list-unstyled listado">
    {if $tsAction == 'seguidores' || $tsAction == 'siguiendo'}
    {foreach from=$tsData.data item=u}
    <li>
        <div class="listado-content">
            <div class="listado-avatar">
                <a href="{$tsConfig.url}/perfil/{$u.user_name}"><img src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/></a>
            </div>
            <div class="txt">
                <a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a><br />
                <i class="flag-icon flag-icon-{$u.user_pais|lower}"></i> <span class="grey">{$u.p_mensaje}</span>
            </div>
            <div class="d-flex justify-content-center align-content-center">
                <div{if $u.follow == 0 && $tsAction != 'siguiendo'} style="display: none;"{/if} class="font-weight-bold text-danger ruser{$u.user_id}"><a title="Dejar de seguir" onclick="notifica.unfollow('user', {$u.user_id}, notifica.ruserInAdminHandle, this)">Dejar de seguir</a></div>
                <div{if $u.follow == 1 || $tsAction == 'siguiendo'} style="display: none;"{/if} class="font-weight-bold text-success ruser{$u.user_id}"><a title="Seguir usuario" onclick="notifica.follow('user', {$u.user_id}, notifica.ruserInAdminHandle, this)">Seguir usuario</a></div>
            </div>
        </div>
    </li>
    {/foreach}
    {elseif $tsAction == 'posts'}
    {foreach from=$tsData.data item=p}
    <li>
        <div class="listado-content clearfix">
            <div class="listado-avatar">
                <a href="{$tsConfig.url}/perfil/{$p.user_name}"><img src="{$tsConfig.url}/files/avatar/{$p.post_user}_50.jpg"/></a>
            </div>
            <div class="txt">
                <a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.f_id}/{$p.post_title|seo}.html">{$p.post_title}</a><br />
                <img src="{$tsConfig.images}/icons/cat/{$p.c_img}"/> <span class="grey">{$p.c_nombre}</span>
            </div>
        </div>
        <div class="action">
            <div class="font-weight-bold text-danger list{$p.f_id}">
                <a title="Dejar de seguir" onclick="notifica.unfollow('post', {$p.f_id}, notifica.ruserInAdminHandle, this)">Dejar de seguir</a>
            </div>
            <div style="display: none;" class="font-weight-bold text-success list{$p.f_id}">
                <a title="Seguir post" onclick="notifica.follow('post', {$p.f_id}, notifica.ruserInAdminHandle, this)">Seguir post</a>
            </div>
        </div>
    </li>
    {/foreach}
    {/if}
    {if $tsData.pages}
    <li class="listado-paginador clearfix">
        {if $tsData.pages.prev != 0}<a href="{$tsConfig.url}/monitor/{$tsAction}?page={$tsData.pages.prev}" class="anterior-listado floatL">Anterior</a>{/if}
        {if $tsData.pages.next != 0}<a href="{$tsConfig.url}/monitor/{$tsAction}?page={$tsData.pages.next}" class="siguiente-listado floatR">Siguiente</a>{/if}
    </li>
    {/if}
</ul>
{else}
<div class="emptyData">Nada por aqu&iacute;</div>
{/if}