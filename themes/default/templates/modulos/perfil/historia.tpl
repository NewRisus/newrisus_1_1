{literal}
<style type="text/css">
.history {
    border: 1px solid #eee;
    padding: 1em 0em;
    margin: 0em auto;
    border-radius: 5px 5px 0px 0px;
    display: flex;
    box-shadow: 0px 0px 3px #eee;
    width: 100%;
    height: 100%;
}
.history-pie {
    border: 1px solid #eee;
    border-top: 0px;
    padding: 1em 0em;
    margin: 0em auto;
    background: #fafafa;
    border-radius: 0px 0px 5px 5px;
    display: flex;
    box-shadow: 0px 0px 3px #eee;
    width: 100%;
    height: 100%;
}   
</style>
{/literal}

{foreach from=$tsMuro.data item=p}
<div id="pub_{$p.pub_id}" style="margin: 1em auto;">
    <div class="row history" id="pub_{$p.pub_id}">
        <div class="col-sm-1">
            <a href="{$tsConfig.url}/perfil/{$p.user_name}">
                <img class="avatar-img" src="{$tsConfig.url}/files/avatar/{$p.p_user_pub}_120.jpg">
            </a>
        </div>
        <div class="col-sm-11 nr-estatu">
            <div class="float-right">                
                <div class="dropdown float-right">
                    <button class="btn btn-light" type="button" id="OpcionStatu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-ellipsis-v"></i>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="OpcionStatu">
                        {if $p.p_user == $tsUser->uid || $p.p_user_pub == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moepm}
                        <a class="dropdown-item" onclick="muro.del_pub({$p.pub_id},1); return false;">Eliminar estado</a>
                        {/if}
                    </div>
                </div>
            </div>
            <h6><b><a href="{$tsConfig.url}/perfil/{$p.user_name}">{if $p.user_name == $tsUser->nick}{$tsUser->nick}{else}{$p.user_name}{/if}</a></b>
            <small class="d-block text-muted" style="font-size: 9px;"><i class="far fa-clock"></i> {$p.p_date|fecha}</small></h6>
            <p style="font-size:16px; margin-bottom:0px;">{$p.p_body|quot}</p>
            {if $p.p_type != 1}
            <div class="mvm clearfix">
                {if $p.p_type == 2}
                <a href="#" onclick="muro.load_atta('foto', '{$p.a_url}', this); return false" class="uiPhoto"><img src="{$p.a_img}"/><i class="fas fa-expand-alt"></i></a>
                {elseif $p.p_type == 3}
                <div class="uiLink">
                    <div><a href="{$p.a_url}" target="_blank" class="a_blue"><strong>{$p.a_title}</strong></a></div>
                    <a href="{$p.a_url}" target="_blank" class="a_blue">{$p.a_url}</a>
                </div>
                {elseif $p.p_type == 4}
                <div class="uiVideoThumb" onclick="muro.load_atta('video','{$p.a_url}', this); return false;">
                    <img src="https://img.youtube.com/vi/{$p.a_url}/0.jpg"/>
                    <div class="videoDesc">
                        <a href="https://www.youtube.com/watch?v={$p.a_url}" target="_blank">{$p.a_title}</a>
                        <span>{$p.a_desc}</span>
                        <i></i>
                    </div>
                </div>
                {/if}
            </div>
            {/if}
        </div>
    </div>
    <div class="row history-pie">
        <div class="col-sm-12">
            <div class="botones-perfil-social">
                {if $p.p_likes == 0}{else}<b class="float-left btn btn-light btn-sm" id="lk_{$p.pub_id}">{$p.likes.text}</b>{/if}
                <button class="btn btn-light btn-sm" onclick="muro.like_this({$p.pub_id}, 'pub', this); return false;" title="{$p.likes.link}">{$p.likes.link}</button>
                <button class="btn btn-light btn-sm" onclick="muro.show_comment_box({$p.pub_id}); return false" title="Dejar comentario">Comentar</button>
            </div>
            <div class="Story_Foot"> 
                <ul id="cb_{$p.pub_id}" class="Story_Comments" {if $p.p_comments == 0 && $p.p_likes == 0}style="display:none"{/if}>
                    <li>
                        <ul id="cl_{$p.pub_id}" class="commentList">
                            {if $p.p_comments > 2 && !$p.hide_more_cm}
                            <li class="ufiItem">
                                <div class="more_comments clearfix">
                                    <i></i>
                                    <a href="#" class="a_blue floatL" onclick="muro.more_comments({$p.pub_id}, this); return false">Ver los {$p.p_comments} comentarios</a>
                                    <img width="16" height="11" src="{$tsConfig.images}/loading_white.gif"/>
                                </div>
                            </li>
                            {/if}
                            {foreach from=$p.comments item=c}
                            <li class="ufiItem" id="cmt_{$c.cid}">
                                <div class="clearfix">
                                    <a href="{$tsConfig.url}/perfil/{$c.user_name}" class="autorPic"><img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.c_user}_50.jpg" style="border-radius:  50%; height: 2.5em; width: 2.5em;"/></a>
                                    {if $p.p_user == $tsUser->uid || $c.c_user == $tsUser->uid  || $tsUser->is_admod || $tsUser->permisos.moecm}<span class="close"><a href="#" onclick="muro.del_pub({$c.cid}, 2); return false" class="uiClose" title="Eliminar"></a></span>{/if}
                                    <div class="mensaje">
                                        <a href="{$tsConfig.url}/perfil/{$c.user_name}" class="autorName a_blue">{$c.user_name}</a>
                                        <span>{$c.c_body|quot}</span>
                                        <div class="cmInfo">{$c.c_date|fecha} &middot; <a onclick="muro.like_this({$c.cid}, 'com', this); return false;" class="a_blue">{$c.like}</a> <span class="cm_like"{if $c.c_likes == 0} style="display:none"{/if}>&middot; <i></i> <a onclick="muro.show_likes({$c.cid}, 'com'); return false;" id="lk_cm_{$c.cid}" class="a_blue">{$c.c_likes} persona{if $c.c_likes > 1}s{/if}</a></span>{if $tsUser->is_admod} &middot;<span class="cmInfo">{$c.c_ip}</span>{/if}</div>
                                    </div>
                                </div>
                            </li>
                            {/foreach}
                        </ul> 
                    </li>{if $tsPrivacidad.mf.v == true && $tsUser->is_member || $tsType == 'news'}
                    <li class="ufiItem">
                        <div class="newComment">
                            <div class="formulario form-group row">
                                <div class="col-sm-1">
                                    <img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg" class="float-left avatar-img">
                                </div>
                                <div class="col-sm-11">
                                    <textarea class="comentar form-control" title="Escribe un comentario..." id="cf_{$p.pub_id}" pid="{$p.pub_id}" name="add_wall_comment" onfocus="onfocus_input(this)" onblur="onblur_input(this)"></textarea>
                                </div>
                            </div>
                        </div>
                    </li>{/if}
                </ul>
            </div>
        </div>
    </div>
</div>

{/foreach}