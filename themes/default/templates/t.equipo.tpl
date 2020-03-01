{include file='sections/main_header.tpl'}
<h1>Equipo de {$tsConfig.titulo}</h1>
<h6>Conoce el equipo que está detrás de {$tsConfig.titulo}</h6>

<hr class="dropdown-divider"><br>

<h5><b>Fundadores</b></h5>
<div class="row">
    {if $tsAdmins}
    {foreach $tsAdmins item=admin} 
    <div class="col-sm-3">
        <div class="box-staff nr-home-box">
            <a href="{$tsConfig.url}/perfil/{$admin.user_name}">
                <img title="Ver perfil de {$admin.user_name}" class="avatar-staff" src="{$tsConfig.url}/files/avatar/{$admin.user_id}_120.jpg" style="border-color: #{$admin.r_color};">
            </a>
            <a href="{$tsConfig.url}/perfil/{$admin.user_name}" class="button"><h5><b>{$admin.user_name}</b></h5></a>
            <span style="color: #{$admin.r_color};"><b>{$admin.r_name}</b></span><br>
            <span>{$admin.user_puntos} puntos</span><br>
            <span>{$admin.user_posts} temas</span><br><br>
            {if $admin.user_id != $tsUser->uid}
            <button class="btn btn-primary btn-sm" onclick="{if !$tsUser->is_member}registro_load_form();{else}mensaje.nuevo('{$admin.user_name}','','','');{/if}return false">Enviar Mensaje</button>
            {/if}
        </div>
    </div>
    {/foreach}
    {else}
    <div class="col-sm-12">
        <div class="alert alert-warning" role="alert">
            ¡No hay miembros con este rango aún!
        </div>
    </div>
    {/if}
</div>

<hr class="dropdown-divider"><br>

<h5><b>Moderadores</b></h5>
<div class="row">
    {if $tsMods}
    {foreach $tsMods item=mods}
    <div class="col-sm-3">
        <div class="box-staff nr-home-box">
            <a href="{$tsConfig.url}/perfil/{$mods.user_name}">
                <img title="Ver perfil de {$mods.user_name}" class="avatar-staff" src="{$tsConfig.url}/files/avatar/{$mods.user_id}_120.jpg" style="border-color: #{$mods.r_color};">
            </a>
            <a href="{$tsConfig.url}/perfil/{$mods.user_name}" class="button"><h5><b>{$mods.user_name}</b></h5></a>
            <span  style="color: #{$mods.r_color};"><b>{$mods.r_name}</b></span><br>
            <span>{$mods.user_puntos} puntos</span><br>
            <span>{$mods.user_posts} temas</span><br><br>
            {if $mods.user_id != $tsUser->uid}
            <button class="btn btn-primary btn-sm" onclick="{if !$tsUser->is_member}registro_load_form();{else}mensaje.nuevo('{$mods.user_name}','','','');{/if}return false">Enviar Mensaje</button>
            {/if}
        </div>
    </div>
    {/foreach}
    {else}
    <div class="col-sm-12">
        <div class="alert alert-warning" role="alert">
            ¡No hay miembros con este rango aún!
        </div>
    </div>
    {/if}
</div>

<hr class="dropdown-divider"><br>

<h5><b>Beta Testers</b></h5>
<div class="row">
    {if $tsBetas}
    {foreach $tsBetas item=betas}
    <div class="col-sm-3">
        <div class="box-staff nr-home-box">
            <a href="{$tsConfig.url}/perfil/{$betas.user_name}">
                <img title="Ver perfil de {$betas.user_name}" class="avatar-staff" src="{$tsConfig.url}/files/avatar/{$betas.user_id}_120.jpg" style="border-color: #{$betas.r_color};">
            </a>
            <a href="{$tsConfig.url}/perfil/{$betas.user_name}" class="button"><h5><b>{$betas.user_name}</b></h5></a>
            <span  style="color: #{$betas.r_color};"><b>{$betas.r_name}</b></span><br>
            <span>{$betas.user_puntos} puntos</span><br>
            <span>{$betas.user_posts} temas</span><br><br>
            {if $betas.user_id != $tsUser->uid}
            <button class="btn btn-primary btn-sm" onclick="{if !$tsUser->is_member}registro_load_form();{else}mensaje.nuevo('{$betas.user_name}','','','');{/if}return false">Enviar Mensaje</button>
            {/if}
        </div>
    </div>
    {/foreach}
    {else}
    <div class="col-sm-12">
        <div class="alert alert-warning" role="alert">
            ¡No hay miembros con este rango aún!
        </div>
    </div>
    {/if}
</div>


{literal}
<style type="text/css">
.avatar-staff {
    width: 10em;
    border-radius: 50%;
    margin: 1em auto;
    display: block;
    border: 5px solid;
    padding: 0.2em;
}
.box-staff {
    text-align: center;
    padding: 1em;
    border-radius: 5px;
}
.box-staff:hover {
    background: #FAFAFA;
}
</style>
{/literal}
{include file='sections/main_footer.tpl'}
