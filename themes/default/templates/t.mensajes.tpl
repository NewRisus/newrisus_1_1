{include file='sections/main_header.tpl'}
<div class="row">
   <div style="display: none;" class="col-12" id="m-mensaje"></div>
   {include "modulos/mensajes/m.mensajes_menu.tpl"}
   <div class="col-xl-8 col-lg-8 col-md-7 col-sm-12 col-12">
      <div class="bg-white p-2 shadow rounded mb-3" id="mensajes">
         {if $tsAction == '' || $tsAction == 'enviados' || $tsAction == 'respondidos' || $tsAction == 'search'}
            {include "modulos/mensajes/m.mensajes_list.tpl"}
         {elseif $tsAction == 'leer'}
            {include "modulos/mensajes/m.mensajes_leer.tpl"}
         {elseif $tsAction == 'avisos'}
            {include "modulos/mensajes/m.mensajes_avisos.tpl"}         
         {/if}
      </div>
   </div>
</div>
{include file='sections/main_footer.tpl'}