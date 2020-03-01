<div class="nr-home-box">
    <h6><b>Estadísticas de {$tsConfig.titulo}</b></h6>
    <span class="nr-eye-hom">
        <b onclick="$('#stats').slideToggle();" title="Ocultar/mostrar categoría"><i class="far fa-eye"></i></b>
    </span>
    <hr class="nr-divider">
    <div id="stats">
        <div title="R&eacute;cord conectados: {$tsStats.stats_max_online} {$tsStats.stats_max_time|fecha}">Actualmente están conectados:</div>
        {foreach  from=$tsUsers key=us item=m}
            {if $m.status.t==Online} 
                <a href="{$tsConfig.url}/perfil/{$m.user_name}" uid="{$m.user_id}" style="color: #{$m.r_color};"><b>{$m.user_name}</b></a>
            {/if}                   			
        {/foreach}
        <hr class="nr-divider">
        <div class="row">
            <div class="col-sm-3">
                <div class="nr-box-stats">
                    <span class="nr-stats-ico">
                        <i class="fa fa-paste"></i>
                    </span>
                    <div style="align-items: center; display: flex;">
                    <b class="nr-stats-title">Temas<br><div class="nr-stats-number">{$tsStats.stats_posts}</div></b>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="nr-box-stats">
                    <span class="nr-stats-ico">
                        <i class="fa fa-comments"></i>
                    </span>
                    <b class="nr-stats-title">Comentarios<br><div class="nr-stats-number">{$tsStats.stats_comments}</div></b>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="nr-box-stats">
                    <span class="nr-stats-ico">
                        <i class="fa fa-chart-pie"></i>
                    </span>
                    <b class="nr-stats-title" title="{$tsStats.stats_online} usuarios conectados">Miembros<br><div class="nr-stats-number">{$tsStats.stats_miembros}</div></b>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="nr-box-stats">
                    {foreach from=$tsLastUser item=m}
                    <span class="nr-stats-ico" style="background-image: url('{$tsConfig.url}/files/avatar/{$m.user_id}_120.jpg');background-size: 200%;background-position: center;">
                    </span>
                    <b class="nr-stats-title">Último miembro<br><div class="nr-stats-number"><a title="{$m.user_lastactive|hace}" href="{$tsConfig.url}/perfil/{$m.user_name}">{$m.user_name}</a></div></b>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>