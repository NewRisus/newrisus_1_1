<div class="nr-home-box">
    <h6><b>Ranking <small>del mes</small></b></h6>
    <hr class="nr-divider">
    {foreach from=$tsTopUsers.mes key=i item=u}
    <ul>
        <li class="nr-home-comments">
            <a href="{$tsConfig.url}/perfil/{$u.user_name}/"><img class="nr-home-comments-img" src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg"></a>
            <div class="nr-home-comments-content">
                <a href="{$tsConfig.url}/perfil/{$u.user_name}/"><b>{$u.user_name}</b></a> <span>con</span> 
                <b>{$u.total} puntos</b>
            </div>
        </li>
    </ul>
    {/foreach}
</div>