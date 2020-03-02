<!doctype html>
<html lang="es">
<head>
<!-- Meta etqiquetas requeridas -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>{$tsTitle}</title>
<!-- Estilos CSS -->
<link href="{$tsConfig.url}/dashboard/css/bootstrap.min.css?{$smarty.now}" rel="stylesheet">
<link href="{$tsConfig.tema.t_url}/source/webfonts/all.min.css?{$smarty.now}" rel="stylesheet" />

<link href="{$tsConfig.url}/dashboard/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
<link href="{$tsConfig.url}/dashboard/vendor/wow/animate.css" rel="stylesheet" media="all">
<link href="{$tsConfig.url}/dashboard/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
<link href="{$tsConfig.url}/dashboard/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
<link href="{$tsConfig.url}/dashboard/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
<link href="{$tsConfig.url}/dashboard/vendor/slick/slick.css" rel="stylesheet" media="all">
<link href="{$tsConfig.url}/dashboard/css/theme.css?{$smarty.now}" rel="stylesheet" />

<link rel="shortcut icon" href="{if $tsConfig.favicon!=''}{$tsConfig.favicon}{else}{$tsConfig.images}/favicon.ico{/if}" type="image/x-icon" />
{if $tsUser->is_admod && $tsConfig.c_see_mod && $tsConfig.novemods.total}
<link href="{$tsConfig.url}/dashboard/css/moderacion.css" rel="stylesheet" type="text/css" />
{include file='sections/alerta.tpl'}
{/if}
<!-- Javascript -->
<script src="{$tsConfig.url}/dashboard/js/jquery.min.js?{$smarty.now}"></script>
<script src="{$tsConfig.url}/dashboard/js/acciones.js?{$smarty.now}"></script>
{if $tsUser->is_admod || $tsUser->permisos.moacp || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.mosu || $tsUser->permisos.modu || $tsUser->permisos.moep || $tsUser->permisos.moop || $tsUser->permisos.moedcopo || $tsUser->permisos.moaydcp || $tsUser->permisos.moecp}
<script src="{$tsConfig.url}/dashboard/js/moderacion.js" type="text/javascript"></script>
{/if}
<script type="text/javascript">
  // {literal}
  var global_data={
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
  // {/literal}
</script>
</head>
<body class="animsition">
{if $tsUser->is_admod == 1}{$tsConfig.install}{/if}
<!--JAVASCRIPT-->
<div id="loading" style="display:none"><div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div></div>
<div id="swf"></div>
<div id="js" style="display:none"></div>
<div id="mask"></div>
<div id="mydialog"></div>
<div class="UIBeeper" id="BeeperBox"></div>
<div id="brandday">
   <div class="page-wrapper">
      <div class="page-container2">
         {include file='templates/sections/header-desktop.tpl'}
         {include file='templates/sections/navbar_list.tpl'}
         {include file='templates/sections/breadcrumb.tpl'}
            <section class="mt-3">
               <div class="section__content section__content--p30">
                  <div class="container-fluid bg-white border border-light p-2">