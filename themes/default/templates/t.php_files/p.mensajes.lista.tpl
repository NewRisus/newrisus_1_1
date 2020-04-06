    {if $tsMensajes.data}
    {foreach from=$tsMensajes.data item=mp}
    <li{if $mp.mp_read_to == 0 || $mp.mp_read_mon_to == 0} class="bg-info"{/if}>
        <a href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}" title="{$mp.mp_subject}">
            <img src="{$tsConfig.url}/files/avatar/{$mp.mp_from}_120.jpg" alt="{$mp.user_name}"/>
            <div class="content">
                <div class="subject">{$mp.mp_subject}</div>
                <!--<div class="preview">{$mp.mp_preview}</div>-->
                <div class="small"><span class="autor">👤 {$mp.user_name}</span> | 🕒 {$mp.mp_date|hace}</div>
            </div>
        </a>
    </li>
    {/foreach}
    {else}
    <div class="alert alert-warning">No tienes mensajes</div>
    {/if}