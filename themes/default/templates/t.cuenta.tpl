{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/cuenta.js?{$smarty.now}"></script>
{literal}
<script type="text/javascript">
    $(document).ready(function(){
        //document.domain = global_data.domain;
        // {/literal}
        avatar.uid = '{$tsUser->uid}';
        avatar.current = '{$tsConfig.url}/files/avatar/{if $tsPerfil.p_avatar}{$tsPerfil.user_id}{else}avatar{/if}.jpg';
        // {literal}                
        if (typeof location.href.split('#')[1] != 'undefined') {
            $('ul.menu-tab > li > a:contains('+location.href.split('#')[1]+')').click();
        }
    });
</script>
{/literal}
<br>
<div class="row">
    <div class="col-sm-4 col-sm">
        {include file='modulos/cuenta/avatar.tpl'}
        <br>
        <div class="row">
            <div class="col-12">
                <div class="list-group" id="list-tab" role="tablist">
                    <a class="list-group-item list-group-item-action active" onclick="cuenta.chgtab(this)" id="list-cuenta-list" data-toggle="list" href="#list-cuenta" role="tab" aria-controls="home">Cuenta</a>
                    <a class="list-group-item list-group-item-action" onclick="cuenta.chgtab(this)" id="list-perfil-list" data-toggle="list" href="#list-perfil" role="tab" aria-controls="profile">Perfil</a>
                    <a class="list-group-item list-group-item-action" onclick="cuenta.chgtab(this)" id="list-bloqueados-list" data-toggle="list" href="#list-bloqueados" role="tab" aria-controls="messages">Bloqueados</a>
                    <a class="list-group-item list-group-item-action" onclick="cuenta.chgtab(this)" id="list-password-list" data-toggle="list" href="#list-password" role="tab" aria-controls="settings">Cambiar clave</a>
                    <a class="list-group-item list-group-item-action" onclick="cuenta.chgtab(this)" id="list-nick-list" data-toggle="list" href="#list-nick" role="tab" aria-controls="messages">Cambiar nick</a>
                    <a class="list-group-item list-group-item-action" onclick="cuenta.chgtab(this)" id="list-privacidad-list" data-toggle="list" href="#list-privacidad" role="tab" aria-controls="settings">Privacidad</a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-8 col-sm">
        <div class="tab-content" id="nav-tabContent" name="editarcuenta">
            <div class="tab-pane fade show active" id="list-cuenta" role="tabpanel" aria-labelledby="list-cuenta-list">
                {include file='modulos/cuenta/cuenta.tpl'}
            </div>
            <div class="tab-pane fade" id="list-perfil" role="tabpanel" aria-labelledby="list-perfil-list">
                {include file='modulos/cuenta/perfil.tpl'}
            </div>
            <div class="tab-pane fade" id="list-bloqueados" role="tabpanel" aria-labelledby="list-bloqueados-list">
                {include file='modulos/cuenta/bloqueados.tpl'}
            </div>
            <div class="tab-pane fade" id="list-password" role="tabpanel" aria-labelledby="list-password-list">
                {include file='modulos/cuenta/clave.tpl'}
            </div>
            <div class="tab-pane fade" id="list-nick" role="tabpanel" aria-labelledby="list-nick-list">
                {include file='modulos/cuenta/nick.tpl'}
            </div>
            <div class="tab-pane fade" id="list-privacidad" role="tabpanel" aria-labelledby="list-privacidad-list">
                {include file='modulos/cuenta/privacidad.tpl'}
            </div>
        </div>
    </div>
</div>
<div class="clearboth"></div>

                

{include file='sections/main_footer.tpl'}