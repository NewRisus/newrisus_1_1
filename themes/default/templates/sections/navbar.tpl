<nav id="barra" class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
    <a id="titulo" class="navbar-brand" href="{$tsConfig.url}">{$tsConfig.titulo}</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto links-barra" style="font-size: 0.75em;">
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg">
                <a class="nav-link nr-menu-ico nr-menu-item" href="{$tsConfig.url}/" title="Ir al inicio"><i class="fas fa-home"></i> Inicio</a>
            </li>
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg">
                <a class="nav-link nr-menu-ico nr-menu-item" href="{$tsConfig.url}/usuarios/" title="Ir a ver los miembros"><i class="fas fa-users"></i> Miembros</a>
            </li>
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg">
                <a class="nav-link nr-menu-ico nr-menu-item" href="{$tsConfig.url}/equipo/" title="Ir a conocer el staff"><i class="fa fa-shield-alt"></i> Equipo</a>
            </li>
        </ul>
        <ul class="navbar-nav mr-auto links-barra notmp" style="font-size: 0.75em; margin-left: auto!important; margin-right:0px !important;">
            {if $tsUser->is_member}
            {if $tsAvisos}
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg">
                <a class="nav-link nr-menu-ico" href="{$tsConfig.url}/mensajes/avisos/"><span class="badge badge-pill badge-danger">{$tsAvisos}</span> <i class="fas fa-bullhorn" style="color:#d50000;"></i></a>
            </li>
            {/if}
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg">
                <a class="nav-link nr-menu-ico" href="{$tsConfig.url}/agregar/" title="Publicar nuevo tema"><i class="fas fa-plus-circle"></i></a>
            </li>
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg position-relative monitor">
                <a class="nav-link nr-menu-ico" href="{$tsConfig.url}/monitor/" onclick="notifica.last(); return false" alt="Monitor de usuario" name="Monitor"><span class="fas fa-bell"></span></a>
                <div class="notificaciones-list bg-white shadow position-absolute" id="mon_list" style="display:none;">
                   <strong onclick="location.href='{$tsConfig.url}/monitor/'">Notificaciones</strong>
                   <ul class="list-unstyled m-0 p-0">
                   </ul>
                   <a href="{$tsConfig.url}/monitor/" class="d-block text-center small text-info">Ver m&aacute;s notificaciones</a>
                </div>
            </li>
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg position-relative mensajes">
                <a class="nav-link nr-menu-ico" href="{$tsConfig.url}/mensajes/" onclick="mensaje.last(); return false" alt="Mensajes Personales" name="Mensajes"><span class="fas fa-envelope"></span></a>
                <div class="notificaciones-list bg-white shadow position-absolute" id="mp_list" style="display:none;">
                   <strong onclick="location.href='{$tsConfig.url}/mensajes/'">Mensajes</strong>
                   <ul id="boxMail" class="list-unstyled m-0 p-0"></ul>
                   <a href="{$tsConfig.url}/mensajes/" class="d-block text-center small text-info">Ver todos los mensajes</a>
                </div>
            </li>
            <li class="nav-item navbar-text dropdown iconos-navbar">
                <a class="nav-link nr-menu-ico" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$tsUser->nick} <img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" class="avatar-menu"></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/perfil/{$tsUser->info.user_name}/">Mi perfil</a>
                    {if $tsAvisos}
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/mensajes/avisos/">Avisos <span class="badge badge-pill badge-{if $tsAvisos}danger{else}light{/if} float-right" style="font-size: 1em !important;">{$tsAvisos}</span></a>
                    {/if}
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/mensajes/">Mensajes <span class="badge badge-pill badge-light float-right" style="font-size: 1em !important;">{$tsMPs}</span></a>
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/monitor/">Notificaciones <span class="badge badge-pill badge-light float-right" style="font-size: 1em !important;">{$tsNots}</span></a>
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/cuenta/">Ajustes de cuenta</a>
                    {if $tsUser->is_admod || $tsUser->permisos.moacp}
                    <hr class="dropdown-divider">
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/moderacion/">Panel de moderador {if $tsConfig.c_see_mod && $tsConfig.novemods.total}<span class="badge badge-pill float-right badge-{if $tsConfig.novemods.total < 10}success{elseif $tsConfig.novemods.total < 30}warning{else}danger{/if}"></span>{/if}</a>
                    {if $tsUser->is_admod == 1}
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/admin/">Panel de administrador</a>
                    {/if}
                    {/if}
                    <hr class="dropdown-divider">
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/login-salir.php">Cerrar sesión</a>
                </div>
            </li>
            {else}
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg">
                <a class="nav-link nr-menu-ico nr-menu-item" href="{$tsConfig.url}/registro/" title="Registrate en {$tsConfig.titulo}">Registrarme</a>
            </li>
            <li class="nav-item navbar-text iconos-navbar nr-noti-msg">
                <a class="nav-link nr-menu-ico nr-menu-item" href="{$tsConfig.url}/login/" title="Ingresa a tu cuenta">Ingresar</a>
            </li>
            {/if}
        </ul>
    </div>
</nav>