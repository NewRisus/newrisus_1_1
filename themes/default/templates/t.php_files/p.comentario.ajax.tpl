{if $tsComments.num > 0}                        	
{foreach from=$tsComments.data item=c} 
<div id="div_cmnt_{$c.cid}" class="nr-topic">
    <span id="citar_comm_{$c.cid}" style="display:none">{$c.c_body}</span>
    <div class="row" id="pp_{$c.cid}" {if $c.c_status == 1 || !$c.user_activo && $tsUser->is_admod}style="opacity:0.5"{/if}>
        <div class="col-sm-3 nr-boxi-autor">
            <div class="nr-box-autor">
                <a href="{$tsConfig.url}/perfil/{$c.user_name}">
                    <img class="nr-avatar-topic" src="{$tsConfig.url}/files/avatar/{$c.c_user}_120.jpg">
                </a>
                <div class="box-autor">
                    <h5>
                        <a href="{$tsConfig.url}/perfil/{$c.user_name}"><b>{$c.user_name}</b></a>
                    </h5>
                    <b style="color:#{$c.r_color}">{$c.r_name}</b>
                </div>
                <hr class="nr-divider">
                    <div class="nr-ico-autor {if $c.user_sexo == 0}female{else}male{/if}" title="{$c.user_name} es {if $c.user_sexo == 0}mujer{else}hombre{/if}">
                        {if $c.user_sexo == 0}<i class="fas fa-female"></i>{else}<i class="fas fa-male"></i>{/if}
                    </div>
                    <span class="flag-icon flag-icon-{$c.user_pais}" style="margin: 1px;" title="{$c.user_name} es de {$c.user_pais}"></span>
                <hr class="nr-divider">
                <div>
                    <b>{$c.user_seguidores}</b> seguidores
                </div>
                <div>
                    <b>{$c.user_posts}</b> topics
                </div>
                <div>
                    <b>{$c.user_puntos}</b> puntos
                </div>
                <div>
                    <b>{$c.user_comentarios}</b> comentarios
                </div>
                <hr class="nr-divider">
            </div>
        </div>
        <div class="col-sm-9">
            <div class="nr-contenido-topic">
                <span>Publicado hace <span style="text-transform: lowercase;">{$c.c_date|hace}</span></span>
                <a class="float-right" title="ID de este comentario" style="color: #ccc;">#{$c.cid}</a>
                <div style="padding-top: 1.5em;">
                    <ul id="ul_cmt_{$c.cid}">
                        <div class="wysibbClass" id="hdn_{$c.cid}" style="line-height: 1.7em;">
                            <p>{$c.c_html}</p>
                        </div>
                    </ul>
                </div>
                {if $c.user_firma}
                    <div class="nr-firma-topic">
                    {$c.user_firma}
                    </div>
                {/if}
                {if $c.c_status == 1 || !$c.user_activo || $c.user_baneado}
                <div id="comment-body-{$c.cid}">
                    <div class="alert alert-danger" role="alert">
                        Escondido {if $c.c_status == 1}por un moderador{elseif $c.user_activo == 0}por pertener a una cuenta desactivada{else}por pertenecer a una cuenta baneada{/if}. 
                        <a href="#" onclick="$('#hdn_{$c.cid}').slideDown(); $(this).parent().slideUp(); return false;">
                            Click para verlo.
                        </a>
                    </div>
                </div>
                {/if}
            </div>
        </div>
    </div>
    <div class="row nr-comment-option">
        <div class="col-sm-6" style="padding-left: 0px;">
            {if $c.c_votos != 0}<span class="points-nr-comentario btn-sm" title="Total votos" id="votos_total_{$c.cid}">{if $c.c_votos >= 0}+{/if}{$c.c_votos} puntos</span>{/if}
                {if $tsUser->uid != $c.c_user && $c.votado == 0 && ($tsUser->permisos.govpp || $tsUser->permisos.govpn || $tsUser->is_admod)}
                {if $tsUser->permisos.govpp || $tsUser->is_admod}
                <button type="button" class="btn btn-sm btn-light dropdo" onclick="comentario.votar({$c.cid},1)">
                    <i class="fas fa-thumbs-up"></i>
                </button>
                {/if}
                {if $tsUser->permisos.govpn || $tsUser->is_admod}
                <button type="button" class="btn btn-sm btn-light dropdo" style="margin-right: 0.4em;margin-left: 0.4em;" onclick="comentario.votar({$c.cid},-1)">
                    <i class="fas fa-thumbs-down"></i>
                </button>
                {/if}
            {/if}
        </div>
        <div class="col-sm-6" style="padding-right: 0px;">
            <div class="float-right">
                <div class="dropdown" style="display: inline-block;margin-right: 0.5em;">
                    {if $tsUser->is_member}
                    <ul id="ul_cmt_{$c.cid}">
                        <button type="button" class="btn btn-sm btn-link dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Opciones</button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <h6 class="dropdown-header">Opciones</h6>
                            {if ($c.c_user == $tsUser->uid && $tsUser->permisos.goepc) || $tsUser->is_admod || $tsUser->permisos.moedcopo}
                            <a class="dropdown-item" onclick="comentario.editar({$c.cid}, 'show')">Editar comentario</a>
                            {/if}
                            {if ($c.c_user == $tsUser->uid && $tsUser->permisos.godpc) || $tsUser->is_admod || $tsUser->permisos.moecp}
                            <a class="dropdown-item" href="#" onclick="borrar_com({$c.cid}, {$c.c_user}, {$c.c_post_id})">Eliminar comentario</a>
                            {/if}
                            {if $tsUser->is_admod || $tsUser->permisos.moaydcp}
                            <a class="dropdown-item" href="#" onclick="ocultar_com({$c.cid}, {$c.c_user});">{if $c.c_status == 1}Mostrar/Ocultar{else}Ocultar/Mostrar{/if}</a>
                            {/if}
                            {if $tsUser->is_member && $tsUser->info.user_id != $c.c_user}
                            <a class="dropdown-item" onclick="mensaje.nuevo('{$c.user_name}','','',''); return false">Enviar Mensaje</a>
                            <a class="dropdown-item" href="javascript:bloquear({$c.c_user}, {if $tsComments.block}false{else}true{/if}, 'comentarios')">{if $tsComments.block}Desbloquear{else}Bloquear{/if}</a>
                            {/if}
                        </div>
                    </ul>
                    {/if}
                </div>
                {if !$tsUser->is_member}
                <a class="btn btn-sm btn-light" href="{$tsConfig.url}/registro/"><i class="fas fa-reply"></i> Responder</a><br>
                {else}
                <a class="btn btn-sm btn-light" onclick="citar_comment({$c.cid}, '{$c.user_name}')"><i class="fas fa-reply"></i> Responder</a><br>
                {/if}
            </div>
        </div>
    </div>
</div>
{/foreach}
{else}
<div class="alert alert-warning" role="alert">Este tema no tiene comentarios, ¡Sé el primero!</div>
{/if}

<div id="nuevos"></div>

{literal}

<script type="text/javascript">

$(function(){

var zIndexNumber = 99;

    $('div.avatar-box').each(function(){

        $(this).css('zIndex', zIndexNumber);

        zIndexNumber -= 1;

    });

});

</script>

{/literal}