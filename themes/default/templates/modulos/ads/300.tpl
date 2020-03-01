<div class="nr-home-box">
    <h6><b>Anuncio / Publicidad</b></h6>
    <span class="nr-eye-hom">
        <b onclick="$('#ad300').slideToggle();" title="Ocultar/mostrar categoría"><i class="far fa-eye"></i></b>
    </span>
    <hr class="nr-divider">
    <center id="ad300">
    {if $tsConfig.ads_300}{$tsConfig.ads_300}{else}<img class="add-width" src="{$tsConfig.tema.t_url}/images/ad300.png">{/if}
    </center>
</div>
