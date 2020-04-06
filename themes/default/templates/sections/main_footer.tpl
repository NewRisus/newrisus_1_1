{if $tsPage == 'login'} {else}</div>{/if}
{* El siguiente contenedor sirve para validar el Copyright *}
{* El ID del div NO debe ser alterado de lo contrario nuestro validador *}
{* tomará al sitio como una web sin copyright *}
<footer>
<div id="pp_copyright">
   <div class="row">
      <div class="col-sm"></div>
      <div class="col-sm-2">
         <a href="{$tsConfig.url}/pages/terminos-y-condiciones/" title="Términos y condiciones">Términos y condiciones</a>
      </div>
      <div class="col-sm-2">
         <a href="{$tsConfig.url}/pages/privacidad/" title="Política de privacidad">Política de privacidad</a>
      </div>
      <div class="col-sm-2">
         <a href="{$tsConfig.url}/pages/protocolo/" title="Revisa nuestro Protocolo">Protocolo</a>
      </div>
      <div class="col-sm-2">
         <a href="{$tsConfig.url}/pages/dmca/" title="Report Abuse - DMCA">Report Abuse - DMCA</a>
      </div>
      <div class="col-sm-2">
         <a href="{$tsConfig.url}/pages/chat/" title="Chat">Chat</a>
      </div>
      <div class="col-sm"></div>
   </div>
   <hr class="nr-divider">
   <div class="row">
      <div class="col-sm"></div>
      <div class="col-sm-10" style="text-align: left;">
         <h2><b><a href="{$tsConfig.url}/" title="{$tsConfig.titulo}">{$tsConfig.titulo}</a></b></h2>
         <span style="font-weight: 100;">Powered by <a href="http://phpost.net/"><b>PHPost</b></a> y <a href="https://newrisus.com/"><b>NewRisus</b></a></span>
      </div>
      <div class="col-sm"></div>
   </div>
</div>
</footer>
{if $tsUser->is_admod && $tsConfig.c_see_mod && $tsConfig.novemods.total}
{include file='sections/alerta.tpl'}
{/if}
</div>
</body>
</html>