1:
<div id="perfil_info" status="activo">
    <div>
        <h4><b>Información de {$tsUsername}</b></h4>
        <div class="row">
            <div class="col-md-4">
                <label><b>País</b></label>
            </div>
            <div class="col-md-8">
                <p>{$tsPais}</p>
            </div>
        </div>
        {if $tsPerfil.p_sitio}
        <div class="row">
            <div class="col-md-4">
                <label><b>Sitio web</b></label>
            </div>
            <div class="col-md-8">
                <p><a rel="nofollow" href="{$tsPerfil.p_sitio}">{$tsPerfil.p_sitio}</a></p>
            </div>
        </div>
        {/if}
        <div class="row">
            <div class="col-md-4">
                <label><b>Miembro desde</b></label>
            </div>
            <div class="col-md-8">
                <p>{$tsPerfil.user_registro|fecha:"d_Ms_a"}</p>
            </div>
        </div>    
        <div class="row">
            <div class="col-md-4">
                <label><b>Última conexión</b></label>
            </div>
            <div class="col-md-8">
                <p>{$tsPerfil.user_lastactive|fecha}</p>
            </div>
        </div>  
        {if $tsPerfil.p_estudios}   
        <div class="row">
            <div class="col-md-4">
                <label><b>Estudios</b></label>
            </div>
            <div class="col-md-8">
                <p>{$tsPData.estudios[$tsPerfil.p_estudios]}</p>
            </div>
        </div> 
        {/if}
        <hr>
        {if $tsPerfil.p_idiomas.$iid != 0}
        {foreach from=$tsPData.idiomas key=iid item=idioma}
        <div class="row">
            <div class="col-md-4">
                <label><b>Idiomas</b></label>
            </div>
            <div class="col-md-8">
                <p>
                {$idioma} {if $tsPerfil.p_idiomas.$iid == $val}- {$text}{/if}
                </p>
            </div>
        </div>    
        {/foreach}
        {/if}
        
    </div>
</div>