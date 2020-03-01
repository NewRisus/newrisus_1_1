<div class="nr-home-box">
    <h6><b>Anuncio / Publicidad</b></h6>
    <span class="nr-eye-hom">
        <b onclick="$('#ad160').slideToggle();" title="Ocultar/mostrar categoría"><i class="far fa-eye"></i></b>
    </span>
    <hr class="nr-divider">
    <center id="ad160">
    {if $tsConfig.ads_160}{$tsConfig.ads_160}{else}<img class="add-width" src="{$tsConfig.tema.t_url}/images/ad160.png">{/if}
    </center>
</div>

