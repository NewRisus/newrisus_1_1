<div class="sidebar-tabs clearbeta">
    <h4>Mi cuenta</h4>
    <div style="text-align: center;">
        <div class="avatar-big-cont">
            <div style="display: none" class="avatar-loading"></div>
            <img width="120" height="120" alt="" src="{$tsConfig.url}/files/avatar/{if $tsPerfil.p_avatar}{$tsPerfil.user_id}_120{else}avatar{/if}.jpg?t={$smarty.now}" class="avatar-big" id="avatar-img"/>
        </div>
        <ul class="change-avatar" style="display: none;">
            <li class="local-file">
                <div class="mini-modal" id="avatar-local">
                    <div class="dialog-m"></div>
                    <hr class="dropdown-divider">
                    <h6><i class="fas fa-desktop"></i> Desde el PC</h6>
                    <p>Subir una imagen de perfil desde tu PC.</p>
                    <div class="custom-file">
                        <input type="file" name="file-avatar" id="file-avatar" class="inputfile custom"/>
                        <label for="file-avatar"><span id="file_name"></span><strong>Seleccionar...</strong></label>
                    </div>
                    <button onclick="avatar.upload(this)" class="avatar-next local btn btn-success" style="margin-top: 0.5em;">Subir</button>
                </div>
            </li>
            {if $tsConfig.c_allow_upload}
            <li class="url-file">
                <div class="mini-modal" id="avatar-url">
                    <div class="dialog-m"></div>
                    <hr class="dropdown-divider">
                    <h6><i class="fas fa-link"></i> Desde una URL</h6>
                    <p>Subir una imagen desde una URL (Se recomienda usar imgur).</p>
                    <input type="text" name="url-avatar" id="url-avatar" size="45" class="form-control">
                    <button onclick="avatar.upload(this);" class="avatar-next url btn btn-success" style="margin-top: 0.5em;">Subir</button>
                </div>
            </li>
            {else}
            <hr class="dropdown-divider">
            <div class="alert alert-danger" role="alert">
            Lo sentimos por el momento solo puedes subir avatares desde tu PC.
            </div>
            {/if}
            <hr class="dropdown-divider">
        </ul>
    </div>
    <div class="clearfix"></div>
    <button onclick="avatar.edit(this)" class="btn btn-primary" id="avatar-edit" style="margin: 0.5em auto;display: block;">Editar</button>
</div>
<div class="clearfix"></div>


<div id="prueba"></div>