{if $tsDo == 'search' && $tsPosts}
<br><div class="alert alert-danger" role="alert">
  <h4 class="alert-heading">¡Espera!</h4>
  <p>Parece que existen temas similares al que quieres agregar, te recomendamos leerlos antes para evitar un repost.</p>
  <hr>
    {foreach from=$tsPosts item=p}
    <p class="mb-0"><a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" target="_blank" class="alert-link">{$p.post_title}</a></p>
    {/foreach}
</div>
{else}
{$tsTags}
{/if}