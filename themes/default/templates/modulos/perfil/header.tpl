<div class="col-sm">
</div>    
<div class="col-sm-1">
    <div>
        <img src="{$tsConfig.url}/files/avatar/{if $tsInfo.p_avatar}{$tsInfo.uid}_120{else}avatar{/if}.jpg" class="avatar-perfil">
    </div>
</div>
<div class="col-sm-9">
    <div class="float-right">
        <div class="btn-toolbar">
            <!-- REDES SOCIALES -->
            <div class="btn-group" style="padding-right:0.8rem;">
                {if $tsInfo.p_socials.f}
                <button type="button" class="btn btn-sm btn-light" href="http://www.facebook.com/{$tsInfo.p_socials.f}"><i class="fab fa-facebook-square"></i></button>
                {/if}
                {if $tsInfo.p_socials.t}
                <button type="button" class="btn btn-sm btn-light" href="http://www.twitter.com/{$tsInfo.p_socials.t}"><i class="fab fa-twitter-square"></i></button>
                {/if}
            </div>
            <div class="btn-group">
                {if $tsUser->uid != $tsInfo.uid && $tsUser->is_member}
                <button onclick="notifica.unfollow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 0}style="display: none;"{/if} type="button" class="btn btn-sm btn-danger negativo"><i class="fas fa-user-times"></i> Dejar de seguir</button>
                <button type="button" class="btn btn-sm btn-success positivo" onclick="notifica.follow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 1}style="display: none;"{/if}><i class="fas fa-user-plus"></i> Seguir</button>
                {if $tsUser->uid != $tsInfo.uid}
                <button type="button" class="btn btn-sm btn-light" onclick="mensaje.nuevo('{$tsInfo.nick}','','',''); return false"><i class="fas fa-envelope"></i></button>
                {/if}
                <div class="dropdown">
                    <button type="button" style="border-radius: 0rem .2rem .2rem 0rem;" class="btn btn-sm btn-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-plus-square"></i>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <h6 class="dropdown-header">Opciones</h6>
                        <a class="dropdown-item" href="#" onclick="denuncia.nueva('usuario',{$tsInfo.uid}, '', '{$tsInfo.nick}'); return false">Denunciar usuario</a>
                        {if ($tsUser->is_admod || $tsUser->permisos.mosu) && !$tsInfo.user_baneado}
                        <a class="dropdown-item" href="#" onclick="mod.users.action({$tsInfo.uid}, 'ban', true); return false;">Suspender usuario</a>
                        {/if}
                        <a class="dropdown-item" href="javascript:bloquear({$tsInfo.uid}, {if $tsInfo.block.bid}false{else}true{/if}, 'perfil')" id="bloquear_cambiar">{if $tsInfo.block.bid}Desbloquear{else}Bloquear{/if}</a>
                        {if $tsUser->is_admod == 1}
                        <h6 class="dropdown-header">Opciones de moderación</h6>
                        <a class="dropdown-item" onclick="location.href = '{$tsConfig.url}/admin/users?act=show&amp;uid={$tsInfo.uid}'">Editar usuario</a>
                        {/if}
                    </div>
                </div>
                {/if}
            </div>
        </div>
    </div>
    <div class="perfil-textoo">
        <h1><b>{$tsInfo.nick}</b></h1>
        <p class="lead"><span class="badge badge-secondary" style="background:#{$tsInfo.stats.r_color}">{$tsInfo.stats.r_name}</span>
        {if !$tsInfo.user_activo || $tsInfo.user_baneado}<span style="background-color:#CE152E;">Cuenta {if !$tsInfo.user_activo}desactivada{else}baneada{/if}</span>{/if}
        </p>
        <p class="lead">{if $tsInfo.p_mensaje}{$tsInfo.p_mensaje}{else}Miembro de {$tsConfig.titulo}{/if}</p>
    </div>
</div>
<div class="col-sm">
</div> 