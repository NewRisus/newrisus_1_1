<div class="account2" style="background: linear-gradient(to bottom, rgba(255,255,255,.7), rgba(255,255,255,.9)), url('{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg');">
	<div class="image img-cir img-120">
		<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg" alt="{$tsUser->nick}" />
	</div>
	<div class="d-flex justify-content-start align-items-center">
		<span><h4 class="name">{$tsUser->nick}</h4>
		<a href="{$tsConfig.url}/login-salir.php">Cerrar sesión</a></span>
	</div>
</div>
<nav class="navbar-sidebar2">
	<ul class="list-unstyled navbar__list">
		{if $tsPage == 'admin'}
		<li class="active has-sub">
			<a class="js-arrow" href="#">
				<i class="fas fa-tachometer-alt"></i>General
				<span class="arrow">
					<i class="fas fa-angle-down"></i>
				</span>
			</a>
			<ul class="list-unstyled navbar__sub-list js-sub-list">
				<li><a href="{$tsConfig.url}/admin/"><i class="fas fa-tachometer-alt"></i> Centro de administración</a></li>
				<li><a href="{$tsConfig.url}/admin/creditos"><i class="fas fa-question-circle"></i> Soporte y créditos</a></li>
				<li><a href="{$tsConfig.url}/admin/configs"><i class="fas fa-cogs"></i> Configuración general</a></li>
				<li><a href="{$tsConfig.url}/admin/temas"><i class="fas fa-palette"></i> Apariencia</a></li>
				<li><a href="{$tsConfig.url}/admin/news"><i class="fas fa-newspaper"></i> Noticias</a></li>
				<li><a href="{$tsConfig.url}/admin/ads"><i class="fas fa-link"></i> Anuncios</a></li>
			</ul>
		</li>
		<li class="has-sub">
			<a class="js-arrow" href="#">
				<i class="fas fa-cogs"></i>Control
				<span class="arrow">
					<i class="fas fa-angle-down"></i>
				</span>
			</a>
			<ul class="list-unstyled navbar__sub-list js-sub-list">
				<li><a href="{$tsConfig.url}/admin/medals"><i class="fas fa-medal"></i> Medallas</a></li>
				<li><a href="{$tsConfig.url}/admin/afs"><i class="fas fa-sitemap"></i> Sitios afiliados</a></li>
				<li><a href="{$tsConfig.url}/admin/stats"><i class="fas fa-chart-bar"></i> Estadísticas</a></li>
				<li><a href="{$tsConfig.url}/admin/blacklist"><i class="fas fa-user-slash"></i> Bloqueados</a></li>
				<li><a href="{$tsConfig.url}/admin/badwords"><i class="fas fa-ban"></i> Censuras</a></li>
			</ul>
		</li>
		<li class="has-sub">
			<a class="js-arrow" href="#">
				<i class="fas fa-desktop"></i>Contenido
				<span class="arrow">
					<i class="fas fa-angle-down"></i>
				</span>
			</a>
			<ul class="list-unstyled navbar__sub-list js-sub-list">
				<li><a href="{$tsConfig.url}/admin/posts"><i class="fas fa-file-alt"></i> Todos los temas</a></li>
				<li><a href="{$tsConfig.url}/admin/fotos"><i class="fas fa-images"></i> Todas las fotos</a></li>
				<li><a href="{$tsConfig.url}/admin/hcats"><i class="fas fa-puzzle-piece"></i> Categorías padre</a></li>
				<li><a href="{$tsConfig.url}/admin/cats"><i class="fas fa-puzzle-piece"></i> Categorías</a></li>
			</ul>
		</li>
		<li class="has-sub">
			<a class="js-arrow" href="#">
				<i class="fas fa-users"></i>Usuarios
				<span class="arrow">
					<i class="fas fa-angle-down"></i>
				</span>
			</a>
			<ul class="list-unstyled navbar__sub-list js-sub-list">
				<li><a href="{$tsConfig.url}/admin/users"><i class="fas fa-users"></i> Todos los miembros</a></li>
				<li><a href="{$tsConfig.url}/admin/sesiones"><i class="fas fa-sign-in-alt"></i> Sesiones</a></li>
				<li><a href="{$tsConfig.url}/admin/nicks"><i class="fas fa-person-booth"></i> Cambios de nick</a></li>
				<li><a href="{$tsConfig.url}/admin/rangos"><i class="fas fa-sitemap"></i> Rangos de usuario</a></li>
			</ul>
		</li>
		{else}
			<li class="nav-item">
                <a href="{$tsConfig.url}/moderacion/" class="nav-link">Centro de Moderaci&oacute;n</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Denuncias</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="{$tsConfig.url}/moderacion/posts"><i class="fas fa-file"></i> Post <span class="float-right badge badge-{if $tsConfig.novemods.repposts > 15}danger{elseif $tsConfig.novemods.repposts > 5}warning{else}success{/if}">{$tsConfig.novemods.repposts}</span></a>
                    <a class="dropdown-item" href="{$tsConfig.url}/moderacion/fotos"><i class="fas fa-picture"></i> Fotos <span class="float-right badge badge-{if $tsConfig.novemods.repfotos > 15}danger{elseif $tsConfig.novemods.repfotos > 5}warnign{else}success{/if}">{$tsConfig.novemods.repfotos}</span></a>                    
                    <a class="dropdown-item" href="{$tsConfig.url}/moderacion/mps">Mensajes  <span class="float-right badge badge-{if $tsConfig.novemods.repmps > 15}danger{elseif $tsConfig.novemods.repmps > 5}warnign{else}success{/if}">{$tsConfig.novemods.repmps}</span></a>
                    <a class="dropdown-item" href="{$tsConfig.url}/moderacion/users">Usuarios <span class="float-right badge badge-{if $tsConfig.novemods.repusers > 15}danger{elseif $tsConfig.novemods.repusers > 5}warnign{else}success{/if}">{$tsConfig.novemods.repusers}</span></a>
                </div>
            </li>
            {if $tsUser->is_admod || $tsUser->permisos.movub || $tsUser->permisos.moub}
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Gesti&oacute;n</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    {if $tsUser->is_admod || $tsUser->permisos.movub}
                        <a class="dropdown-item" href="{$tsConfig.url}/moderacion/banusers">Usuarios suspendidos <span class="float-right badge badge-{if $tsConfig.novemods.supusers > 15}danger{elseif $tsConfig.novemods.suspusers > 5}warning{else}success{/if}">{$tsConfig.novemods.suspusers}</span></a>
                    {/if}{if $tsUser->is_admod || $tsUser->permisos.moub}
                        <a class="dropdown-item" href="{$tsConfig.url}/moderacion/buscador">Buscador de Contenido</a>
                    {/if}
                </div>
            </li>
            {/if}
            {if $tsUser->is_admod || $tsUser->permisos.morp || $tsUser->permisos.morf}
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Papelera de Reciclaje</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    {if $tsUser->is_admod || $tsUser->permisos.morp}
                        <a class="dropdown-item" href="{$tsConfig.url}/moderacion/pospelera">Post eliminados <span class="float-right badge badge-{if $tsConfig.novemods.pospelera > 15}danger{elseif $tsConfig.novemods.pospelera > 5}warning{else}success{/if}">{$tsConfig.novemods.pospelera}</span></a>
                    {/if}{if $tsUser->is_admod || $tsUser->permisos.morf}
                        <a class="dropdown-item" href="{$tsConfig.url}/moderacion/fopelera">Fotos eliminadas <span class="float-right badge badge-{if $tsConfig.novemods.fospelera > 15}danger{elseif $tsConfig.novemods.fospelera > 5}warning{else}success{/if}">{$tsConfig.novemods.fospelera}</span></a>
                    {/if}
                </div>
            </li>
            {/if}
            {if $tsUser->is_admod || $tsUser->permisos.mocp || $tsUser->permisos.mocc}
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Contenido desaprobado</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    {if $tsUser->is_admod || $tsUser->permisos.mocp}
                        <a class="dropdown-item" href="{$tsConfig.url}/moderacion/revposts">Posts <span class="float-right badge badge-{if $tsConfig.novemods.revposts > 15}danger{elseif $tsConfig.novemods.revposts > 5}warning{else}success{/if}">{$tsConfig.novemods.revposts}</span></a>
                    {/if}{if $tsUser->is_admod || $tsUser->permisos.mocc}
                        <a class="dropdown-item" href="{$tsConfig.url}/moderacion/comentarios">Comentarios <span class="float-right badge badge-{if $tsConfig.novemods.revcomentarios > 15}danger{elseif $tsConfig.novemods.revcomentarios > 5}warning{else}success{/if}">{$tsConfig.novemods.revcomentarios}</span></a>
                    {/if}
                </div>
            </li>
            {/if}
		{/if}
	</ul>
</nav>