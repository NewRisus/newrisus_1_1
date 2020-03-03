{include file='sections/main_header.tpl'}
{if $tsAction == 'ayuda'}
   <div class="emptyData">Hola <u>{$tsUser->nick}</u>, S&iacute; necesitas ayuda, por favor cont&aacute;ctanos a trav&eacute;s del siguiente <a href="{$tsConfig.url}/pages/contacto/">formulario</a>.</div>
{elseif $tsAction == 'chat'}
   {include file='modulos/pages/m.pages_chat.tpl'}
{elseif $tsAction == 'protocolo'}
   {include file='modulos/pages/protocolo.tpl'}
{elseif $tsAction == 'terminos-y-condiciones'}
   {include file='modulos/pages/terminos-y-condiciones.tpl'}
{elseif $tsAction == 'privacidad'}
   {include file='modulos/pages/politica-privacidad.tpl'}
{elseif $tsAction == 'dmca'}
   {include file='modulos/pages/m.pages_dmca.tpl'}
{/if}
{include file='sections/main_footer.tpl'}