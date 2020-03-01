<div class="nr-home-box">
    <h6><b>Anuncio / Publicidad</b></h6>
    <span class="nr-eye-hom">
        <b onclick="$('#ad728').slideToggle();" title="Ocultar/mostrar categoría"><i class="far fa-eye"></i></b>
    </span>
    <hr class="nr-divider">
    <center id="ad728">
    {if $tsConfig.ads_728}{$tsConfig.ads_728}{else}<img class="add-width" src="{$tsConfig.tema.t_url}/images/ad728.png">{/if}
    </center>
</div>