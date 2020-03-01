<div id="perfil_wall" status="activo">
    <script type="text/javascript">
        muro.stream.total = {$tsMuro.total};
    </script>
    <div id="perfil-form" class="widget">
        {if $tsPrivacidad.mf.v == true}
        {include file='modulos/perfil/estado.tpl'}
        {else}
        <div class="emptyData" style="border-top:none">{$tsPrivacidad.mf.m}</div>
        {/if}
    </div>
    <div class="widget clearfix" id="perfil-wall">
        <div id="wall-content">
            {include file='modulos/perfil/historia.tpl'}
        </div>
        <!-- more -->
        {if $tsMuro.total >= 10}
        <div class="more-pubs">
            <div class="content">
                <a href="#" onclick="muro.stream.loadMore('wall'); return false;" class="a_blue">Publicaciones m&aacute;s antiguas</a>
                <span><img width="16" height="11" alt="" src="{$tsConfig.images}/loader.gif"/></span>
            </div>
        </div>
        {elseif $tsMuro.total == 0 && $tsUser->is_member}
        <div class="emptyData">Este usuario no tiene comentarios, se el primero.</div>
        {/if}
    </div>
</div>