<div id="resultados" class="resultadosFull"> 
    <div class="row"> 
        <div class="col-sm-2">
            <form action="" method="get" class="nr-home-box">
                <h5>Filtrar usuarios</h5>
                <li {if $tsFiltro.online == 'true'}class="here"{/if}>
                    <label>
                        <input type="checkbox" name="online" value="true" {if $tsFiltro.online == 'true'}checked="true"{/if}/>En linea
                    </label>
                </li> 
                <li {if $tsFiltro.sex == 'm'}class="here"{/if}>
                    <label>
                        <input type="radio" name="sexo" value="m" {if $tsFiltro.sex == 'm'}checked="true"{/if}/>Hombre
                    </label>
                </li> 
                <li {if $tsFiltro.sex == 'f'}class="here"{/if}>
                    <label>
                        <input type="radio" name="sexo" value="f" {if $tsFiltro.sex == 'f'}checked="true"{/if}/> Mujer
                    </label>
                </li> 
                <li {if $tsFiltro.sex == ''}class="here"{/if}>
                    <label>
                        <input type="radio" name="sexo" value="" {if $tsFiltro.sex == ''}checked="true"{/if}/>Ambos
                    </label>
                </li>
                <li {if $tsFiltro.pais}class="here"{/if}>
                    <label class="select">
                        <select name="pais" id="pais" class="form-control">
                            <option value="">Todos los paises...</option>{foreach from=$tsPaises key=code item=pais}<option value="{$code}" {if $tsFiltro.pais == $code}selected="true"{/if}>{$pais}</option>{/foreach}
                        </select>
                    </label>
                </li>
                <li {if $tsFiltro.rango}class="here"{/if}>
                    <label class="select">
                        <select name="rango" id="rango" class="form-control">
                            <option value="">Todos los rangos...</option>{foreach from=$tsRangos item=r}<option value="{$r.rango_id}" {if $tsFiltro.rango == $r.rango_id}selected="true"{/if}>{$r.r_name}</option>{/foreach}
                        </select>
                    </label>
                </li>
                <li>
                    <input type="submit" class="btn btn-success" value="Filtrar">
                </li>
            </form>
        </div>
        <div class="col-sm-10">
            <div class="alert alert-warning" role="alert">
                Mostrando <strong>{$tsTotal}</strong> resultados de <strong>{$tsPages.total}</strong>
            </div>
            <div id="showResult" class="nr-home-box">
                {if $tsUsers}
                {foreach from=$tsUsers item=u}
                <li class="li-usuario">
                    <div class="row">
                        <div class="col-sm-1">
                            <a href="{$tsConfig.url}/perfil/{$u.user_name}"><img class="avatar-av" src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg">
                                <div class="estado-usuario {$u.status.css}" title="{$tsAutor.status.t}"></div>
                            </a>
                        </div>
                        <div class="col-sm-11">
                            <h5><b><a href="{$tsConfig.url}/perfil/{$u.user_name}" style="color:#{$u.rango.color}" >{$u.user_name}</a></b></h5>
                            {if $u.p_mensaje}<p class="text-usuarios">{$u.p_mensaje}</p>{/if} 
                            <p class="text-usuarios">Ha creado <b>{$u.user_posts}</b> temas y comentado <b>{$u.user_comentarios}</b> veces.</p>
                            <span class="badge badge-success tux" title="Reputación en {$tsConfig.titulo}">{$u.user_puntos} puntos</span>
                            <span class="badge badge-light tux">{if $u.user_id != $tsUser->uid}<a href="#" onclick="{if !$tsUser->is_member}registro_load_form();{else}mensaje.nuevo('{$u.user_name}','','','');{/if}return false"><i class="fas fa-envelope"></i> Enviar Mensaje</a>{/if}</span>
                        </div>
                    </div>
                </li>
                {/foreach}
                {else}
                <div class="alert alert-warning" role="alert">No se encontraro usuarios con los filtros seleccionados.</div>
                {/if}
                <div class="paginador">
                    {if $tsPages.prev != 0}
                    <div style="text-align:left" class="floatL">
                        <a href="{$tsConfig.url}/usuarios/?page={$tsPages.prev}{if $tsFiltro.online == 'true'}&online=true{/if}{if $tsFiltro.avatar == 'true'}&avatar=true{/if}{if $tsFiltro.sex}&sex={$tsFiltro.sex }{/if}{if $tsFiltro.pais}&pais={$tsFiltro.pais}{/if}{if $tsFiltro.rango}&rango={$tsFiltro.rango}{/if}" class="btn btn-primary">Anterior</a>
                    </div>
                    {/if}
                    {if $tsPages.next != 0}
                    <div style="text-align:right" class="floatR">
                        <a href="{$tsConfig.url}/usuarios/?page={$tsPages.next}{if $tsFiltro.online == 'true'}&online=true{/if}{if $tsFiltro.avatar == 'true'}&avatar=true{/if}{if $tsFiltro.sex}&sex={$tsFiltro.sex }{/if}{if $tsFiltro.pais}&pais={$tsFiltro.pais}{/if}{if $tsFiltro.rango}&rango={$tsFiltro.rango}{/if}" class="btn btn-primary">Siguiente</a>
                    </div>
                    {/if}
                    <div style="clear:both"></div>
                </div>
            </div>
            <div class="floatL" style="margin-left: 5px; width: 180px; margin-top: 25px;">
                <center>{$tsConfig.ads_160}</center>
            </div>
        </div>
    </div>  
</div>
<div style="clear:both"></div>