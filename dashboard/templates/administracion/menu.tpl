<script type="text/javascript">
    var action_menu = '{$tsAction}';
	//{literal} <-- no borrar
	$(function(){
        if(action_menu != '') $('#a_' + action_menu).addClass('active');
        else $('#a_main').addClass('active');
    });
</script>
{/literal}
                   
<br>
<h5>Control de Contenido</h5>
    <ul class="list-group">
        <li id="a_posts" class="list-group-item"><a href="{$tsConfig.url}/admin/posts"><i class="fas fa-file-alt"></i> Todos los Posts</a></li>
        <li id="a_fotos" class="list-group-item"><a href="{$tsConfig.url}/admin/fotos"><i class="fas fa-images"></i> Todas las Fotos</a></li>
        <li id="a_hcats" class="list-group-item"><a href="{$tsConfig.url}/admin/hcats"><i class="fas fa-puzzle-piece"></i> Categor&iacute;as "padre"</a></li>
        <li id="a_cats" class="list-group-item"><a href="{$tsConfig.url}/admin/cats"><i class="fas fa-puzzle-piece"></i> Categorías</a></li>
    </ul>
<br>
<h5>Control de Usuarios</h5>
    <ul class="list-group">
        <li id="a_users" class="list-group-item"><a href="{$tsConfig.url}/admin/users"><i class="fas fa-users"></i> Todos los Usuarios</a></li>
        <li id="a_sesiones" class="list-group-item"><a href="{$tsConfig.url}/admin/sesiones"><i class="fas fa-sign-in-alt"></i> Sesiones</a></li>
        <li id="a_nicks" class="list-group-item"><a href="{$tsConfig.url}/admin/nicks"><i class="fas fa-person-booth"></i> Cambios de Nicks</a></li>
        <li id="a_rangos" class="list-group-item"><a href="{$tsConfig.url}/admin/rangos"><i class="fas fa-sitemap"></i> Rangos de Usuarios</a></li>
    </ul>