<div class="row nr-perfil-header" {if $tsInfo.p_cabecera}style="background-image: url('{$tsInfo.p_cabecera}'); background-color: rgba(0,0,0,0.6);"{/if}>
    <div class="col-sm"></div>
    <div class="col-sm-1">
        <img class="nr-avatar" src="{$tsConfig.url}/files/avatar/{if $tsInfo.p_avatar}{$tsInfo.uid}_120{else}avatar{/if}.jpg">
        <div class="estado-usuario {$tsInfo.status.css} perfil-estado d-none d-sm-none d-md-block" title="{$tsInfo.status.t}"></div>
    </div>
    <div class="col-sm-9 nr-text-header-perfil">
        <div class="row">
            <div class="col-sm-8">
                <h2 class="nr-nombre">{if $tsInfo.p_nombre}{$tsInfo.p_nombre}{else}{$tsInfo.nick}{/if} <small style="font-size: 60%;">{$tsInfo.stats.r_name}</small></h2>
                <h6 class="nr-nick"><a>@{$tsInfo.nick}</a></h6>
            </div>
            <div class="col-sm-4">
                <div class="float-right">
                    {if $tsUser->uid != $tsInfo.uid && $tsUser->is_member}
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-light btn-sm" onclick="mensaje.nuevo('{$tsInfo.nick}','','',''); return false"><i class="fas fa-envelope"></i> Enviar mensaje</button>
                        {if $tsInfo.follow == 1}
                        <button class="btn btn-danger btn-sm unfollow_user_post" onclick="notifica.unfollow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 0}style="display: none;"{/if}><i class="fas fa-user-minus"></i> Dejar de seguir</button>
                        {elseif $tsInfo.follow == 0}
                        <button class="btn btn-success btn-sm follow_user_post" onclick="notifica.follow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 1}style="display: none;"{/if}><i class="fas fa-user-plus"></i> Seguir </button>
                        {/if}
                            <button class="btn btn-light" data-toggle="dropdown" aria-haspopup="true" style="border-top-right-radius: 3px; border-bottom-right-radius: 3px;">
                                <i class="fas fa-ellipsis-v"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="Optiones">
                                {if $tsUser->uid != $tsInfo.uid && $tsUser->is_member}
                                <a class="dropdown-item" style="text-shadow: 0 0 0;" href="javascript:bloquear({$tsInfo.uid}, {if $tsInfo.block.bid}false{else}true{/if}, 'perfil')" id="bloquear_cambiar" data-placement="left" title="{if $tsInfo.block.bid}Desbloquear usuario{else}Bloquear usuario{/if}">{if $tsInfo.block.bid}Desbloquear usuario{else}Bloquear usuario{/if}</a>
                                <a class="dropdown-item" style="text-shadow: 0 0 0;" onclick="denuncia.nueva('usuario',{$tsInfo.uid}, '', '{$tsInfo.nick}'); return false" data-placement="left" title="Denunciar a este usuario">Denunciar usuario</a>
                                {/if}
                                {if ($tsUser->is_admod || $tsUser->permisos.mosu) && !$tsInfo.user_baneado}
                                <hr class="dropdown-divider">
                                <a class="dropdown-item" style="text-shadow: 0 0 0;" onclick="mod.users.action({$tsInfo.uid}, 'ban', true); return false;" data-placement="left" title="Suspender usuario">Suspender a este usuario</a>
                                {/if}
                                {if $tsUser->is_admod == 1}
                                <a class="dropdown-item" style="text-shadow: 0 0 0;" onclick="location.href = '{$tsConfig.url}/admin/users?act=show&amp;uid={$tsInfo.uid}'" data-placement="left" title="Editar la cuenta de este usuario">Editar cuenta</a>
                                {/if}
                            </div>
                    </div>
                    {/if}
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-8">
                {if $tsInfo.p_mensaje}<p class="nr-text-shadow">{$tsInfo.p_mensaje}</p>{/if}
                <div>
                    {if $tsInfo.user_pais}
                    <a class="nr-social-perfil" title="{$tsInfo.nick} es de {$tsInfo.user_pais}"><i class="fas fa-map-marker-alt"></i> {$tsInfo.user_pais}</a>
                    {/if}
                    {if $tsInfo.p_socials.f}
                    <a class="nr-social-perfil" title="Siguelo en Facebook!" href="http://www.facebook.com/{$tsInfo.p_socials.f}"><i class="fab fa-facebook-square"></i> /{$tsInfo.p_socials.f}</a>
                    {/if}
                    {if $tsInfo.p_socials.t}
                    <a class="nr-social-perfil" title="Siguelo en Twitter" href="http://www.twitter.com/{$tsInfo.p_socials.t}"><i class="fab fa-twitter-square"></i> /{$tsInfo.p_socials.t}</a>
                    {/if}
                    {if $tsInfo.status.t == 'Online'}
                    <a title="Usuario conectado"><i class="far fa-clock"></i> En línea</a>
                    {else}
                    <a title="Última conexión"><i class="far fa-clock"></i> {$tsInfo.user_lastactive|Hace}</a>
                    {/if}
                </div>
            </div>
            <div class="col-sm-4">
                <div>
                    <div class="nr-stats-perfil nr-text-shadow">
                        <h3>{$tsInfo.stats.user_puntos}</h3>
                        <b>PUNTOS</b>
                    </div>
                    <div class="nr-stats-perfil nr-text-shadow">
                        <h3>{$tsInfo.stats.user_posts}</h3>
                        <b>TEMAS</b>
                    </div>
                    <div class="nr-stats-perfil nr-text-shadow" style="border-right: 0px;">
                        <h3>{$tsInfo.stats.user_seguidores}</h3>
                        <b>SEGUIDORES</b>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm"></div>
</div>    


<div class="row" style="margin-top:1em;">
    <div class="col-sm"></div>
    <div class="col-sm-6">
        <div>
            <ul id="tabs_menu" class="nav nav-pills nav-justified nr-navs-perfil">
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#perfil_wall" role="tab" aria-controls="pills-wall" aria-selected="false" onclick="perfil.load_tab('wall', this); return false">Muro</a>
                </li>
                {if $tsType == 'news' || $tsType == 'story'}
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#perfil_news" role="tab" aria-controls="pills-news" aria-selected="false" onclick="perfil.load_tab('news', this); return false">{if $tsType == 'story'}Publicaci&oacute;n{else}Noticias{/if}</a>
                </li>
                {/if}
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#perfil_actividad" role="tab" aria-selected="false" onclick="perfil.load_tab('actividad', this); return false" id="actividad">Actividad</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#perfil_info" role="tab" aria-controls="pills-info" aria-selected="false" onclick="perfil.load_tab('info', this); return false" id="informacion">Información</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#perfil_posts" role="tab" aria-controls="pills-posts" aria-selected="false" onclick="perfil.load_tab('posts', this); return false">Temas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#perfil_seguidores" role="tab" aria-controls="pills-followers" aria-selected="false" onclick="perfil.load_tab('seguidores', this); return false" id="seguidores">Seguidores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#perfil_siguiendo" role="tab" aria-controls="pills-follow" aria-selected="false" onclick="perfil.load_tab('siguiendo', this); return false" id="siguiendo">Siguiendo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" href="#perfil_medallas" role="tab" aria-controls="pills-medals" aria-selected="false" onclick="perfil.load_tab('medallas', this); return false">Medallas</a>
                </li>
            </ul>
            <div class="row">
                <div class="col-sm-3 col-md-3 col-xl-3"></div>
                <div class="col-sm-6 col-md-6 col-xl-6">
                    {if !$tsInfo.user_activo || $tsInfo.user_baneado}
                    <div class="alert alert-danger" role="alert">
                        La cuenta de este usuario ha sido suspendida.
                    </div>
                    {/if}
                </div>
                <div class="col-sm-3 col-md-3 col-xl-3"></div>
            </div>
            <div id="info" pid="{$tsInfo.uid}"></div>
            <div id="perfil_content" class="tab-content">
                {if $tsPrivacidad.m.v == false}
                <div id="perfil_wall" status="activo" class="widget">
                    <div class="emptyData">{$tsPrivacidad.m.m}</div>
                        <script type="text/javascript">
                            perfil.load_tab('info', $('#informacion'));
                        </script>
                </div>
                {elseif $tsType == 'story'}
                {include file='modulos/perfil/historia.tpl' nocache}
                {else}
                {include file='modulos/perfil/muro.tpl' nocache}
                {/if}
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="nr-box-sidebar-perfil">
            <h6><b>Seguidores</b></h6>
            {if $tsGeneral.segs.data}
            <ul class="clearfix">
                {foreach from=$tsGeneral.segs.data item=s}
                <li><a href="{$tsConfig.url}/perfil/{$s.user_name}"><img class="nr-avatar-seguidores" src="{$tsConfig.url}/files/avatar/{$s.user_id}_50.jpg"></a></li>
                {/foreach}
            </ul>
            {/if}
        </div>
        {include file='modulos/ads/300.tpl'}
        <div class="nr-box-sidebar-perfil">
            <h6><b>Siguiendo</b></h6>
            {if $tsGeneral.sigd.total}
            <ul class="clearfix">
                {foreach from=$tsGeneral.sigd.data item=s}
                <li><a href="{$tsConfig.url}/perfil/{$s.user_name}"><img class="nr-avatar-seguidores" src="{$tsConfig.url}/files/avatar/{$s.user_id}_50.jpg"></a></li>
                {/foreach}
            </ul>
            {/if}
        </div>
        {if $tsInfo.can_hits}
        <div class="nr-box-sidebar-perfil">
            <h6><b>Últimas visitas al perfil</b></h6>
            {if $tsInfo.visitas}
            <ul class="clearfix">
                {foreach from=$tsInfo.visitas item=v}
                <li><a href="{$tsConfig.url}/perfil/{$v.user_name}"><img class="nr-avatar-seguidores" src="{$tsConfig.url}/files/avatar/{$v.user_id}_50.jpg" title="{$v.user_name} {$v.date|hace:true}"></a></li>
                {/foreach}
            </ul>
            {/if}
        </div>
        {/if}
        
    </div>
    <div class="col-sm"></div>
</div>







{literal}
<style>
.nr-perfil-header {
    background-color: #455A64;
    background-blend-mode: color;
    background-size: 100%;
    background-attachment: fixed;
    background-position: center;
    height: auto;
    margin-top: -15px;
    box-shadow: 5em -4em 8em #263238 inset;
    color: #fff;
    padding: 2em;
}
    
.nr-avatar {
    display: block;
    width: 9em;
    height: 9em;
    margin: 1em auto 1em;
    border-radius: 50%;
    border: 4px solid #fff;
    box-shadow: 0px 0px 2px #454545;
    }

.nr-nombre {
    margin: 0.2em 0em;
    font-weight: bold;
    text-shadow: 0px 0px 5px #454545;
}
    
.nr-nick {
    text-shadow: 0px 0px 5px #454545;
}
    
.nr-text-header-perfil {
    padding: 0em 3em;
    text-shadow: 0px 0px 5px #454545;
}
    
.nr-stats-perfil {
    width: 33.3%;
    display: inline-block;
    float: left;
    text-align: center;
    border-right: 2px solid rgba(0,0,0,0.1);
    padding: 0em;
    height: 6em;
    text-shadow: 0px 0px 3px #454545;
}
    
.nr-box-sidebar-perfil {
    padding: 0em 0em 1.5em;
    border-bottom: 1px solid #eee;
    margin-bottom: 1em;
}
    
.nr-social-perfil {
    color: #fff !important;
    padding: 0em 1em 0em 0em;
    font-size: 1.2em;
    text-shadow: 0px 0px 3px #454545;
}
    
.nr-navs-perfil {
    padding-bottom: 1em;
    border-bottom: 1px solid #eee;
    margin-bottom: 1em;
}
    
.nr-text-shadow {
    text-shadow: 0px 0px 3px #454545;
}
    
.nr-avatar-seguidores {
    margin-top: 0.5em;
}
</style>
{/literal}






<!-- ANTIGUO -->

    