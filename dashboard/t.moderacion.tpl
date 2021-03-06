{include file='templates/sections/main_header.tpl'}
<link rel="stylesheet" href="{$tsConfig.url}/dashboard/css/moderacion.css?{$smarty.now}">
<script type="text/javascript" src="{$tsConfig.url}/dashboard/js/moderacion.js?{$smarty.now}"></script>
<div class="row" id="borradores">
   <div class="offset-2"></div>
   <div class="col-sm-8">
      {if $tsAction == 'buscador' && $tsAct == 'search'}
         {include file='templates/moderacion/m.mod_buscador_stats.tpl'}
      {/if}
      {* Q WEBA PERO NO HAY DE OTRA xD*}
      {if $tsAction == ''}
      {include file='templates/moderacion/m.mod_welcome.tpl'}
      {elseif $tsAction == 'posts'}
      {include file='templates/moderacion/m.mod_report_posts.tpl'}
      {elseif $tsAction == 'fotos'}
      {include file='templates/moderacion/m.mod_report_fotos.tpl'}
      {elseif $tsAction == 'mps'}
      {include file='templates/moderacion/m.mod_report_mps.tpl'}
      {elseif $tsAction == 'users'}
      {include file='templates/moderacion/m.mod_report_users.tpl'}
      {elseif $tsAction == 'banusers'}
      {if $tsUser->is_admod || $tsUser->permisos.movub}{include file='templates/moderacion/m.mod_ban_users.tpl'}{/if}
      {elseif $tsAction == 'pospelera'}
      {if $tsUser->is_admod || $tsUser->permisos.morp}{include file='templates/moderacion/m.mod_papelera_posts.tpl'}{/if}
      {elseif $tsAction == 'fopelera'}
      {if $tsUser->is_admod || $tsUser->permisos.morf}{include file='templates/moderacion/m.mod_papelera_fotos.tpl'}{/if}
      {elseif $tsAction == 'buscador'}
      {if $tsUser->is_admod || $tsUser->permisos.moub}{include file='templates/moderacion/m.mod_buscador.tpl'}{/if}
      {elseif $tsAction == 'comentarios'}
      {if $tsUser->is_admod || $tsUser->permisos.mocc}{include file='templates/moderacion/m.mod_revision_comentarios.tpl'}{/if}
      {elseif $tsAction == 'revposts'}
      {if $tsUser->is_admod || $tsUser->permisos.mocp}{include file='templates/moderacion/m.mod_revision_posts.tpl'}{/if}
      {/if}
   </div>
</div>
{include file='templates/sections/main_footer.tpl'}