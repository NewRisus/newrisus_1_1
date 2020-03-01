{include file='templates/sections/main_header.tpl'}
<script> var Newrisus = '{VersionTheme}'; </script>
<link rel="stylesheet" href="{$tsConfig.url}/dashboard/css/admin.css?{$smarty.now}">
<script type="text/javascript" src="{$tsConfig.url}/dashboard/js/admin.js?{$smarty.now}"></script>
<div class="row">
   <div class="col-12 py-2 px-4">
      {if $tsAction == ''}
         {include file='templates/administracion/center.tpl'}
      {elseif $tsAction == 'creditos'}
         {include file='templates/administracion/soporteycreditos.tpl'}
      {elseif $tsAction == 'configs'}
         {include file='templates/administracion/configuracion.tpl'}
      {elseif $tsAction == 'temas'}
         {include file='templates/administracion/temas.tpl'}
      {elseif $tsAction == 'news'}
         {include file='templates/administracion/noticias.tpl'}
      {elseif $tsAction == 'ads'}
         {include file='templates/administracion/publicidad.tpl'}
      {elseif $tsAction == 'medals'}
         {include file='templates/administracion/medallas.tpl'}
      {elseif $tsAction == 'stats'}
         {include file='templates/administracion/estadisticas.tpl'}
      {elseif $tsAction == 'posts'}
         {include file='templates/administracion/posts.tpl'}
      {elseif $tsAction == 'fotos'}
         {include file='templates/administracion/fotos.tpl'}
      {elseif $tsAction == 'afs'}
         {include file='templates/administracion/afiliados.tpl'}
      {elseif $tsAction == 'users'}
         {include file='templates/administracion/usuarios.tpl'}
      {elseif $tsAction == 'sesiones'}
         {include file='templates/administracion/sesiones.tpl'}
      {elseif $tsAction == 'nicks'}
         {include file='templates/administracion/m.admin_nicks.tpl'}
      {elseif $tsAction == 'blacklist'}
         {include file='templates/administracion/listanegra.tpl'}
      {elseif $tsAction == 'badwords'}
         {include file='templates/administracion/censuras.tpl'}
      {elseif $tsAction == 'rangos'}
         {include file='templates/administracion/m.admin_rangos.tpl'}
      {elseif $tsAction == 'hcats'}
         {include file='templates/administracion/categorias.tpl'}
      {elseif $tsAction == 'cats'}
         {include file='templates/administracion/subcategorias.tpl'}
      {/if}
   </div>
</div>
{include file='sections/main_footer.tpl'}