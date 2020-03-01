{include file='sections/main_header.tpl'}
<script> var Newrisus = '{VersionTheme}'; </script>
<link rel="stylesheet" href="{$tsConfig.url}/dashboard/css/admin.css?{$smarty.now}">
<script type="text/javascript" src="{$tsConfig.url}/dashboard/js/admin.js?{$smarty.now}"></script>
<div class="row">
   <div class="col-12 py-2 px-4">
      {if $tsAction == ''}
         {include file='administracion/center.tpl'}
      {elseif $tsAction == 'creditos'}
         {include file='administracion/soporteycreditos.tpl'}
      {elseif $tsAction == 'configs'}
         {include file='administracion/configuracion.tpl'}
      {elseif $tsAction == 'temas'}
         {include file='administracion/temas.tpl'}
      {elseif $tsAction == 'news'}
         {include file='administracion/noticias.tpl'}
      {elseif $tsAction == 'ads'}
         {include file='administracion/publicidad.tpl'}
      {elseif $tsAction == 'medals'}
         {include file='administracion/medallas.tpl'}
      {elseif $tsAction == 'stats'}
         {include file='administracion/estadisticas.tpl'}
      {elseif $tsAction == 'posts'}
         {include file='administracion/posts.tpl'}
      {elseif $tsAction == 'fotos'}
         {include file='administracion/fotos.tpl'}
      {elseif $tsAction == 'afs'}
         {include file='administracion/afiliados.tpl'}
      {elseif $tsAction == 'users'}
         {include file='administracion/usuarios.tpl'}
      {elseif $tsAction == 'sesiones'}
         {include file='administracion/sesiones.tpl'}
      {elseif $tsAction == 'nicks'}
         {include file='administracion/m.admin_nicks.tpl'}
      {elseif $tsAction == 'blacklist'}
         {include file='administracion/listanegra.tpl'}
      {elseif $tsAction == 'badwords'}
         {include file='administracion/censuras.tpl'}
      {elseif $tsAction == 'rangos'}
         {include file='administracion/m.admin_rangos.tpl'}
      {elseif $tsAction == 'hcats'}
         {include file='administracion/categorias.tpl'}
      {elseif $tsAction == 'cats'}
         {include file='administracion/subcategorias.tpl'}
      {/if}
   </div>
</div>
{include file='sections/main_footer.tpl'}