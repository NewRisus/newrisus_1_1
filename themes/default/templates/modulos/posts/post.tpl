<div class="nr-topic">
    <div class="row">
        <div class="col-sm-3 nr-boxi-autor">
            <div class="nr-box-autor">
                <a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
                    <img class="nr-avatar-topic" src="{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg">
                </a>
                <div class="box-autor">
                    <h5>
                        <a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}"><b>{$tsAutor.user_name}</b></a>
                    </h5>
                    <b style="color:#{$tsAutor.rango.r_color}">{$tsAutor.rango.r_name}</b>
                </div>
                <hr class="nr-divider">
                    <div class="nr-ico-autor {if $tsAutor.user_sexo == 0}female{else}male{/if}" title="{$tsAutor.user_name} es {if $tsAutor.user_sexo == 0}mujer{else}hombre{/if}">
                        {if $tsAutor.user_sexo == 0}<i class="fas fa-female"></i>{else}<i class="fas fa-male"></i>{/if}
                    </div>
                    <div class="nr-ico-autor {$tsAutor.status.css}" title="{$tsAutor.status.t}">
                        <i class="fas fa-circle-notch"></i>
                    </div>
                    <span class="flag-icon flag-icon-{$tsAutor.pais.icon}" style="margin: 1px;" title="{$tsAutor.user_name} es de {$tsAutor.pais.name}"></span>
                <hr class="nr-divider">
                <div>
                    <b>{$tsAutor.user_seguidores}</b> seguidores
                </div>
                <div>
                    <b>{$tsAutor.user_posts}</b> topics
                </div>
                <div>
                    <b>{$tsAutor.user_puntos}</b> puntos
                </div>
                <div>
                    <b>{$tsAutor.user_comentarios}</b> comentarios
                </div>
                <hr class="nr-divider">
                {if $tsUser->is_admod || $tsUser->permisos.modu || $tsUser->permisos.mosu}
                    <div style="display: inline-block;position: relative;text-align: center;">
                        <b>Herramientas</b><br>
                        <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$tsPost.post_ip}" target="_blank">IP: {$tsPost.post_ip}</a>
                        {if $tsUser->is_admod == 1}
                            <br><a href="{$tsConfig.url}/admin/users?act=show&amp;uid={$tsAutor.user_id}">Editar Usuario</a>
                        {/if}
                        {if $tsAutor.user_id != $tsUser->uid}
                            <br><a href="#" onclick="mod.users.action({$tsAutor.user_id}, 'aviso', false); return false;">Enviar Aviso</a>
                        {/if}
                        {if $tsAutor.user_id != $tsUser->uid && $tsUser->is_admod || $tsUser->permisos.modu || $tsUser->permisos.mosu}
                            {if $tsAutor.user_baneado}
                                {if $tsUser->is_admod || $tsUser->permisos.modu}
                                <br><a href="#" onclick="mod.reboot({$tsAutor.user_id}, 'users', 'unban', false); $(this).remove(); return false;">Reactivar usuario</a>
                                {/if}
                            {else}
                                {if $tsUser->is_admod || $tsUser->permisos.mosu}
                                <br><a href="#" onclick="mod.users.action({$tsAutor.user_id}, 'ban', false); $(this).remove(); return false;">Suspender usuario</a>
                                {/if}
                            {/if}
				        {/if}
                    </div>
                <hr class="nr-divider">
                {/if}
            </div>
        </div>
        <div class="col-sm-9">
            <div class="nr-contenido-topic">
                <span>Publicado el {$tsPost.post_date|date_format:"%d %B, %Y"}</span>
                <a class="float-right" title="ID de este tema" style="color: #ccc;">#{$tsPost.post_id}</a>
                <div style="padding-top: 1.5em;">
                    <div class="wysibbClass" style="line-height: 1.7em;">
                    {$tsPost.post_body}
                    </div>
                </div>
                {if $tsAutor.user_firma}
                    <div class="nr-firma-topic">
                    {$tsAutor.user_firma}
                    </div>
                {/if}
            </div>
        </div>
    </div>
    <div class="row nr-comment-option">
        <div class="col-sm-6" style="padding-left: 0px;">
            <a class="points-nr" style="color:white !important;" title="Total votos" data-toggle="collapse" href="#collapseVotos" role="button" aria-expanded="false" aria-controls="collapseVotos"><span id="vp_total">{$tsPost.post_puntos}</span> puntos</a>
            {if !$tsPost.vote}
                <span class="assing_points">
                    {if $tsPost.post_user != $tsUser->uid}
                    <button type="button" class="btn btn-sm btn-light positivo" onclick="votar_post(1); return false;" id="vp_pos" title="Votar positivo">
                    <i class="fas fa-thumbs-up positivo"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-light negativo" onclick="votar_post(2); return false;" id="vp_neg" title="Votar negativo">
                    <i class="fas fa-thumbs-down negativo"></i>
                    </button>
                    {/if}
                </span>
            {/if}
        </div>
        <div class="col-sm-6" style="padding-right: 0px;">
            <div class="float-right">
                {if $tsUser->is_member}
                    <a href="#" onclick="add_favoritos(); return false;" class="btn btn-sm btn-light"><i class="far fa-star"></i> Agregar a favoritos</a>
                    <button href="#" onclick="denuncia.nueva('post',{$tsPost.post_id}, '{$tsPost.post_title}', '{$tsPost.user_name}'); return false;" class="btn btn-sm btn-light"><i class="fas fa-exclamation-circle"></i> Denunciar</button>
                    <a href="{if !$tsUser->is_member}javascript:registro_load_form(); return false{else}javascript:notifica.sharePost({$tsPost.post_id}){/if}" style="color: #fff;" class="btn btn-sm btn-dark"><i class="fas fa-share-alt"></i><span class="badge badge-light" style="top: -2px;left: 5px;margin-right: 1px;">{$tsPost.post_shared}</span></a>
                {/if}
            </div>
        </div>
        <div class="col-12">
            <div class="collapse" id="collapseVotos">
                <div class="votoss">
                <h6>Los usuarios que han votado:</h6>
                {foreach from=$tsPost.puntos item=p}
                <a href="{$tsConfig.url}/perfil/{$p.user_name}" style="display:inline-block;"><img src="{$tsConfig.url}/files/avatar/{$p.user_id}_50.jpg" class="avatar-votantes" title="{$p.user_name} ha votado {$p.voto}"></a>
                {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>

<div id="pointsPost">
    <div class="col-12" style="padding-left: 0px; padding-right: 0px;">
        <div class="alert"></div>
    </div>
</div>

{include file='modulos/ads/728.tpl'}




<!--
<div>
    <div>
        <div class="row">
            <div class="col-sm-8">
                <a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
                    <img class="avatari" src="{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg">
                </a>
                <div class="box-autor">
                    <h5>
                        <a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}"><b>{$tsAutor.user_name}</b></a>
                    </h5>
                    <span style="color:grey;">Publicado el {$tsPost.post_date|date_format:"%d %B, %Y"}</span>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="float-right">
                    <div class="dropdown" style="display: inline-block;margin-right: 0.5em;">
                        {if $tsUser->is_member}
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Opciones</button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <h6 class="dropdown-header">Opciones</h6>
                                {if $tsPost.post_user == $tsUser->uid && $tsUser->is_admod == 0 && $tsUser->permisos.most == false && $tsUser->permisos.moayca == false && $tsUser->permisos.moo == false && $tsUser->permisos.moep ==  false && $tsUser->permisos.moedpo == false}
                                <a class="dropdown-item" href="#" onclick="borrar_post(); return false;">Borrar tema</a>
                                <a class="dropdown-item" href="#" onclick="location.href='{$tsConfig.url}/posts/editar/{$tsPost.post_id}'; return false">Editar tema</a>
                                {elseif ($tsUser->is_admod && $tsPost.post_status == 0) || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.moop || $tsUser->permisos.moep || $tsUser->permisos.moedpo}
                                {if $tsUser->is_admod || $tsUser->permisos.most}
                                <a class="dropdown-item" href="#" onclick="mod.reboot({$tsPost.post_id}, 'posts', 'sticky', false); if($(this).text() == 'Poner Sticky') $(this).text('Quitar Sticky'); else $(this).text('Poner Sticky'); return false;">{if $tsPost.post_sticky == 1}Quitar{else}Poner{/if} Sticky</a>
                                {/if}
                                {if $tsUser->is_admod || $tsUser->permisos.moayca}
                                <a class="dropdown-item" href="#" onclick="mod.reboot({$tsPost.post_id}, 'posts', 'openclosed', false); if($(this).text() == 'Cerrar Post') $(this).text('Abrir Post'); else $(this).text('Cerrar Post'); return false;">{if $tsPost.post_block_comments == 1}Abrir{else}Cerrar{/if} tema</a>
                                {/if}
                                {if $tsUser->is_admod || $tsUser->permisos.moop}
                                <a class="dropdown-item" id="desaprobar" href="#" onclick="$('#desapprove').slideToggle(); $(this).fadeOut().remove();">Ocultar tema</a>
                                {/if}
                                {if $tsUser->is_admod || $tsUser->permisos.moedpo || $tsAutor.user_id == $tsUser->uid}
                                <a class="dropdown-item" href="{$tsConfig.url}/posts/editar/{$tsPost.post_id}">Editar tema</a>
                                {/if}
                                {if $tsUser->is_admod || $tsUser->permisos.moep || $tsAutor.user_id == $tsUser->uid}
                                <a class="dropdown-item" href="#" onclick="{if $tsAutor.user_id != $tsUser->uid}mod.posts.borrar({$tsPost.post_id}, 'posts', null);{else}borrar_post();{/if} return false;">Eliminar tema</a>
                                {/if}
                                {/if}
                            </div>
                        {/if}
                    </div>
                    {if !$tsUser->is_member}
                    <a class="btn btn-light btn-sm" style="color: white !important; background: #{$tsPost.categoria.c_color};" href="{$tsConfig.url}/registro/"><i class="fas fa-reply"></i> Responder</a><br>
                    {else}
                    <a class="btn btn-light btn-sm" style="color: white !important; background: #{$tsPost.categoria.c_color};" href="#comentar"><i class="fas fa-reply"></i> Responder</a><br>
                    {/if}
                </div>
            </div>
        </div>
        <div style="padding-top: 1.5em;">
            <div class="wysibbClass" style="line-height: 1.7em;">
            {$tsPost.post_body}
            </div>
        </div>
        {if $tsPost.user_firma && $tsConfig.c_allow_firma}
        <div>
            <footer class="blockquote-footer" style="font-size: 1em;">{$tsPost.user_firma}</footer>
        </div>
        {/if}
        <div class="row" id="pointsPost" style="padding-top: 1em;">
            <div class="col-12">
                <div class="alert"></div>
            </div>
            <div class="col-sm-6">
                <a class="points-nr" style="color:white !important;" title="Total votos" data-toggle="collapse" href="#collapseVotos" role="button" aria-expanded="false" aria-controls="collapseVotos"><span id="vp_total">{$tsPost.post_puntos}</span> puntos</a>

                {if !$tsPost.vote}
                <span class="assing_points">
                    {if $tsPost.post_user != $tsUser->uid}
                    <button type="button" class="btn btn-sm btn-light positivo" onclick="votar_post(1); return false;" id="vp_pos" title="Votar positivo">
                    <i class="fas fa-thumbs-up positivo"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-light negativo" onclick="votar_post(2); return false;" id="vp_neg" title="Votar negativo">
                    <i class="fas fa-thumbs-down negativo"></i>
                    </button>
                    {/if}
                </span>
                {/if}
            </div>
            <div class="col-sm-6">
                <div class="float-right">
                    {if $tsUser->is_member}
                    <a href="#" onclick="add_favoritos(); return false;" class="btn btn-sm btn-light"><i class="far fa-star"></i> Agregar a favoritos</a>
                    <button href="#" onclick="denuncia.nueva('post',{$tsPost.post_id}, '{$tsPost.post_title}', '{$tsPost.user_name}'); return false;" class="btn btn-sm btn-light"><i class="fas fa-exclamation-circle"></i> Denunciar</button>
                    <a href="{if !$tsUser->is_member}javascript:registro_load_form(); return false{else}javascript:notifica.sharePost({$tsPost.post_id}){/if}" style="color: #fff;" class="btn btn-sm btn-dark"><i class="fas fa-share-alt"></i><span class="badge badge-light" style="top: -2px;left: 5px;margin-right: 1px;">{$tsPost.post_shared}</span></a>
                    {/if}
                </div>
            </div>
        </div>
        <div class="collapse" id="collapseVotos">
            <div class="votoss">
            <h6>Los usuarios que han votado:</h6>
            {foreach from=$tsPost.puntos item=p}
            <a href="{$tsConfig.url}/perfil/{$p.user_name}" style="display:inline-block;"><img src="{$tsConfig.url}/files/avatar/{$p.user_id}_50.jpg" class="avatar-votantes" title="{$p.user_name} ha votado {$p.voto}"></a>
            {/foreach}
            </div>
        </div>
    </div>
</div>
-->
{literal}
<style>
    .votoss {
        padding:1em 0em;
    }
    .avatar-votantes {
    border-radius: 50%;
    width: 25px;
    height: 25px;
    float: left;
    display: inline-block;
    position: relative;
    margin-right: 0.2em;
}
</style>
{/literal}