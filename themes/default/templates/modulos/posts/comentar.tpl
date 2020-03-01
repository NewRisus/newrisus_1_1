<div id="procesando">
    <div id="post"></div>
</div>

<div class="nr-topic">
    <span style="display:none">{$tsComment.2}</span>
    <div class="row">
        <div class="col-sm-3 nr-boxi-autor">
            <div class="nr-box-autor">
                <a href="{$tsConfig.url}/perfil/{$tsUser->nick}">
                    <img class="nr-avatar-topic" src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_120.jpg">
                </a>
                <div class="box-autor">
                    <h5>
                        <a href="{$tsConfig.url}/perfil/{$tsUser->nick}"><b>{$tsUser->nick}</b></a>
                    </h5>
                    <b style="color:#{$tsUser->r_color}">{$tsUser->rango}</b>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <div class="nr-contenido-topic">
                <div id="gif_cargando" style="text-align:center; margin-top:1em; display:none">
                    <img src="{$tsConfig.images}/tload.gif" style="border:0;" />
                </div>
                <div class="error"></div>
                <div>
                    <textarea id="body_comm" class="onblur_effect autogrow" tabindex="1" title="Escribir un comentario..." style="resize:none;" onfocus="onfocus_input(this)" onblur="onblur_input(this)">Escribir un comentario...</textarea>
                    <input type="hidden" id="auser_post" value="{$tsPost.post_user}" />
                    <input type="button" onclick="comentario.nuevo('true')" class="btn btn-primary btn-sm" value="Enviar Comentario" tabindex="3" id="btnsComment"/>
                </div>
            </div>
        </div>
    </div>
</div>