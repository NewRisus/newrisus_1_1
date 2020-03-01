{include file='sections/main_header.tpl'}
<script src="{$tsConfig.js}/posts.js?{$smarty.now}"></script>

<div class="content-fluid">
    <div class="row">
        <div class="col-sm-9">
            {include file='modulos/posts/status.tpl'}
            {include file='modulos/posts/info.tpl'}
            {include file='modulos/posts/post.tpl'}
            <div id="ver">{PrettyPrint}</div>
            {include file='modulos/posts/comentarios.tpl'}
            <a name="comentar"></a>
            {if !$tsUser->is_member}
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading">¿Como comentar?</h4>
                <p>Para poder comentar necesitas estar <a class="alert-link" onclick="registro_load_form(); return false" href="">Registrado.</a></p>
                <hr>
                <p class="mb-0">Si ya eres miembro <a class="alert-link" onclick="open_login_box('open')" href="#">ingresa a tu cuenta</a>.</p>
            </div>
            {elseif $tsPost.block > 0}
                <div class="emptyData clearfix">
                    &iquest;Te has portado mal? {$tsPost.user_name} te ha bloqueado y no podr&aacute;s comentar sus post.
                </div>
            {/if}
        </div>
        <div class="col-sm-3">
            {include file='modulos/posts/relacionados.tpl'}
            {include file='modulos/ads/300.tpl'}
        </div>
    </div>
</div>


<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
<div id="fb-root"></div>
{literal}
<script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v4.0";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
{/literal}
{include file='sections/main_footer.tpl'}