<!doctype html>
<html lang="es">
<head>
<!-- Meta etqiquetas requeridas -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>{$tsTitle}</title>
<!-- Estilos CSS -->
<link href="{$tsConfig.css}/bootstrap.min.css?{$smarty.now}" rel="stylesheet">
<link href="{$tsConfig.tema.t_url}/estilo.css?{$smarty.now}" rel="stylesheet" />
<link href="{$tsConfig.tema.t_url}/phpost.css?{$smarty.now}" rel="stylesheet" />
<link href="{$tsConfig.tema.t_url}/extras.css?{$smarty.now}" rel="stylesheet" />
<link href="{$tsConfig.tema.t_url}/source/webfonts/all.min.css?{$smarty.now}" rel="stylesheet" />
<link href="{$tsConfig.tema.t_url}/source/wysibb/wysibb.css?{$smarty.now}" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="{if $tsConfig.favicon!=''}{$tsConfig.favicon}{else}{$tsConfig.images}/favicon.ico{/if}" type="image/x-icon" />
<!-- Estilos especiales -->
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
{if $tsUser->is_admod && $tsConfig.c_see_mod && $tsConfig.novemods.total}
<link href="{$tsConfig.url}/dashboard/css/moderacion.css" rel="stylesheet" type="text/css" />
{include file='sections/alerta.tpl'}
{/if}
<link href="https://emoji-css.afeld.me/emoji.css?{$smarty.now}" rel="stylesheet">
<link href="{$tsConfig.css}/{$tsPage}.css?{$smarty.now}" rel="stylesheet" type="text/css" />
<link href="{$tsConfig.css}/flag-icon.css?{$smarty.now}" rel="stylesheet" type="text/css" />
<!-- Javascript -->
<script src="{$tsConfig.js}/jquery.min.js?{$smarty.now}"></script>
<script src="{$tsConfig.js}/jquery.plugins.js?{$smarty.now}" type="text/javascript"></script>
<script src="{$tsConfig.js}/acciones.js?{$smarty.now}" type="text/javascript"></script>
<script src="{$tsConfig.js}/funciones.js?{$smarty.now}" type="text/javascript"></script>
<script src="{$tsConfig.js}/popper.min.js"></script>
<script src="{$tsConfig.js}/bootstrap.min.js"></script>
<script src="{$tsConfig.tema.t_url}/source/wysibb/wysibb.js?{$smarty.now}" type="text/javascript"></script>
{if $tsUser->is_admod || $tsUser->permisos.moacp || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.mosu || $tsUser->permisos.modu || $tsUser->permisos.moep || $tsUser->permisos.moop || $tsUser->permisos.moedcopo || $tsUser->permisos.moaydcp || $tsUser->permisos.moecp}
<script src="{$tsConfig.url}/dashboard/js/moderacion.js" type="text/javascript"></script>
{/if}{if $tsConfig.c_allow_live}
<link href="{$tsConfig.css}/live.css" rel="stylesheet" type="text/css" />
<script src="{$tsConfig.js}/live.js" type="text/javascript"></script>
{/if}
<script type="text/javascript">
// {literal}
var global_data = {
// {/literal}
   user_key:'{$tsUser->uid}',
   postid:'{$tsPost.post_id}',
   fotoid:'{$tsFoto.foto_id}',
   img:'{$tsConfig.tema.t_url}/',
   url:'{$tsConfig.url}',
   domain:'{$tsConfig.domain}',
   s_title: '{$tsConfig.titulo}',
   s_slogan: '{$tsConfig.slogan}',
   active: '{$tsConfig.c_recaptcha}'
// {literal}
};
// {/literal} {literal}
$(document).ready(function(){
// {/literal}
{if $tsNots > 0} notifica.popup({$tsNots}); {/if}
{if $tsMPs > 0 &&  $tsAction != 'leer'} mensaje.popup({$tsMPs}); {/if}
// {literal}
});
// {/literal}
</script>
</head>
<body>
{if $tsUser->is_admod == 1}{$tsConfig.install}{/if}
<!--JAVASCRIPT-->
<div class="progress" id="loading" style="display:none; height:5px;"><div class="progress-bar progress-bar-striped bg-primary progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
</div>
<div id="swf"></div>
<div id="js" style="display:none"></div>
<div id="mask"></div>
<div id="mydialog"></div>
<div class="UIBeeper" id="BeeperBox"></div>
<div id="brandday">
   {include file='sections/navbar.tpl'}
   {include file='head/breadcrumb.tpl'}
     {if $tsPage == 'posts'}{include file='head/temas.tpl'}{/if}
     <div class="container{if $tsPage == 'perfil'}-fluid{elseif $tsPage == 'chat'}-fluid{/if}">