<div class="col-sm-8">
    <div>
        <h2><b>{$tsPost.post_title}</b></h2>
        <div style="padding-top: 1.5em;">
            <div class="wysibbClass" style="line-height: 1.7em;">
            {$tsPost.post_body}
            </div>
        </div>
        {include file='modulos/posts/comentarios.tpl'}
    </div>
</div>
<div class="col-sm-4">
    <div>
        <h5>Sobre la descarga</h5>
        <br>
        <div>
            <div class="pruebaa" style="font-size: 1.4em;line-height: 17px;">
            <b>Nombre del archivo:</b>
            <span>PHPost Foro v1</span>
            <hr class="dropdown-divider">
            <b>Tipo de archivo:</b>
            <span>Archivo ZIP</span>
            <hr class="dropdown-divider">
            <b>Tamaño del archivo:</b>
            <span>3.5 MB</span>
            <hr class="dropdown-divider">
            <b>Compatibilidad:</b>
            <span>PHPost Risus 1.3</span>, 
            <span>NewRisus 1</span>
            <hr class="dropdown-divider">
            <b>Autor:</b>
            <span>{$tsAutor.user_name}</span>
            <hr class="dropdown-divider">
            <b>Reputación del autor:</b>
            <span>{$tsAutor.user_puntos} puntos positivos</span>
            <hr class="dropdown-divider">
            <b>Servidor:</b>
            <span>MEGA</span>
            <hr class="dropdown-divider">
            </div>
            <button class="btn btn-lg btn-block btn-success">
            Descargar (3.5 MB)
            </button>
            <p style="font-size: .8em;padding-top: 1em;color: grey;">* Todos los enlaces de descarga publicados son de origen externo y {$tsConfig.titulo} no se hace responsable por los archivos que se puedan descargar. La información de la descarga mostrada anteriormente es proporcionada por el autor del tema, y {$tsConfig.titulo} no modifica ni revisa la información entregada.</p>
        </div>
    </div>
</div>



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
<hr class="dropdown-divider">
{literal}
<style>
.pruebaa b {
    display: block;
}
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