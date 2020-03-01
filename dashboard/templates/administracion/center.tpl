<div class="content">
   <div class="box">
      <b>Bienvenido(a), {$tsUser->nick}!</b>
      Este es tu Centro de Administración. Desde aquí puedes modificar la configuración de tu web, modificar usuarios, temas, categorías, y muchas otras cosas. Si tienes algún problema, por favor revisa la página de Soporte y Créditos.  Si esa información no te sirve, puedes <a href="https://newrisus.com/" target="_blank">visitarnos</a> o acudir a <a href="https://phpost.net/foro/">PHPost</a> para solicitar ayuda acerca de tu problema.
   </div>
   <div class="row" style="padding-top:1em;">
      <div class="col-sm-8">
         <div class="accordion" id="Panel">
            <h2 data-toggle="collapse" data-target="#PhpostDirecto" aria-expanded="false" aria-controls="PhpostDirecto">PHPost en directo</h2>
            <div id="PhpostDirecto" class="collapse" aria-labelledby="PhpostDirecto" data-parent="#Panel">
               <ul id="news_pp" class="pp_list">
                  <li class="py-4">
                  <div class="d-flex justify-content-center">
                     <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                        <span class="sr-only">Loading...</span>
                     </div>
                  </div>
                  </li>
               </ul>
            </div>
            <h2 data-toggle="collapse" data-target="#desing" aria-expanded="true" aria-controls="desing">Diseños</h2>
            <div id="desing" class="collapse show" aria-labelledby="desing" data-parent="#Panel">
               <ul id="newTheme">
                  <li style="display:block;padding:10px;text-align: center;">
                     <div class="spinner-border" role="status"><span class="sr-only">Cargando...</span></div>
                  </li>
               </ul>
            </div>
         </div>
      </div>
      <div class="col-sm-4">
         <div class="nr-admin-panel">
            <div id="newrisusversion"><b>NewRisus</b> v.1.0</div>
         </div>
         <div class="nr-admin-panel">
            <h6><b>PHPost Risus</b></h6>
            <ul id="version_pp">
               <li class="d-flex justify-content-between align-items-center">
                  <span>Versión instalada</span>
                  <span class="float-right badge badge-success">{$tsConfig.version}</span>
               </li>
            </ul>
         </div>
         <div class="nr-admin-panel">
            <h6><b>Administradores</b></h6>
            <ul>
               {foreach from=$tsAdmins item=admin}
               <li class="nr-lista-user d-flex justify-content-start align-items-center">
                  <a href="{$tsConfig.url}/perfil/{$admin.user_name}"><img src="{$tsConfig.url}/files/avatar/{$admin.user_id}_120.jpg" class="float-left" style="width: 2em;border-radius: 50%;height: 2em; margin-right: 0.3em;"></a>
                  <a href="{$tsConfig.url}/perfil/{$admin.user_name}" class="float-left" uid="{$admin.user_id}">{$admin.user_name}</a>
                  <span class="float-right">{$admin.r_rango}</span>
               </li>
               
               {/foreach}
            </ul>
         </div>
         <div class="nr-admin-panel">
            <h6><b>Instalaciones</b></h6>
            <ul>
               <li class="d-flex justify-content-between align-items-center"><span>Fundación:</span><span class="float-right badge badge-success" title="{$tsInst.0|fecha}">{$tsInst.0|hace:true}</span></li>
               <li class="d-flex justify-content-between align-items-center"><span>Última actualización:</span><span class="float-right badge badge-success" title="{$tsInst.1|fecha}">{$tsInst.1|hace:true}</span></li>
            </ul>
         </div>
      </div>
   </div>
</div>
{literal}
<script type="text/javascript">
$(document).ready(function(){
$.ajax({
type: "GET",
url: global_data.url + "/feed-support.php",
dataType: "json",
success: function(r) {
$('#news_pp').html('');
for (var i = 0; i < r.length; i++) {
//
var html = '<li>';
   html += '<div class="title"><a href="' + r[i].link + '" target="_blank">' + r[i].title + '</a></div>';
   html += '<div class="body">' + r[i].info + '</div>';
html += '</li>';
//
$('#news_pp').append(html);
}
}
});
$.ajax({
type: "GET",
url: global_data.url + "/feed-version.php?v=risus",
dataType: "json",
success: function(r) {
for (var i = 0; i < r.length; i++) {
//
var html = '<li>';
   html += '<div class="title">' + r[i].title + '</div>';
   html += '<div class="body">' + r[i].text + '</div>';
html += '</li>';
//
$('#version_pp').append(html);
}
}
});
});
</script>
{/literal}