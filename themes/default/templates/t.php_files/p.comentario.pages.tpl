<ul class="pagination justify-content-center">
 	{if $tsPages.prev > 0}
    <li class="page-item">
   	<a class="page-link" href="#ver-comentarios" onclick="comentario.cargar({$tsPages.post_id}, {$tsPages.prev}, {$tsPages.autor});">Anterior</a>
 	</li>
    {/if}
 	{section name=page start=1 loop=$tsPages.section}
   	<li class="page-item{if $tsPages.current == $smarty.section.page.index} active{/if}"><a class="page-link" href="#ver-comentarios" {if $tsPages.current != $smarty.section.page.index}onclick="comentario.cargar({$tsPages.post_id}, {$smarty.section.page.index}, {$tsPages.autor});"{/if}>{$smarty.section.page.index}</a></li>
	{/section}
 	{if $tsPages.next <= $tsPages.pages}
        <li class="page-item"><a class="page-link" href="#ver-comentarios" onclick="comentario.cargar({$tsPages.post_id}, {$tsPages.next}, {$tsPages.autor});"><b>Siguiente &raquo;</b></a></li>
    {/if}
</ul>