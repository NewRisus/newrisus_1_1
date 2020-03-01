<div class="nr-home-box">
    <h6><b>Anuncio / Publicidad</b></h6>
    <span class="nr-eye-hom">
        <b onclick="$('#ad468').slideToggle();" title="Ocultar/mostrar categoría"><i class="far fa-eye"></i></b>
    </span>
    <hr class="nr-divider">
    <center id="ad468">
    {if $tsConfig.ads_468}{$tsConfig.ads_468}{else}<img class="add-width" src="{$tsConfig.tema.t_url}/images/ad468.png">{/if}
    </center>
</div>