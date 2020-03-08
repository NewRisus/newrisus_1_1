<!doctype html>
<html lang="es">
<head>
<!-- Meta etqiquetas requeridas -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>{$tsTitle}</title>
<!-- Estilos CSS -->
<link href="{$tsConfig.tema.t_url}/source/bootstrap/bootstrap.min.css?{$smarty.now}" rel="stylesheet">
<link href="{$tsConfig.url}/auth/css/estilo.css?{$smarty.now}" rel="stylesheet">
<link rel="shortcut icon" href="{$tsConfig.images}/favicon.ico" type="image/x-icon" />
<!-- Javascript -->
<script src="{$tsConfig.js}/jquery.min.js?{$smarty.now}"></script>
<script src="{$tsConfig.url}/auth/js/plugin.min.js?{$smarty.now}"></script>
<script src="{$tsConfig.url}/auth/js/acciones.js?{$smarty.now}"></script>
<script src="{$tsConfig.tema.t_url}/source/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript">
   // {literal}
   var global_data={
   // {/literal}
   user_key:'{$tsUser->uid}',
   img:'{$tsConfig.tema.t_url}/',
   url:'{$tsConfig.url}',
   domain:'{$tsConfig.domain}',
   s_title: '{$tsConfig.titulo}',
   s_slogan: '{$tsConfig.slogan}',
   // {literal}
   };
   // {/literal}
</script>
{if $tsPage == 'login'}
<script src="{$tsConfig.url}/auth/js/login.js?{$smarty.now}"></script>
{/if}
<style>{literal}
body,.auth .auth-filter-blur {
   background-image: url("{/literal}{$tsConfig.url}{literal}/auth/img/back_{/literal}{php} echo rand(1,3); {/php}{literal}.jpg");
   background-position: center;
   -webkit-background-size: cover;
   background-size: cover;
   background-repeat: no-repeat;
   background-attachment: fixed;
}
{/literal}</style>
</head>
<body>
<div class="progress" id="loading" style="display:none; height:5px;"><div class="progress-bar progress-bar-striped bg-primary progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div></div>
<div id="mask"></div>
<div id="mydialog"></div>
<div id="brandday">
	<div class="auth">