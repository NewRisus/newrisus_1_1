<div class="container bg-white my-4">
	<h3 class="m-0 p-3 text-center">Chat {$tsConfig.titulo}</h3>
	<div class="row">
		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-12">
			{if $tsConfig.chat_id}
				<embed src="http://{$tsConfig.chat_id}.chatango.com/group" width="100%" height="472" wmode="transparent" allowScriptAccess="always" allowNetworking="all" type="application/x-shockwave-flash" allowFullScreen="true" flashvars="cid={$tsConfig.chat_id}&v=0&w=0"></embed>
        	{elseif $tsConfig.xat_id}
				<embed src="http://www.xatech.com/web_gear/chat/chat.swf" quality="high" width="100%" height="472" name="chat" FlashVars="id={$tsConfig.xat_id}" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://xat.com/update_flash.shtml" /><br><small><a target="_BLANK" href="http://xat.com/web_gear/chat/go_large.php?id={$tsConfig.xat_id}">Chat m&aacute;s amplio.</a></small><br>
			{else}
        		<div class="alert alert-primary">Estamos por agregar el chat para que todos ustedes se puedan divertir y hacer nuevos amigos.</div>
        {/if}
		</div>
		<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
			<h4 onclick="$('#protocolo').slideToggle();">Protocolo</h4>
			<div style="display:none;" id="protocolo" >	
				<font class="size12"><b>1.</b> No se permite el uso de nicks que contengan t&eacute;rminos insultantes, sexuales, spam, apolog&iacute;as a la violencia o alg&uacute;n pedido de car&aacute;cter sexual, compa&ntilde;&iacute;a, parejas y/o a fines.<br />
				<b>2.</b> Est&aacute; prohibido faltar el respeto, insultar, provocar, difamar, acosar, amenazar o hacer cualquier otra cosa no deseada, tanto directa como indirecta a otro usuario.<br />
				<b>3.</b> No est&aacute; permitido el SPAM, publicidad o propaganda de p&aacute;ginas personales, chats, foros, mensajes comerciales destinados a vender productos o servicios, etc.<br>
	    		<b>4.</b> No repetir o enviar varias l&iacute;neas de texto en un cierto tiempo, NO FLOOD.<br />
	    		<b>5.</b> Recomendamos no abusar de las MAY&Uacute;SCULAS, solo utilizarlas por reglas ortograficas (comienzos de oraci&oacute;n, nombres propios o siglas), ya que el uso de &eacute;sta significa GRITAR.</font><br /><p class="m-0 p-0 text-right"><i>Este protocolo es solo para el chat, para la web en general existe otro <a href="{$tsConfig.url}/pages/protocolo/">protocolo</a>.</i></p>
	    	</div>
		    {include file='modulos/ads/300.tpl'}
		    {if $tsConfig.chat_id}<br />
		    {include file='modulos/ads/300.tpl'}
		    {/if}
		</div>
	</div>
</div>