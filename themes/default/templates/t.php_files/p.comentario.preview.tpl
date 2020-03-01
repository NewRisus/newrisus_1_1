1:
{if $tsType == 'new'} 
<div id="div_cmnt_{$tsComment.0}" class="nr-topic">
    <span id="citar_comm_{$tsComment.0}" style="display:none">{$tsComment.2}</span>
    <div class="row" id="pp_{$tsComment.0}">
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
                <span>Publicado hace <span style="text-transform: lowercase;">{$tsComment.3|hace}</span></span>
                <span class="float-right">ID #{$c.cid}</span>
                <div style="padding-top: 1.5em;">
                    <ul id="ul_cmt_{$c.cid}">
                        <div id="comment-body-{$tsComment.0}" class="wysibbClass" style="line-height: 1.7em;">
                            <p>{$tsComment.1|nl2br}</p>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
{elseif $tsType == 'edit'}
<div id="preview">
    <div id="new-com-html" style="font-size: 16px;">{$tsComment.1|nl2br}</div>
    <div id="new-com-bbcode" style="display:none">{$tsComment.5}</div>
</div>
{/if}