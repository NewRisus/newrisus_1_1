{if ($tsPage == 'home' || $tsPage == 'portal') && $tsConfig.news}
<div class="alert alert-primary" role="alert" id="top_news">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
     </button>
    <h4 class="alert-heading">Aviso de {$tsConfig.titulo}!</h4>
    {foreach from=$tsConfig.news key=i item=n}
    <li id="new_{$i+1}" style="margin-bottom: 0em;">{$n.not_body}</li>
    {/foreach}
</div>
{/if}