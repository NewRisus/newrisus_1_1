{if $tsUser->is_admod || $tsUser->permisos.gopp}
<div>
   <form action="{$tsConfig.url}/agregar.php{if $tsAction == 'editar'}?action=editar&pid={$tsPid}{/if}" method="post" name="newpost" autocomplete="off">
      <input type="hidden" value="{$tsDraft.bid}" name="borrador_id"/>
      <div class="col-9 float-left">
         <li class="form-group">
            <h6><b>Título del tema</b></h6>
            <span style="display: none;" class="errormsg"></span>
            <input type="text" tabindex="1" name="titulo" class="form-control text-inp required" value="{$tsDraft.b_title}" placeholder="Escribe el título">
            <div id="repost"></div>
            <small id="emailHelp" class="form-text text-muted opcion-tema-small">Recuerda crear un título descriptivo.</small>
         </li>
         <li class="form-group">
            <h6><b>Contenido</b></h6>
            <span style="display: none;" class="errormsg"></span>
            <textarea id="markItUp" name="cuerpo" tabindex="2" style="min-height:400px;" class="form-control required">{$tsDraft.b_body}</textarea>
            <div id="repost"></div>
         </li>
      </div>
      <div class="col-3 float-right">
         <li class="form-group">
            <h6><b>Etiquetas del tema</b></h6>
            <span style="display: none;" class="errormsg"></span>
            <input type="text" tabindex="4" name="tags" class="form-control text-inp required" value="{$tsDraft.b_tags}" placeholder="Escribe las etiquetas">
            <div id="repost"></div>
            <small id="tags" class="form-text text-muted opcion-tema-small">Una lista separada por comas, que describa el contenido. Ejemplo: <b>gol, ingleses, Copa Oro, futbol.</b></small>
         </li>
         <li class="form-group">
            <h6><b>Categoría</b></h6>
            <span style="display: none;" class="errormsg"></span>
            <select class="form-control agregar required" tabindex="5" name="categoria">
               <option value="" selected="selected">Elegir categoría</option>
               {foreach from=$tsConfig.categorias item=c}
               <option value="{$c.cid}" {if $tsDraft.b_category == $c.cid}selected="selected"{/if}><i class="fas fa-language"></i> {$c.c_nombre}</option>
               {/foreach}
            </select>
         </li>
          <li class="form-group">
          <h6><b>Opciones del tema</b></h6>  
              <input class="inp-cbx" id="privado" name="privado" tabindex="6" type="checkbox" style="display: none;" {if $tsDraft.b_private == 1}checked="checked"{/if}>
                <label class="cbx" for="privado"><span><svg width="12px" height="10px" viewbox="0 0 12 10"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                    <span><b>Tema privado</b><br><small>Solo para miembros de {$tsConfig.titulo}</small></span>
                </label>
              <br>
              <hr class="dropdown-divider">
              <input class="inp-cbx" id="sin_comentarios" name="sin_comentarios" tabindex="7" type="checkbox" style="display: none;" {if $tsDraft.b_block_comments == 1}checked="checked"{/if}>
                <label class="cbx" for="sin_comentarios"><span><svg width="12px" height="10px" viewbox="0 0 12 10"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                    <span><b>Comentarios cerrados.</b><br><small>No podrán agregar comentarios a tu tema.</small></span>
                </label>
              <br>
              <hr class="dropdown-divider">
              <input class="inp-cbx" id="visitantes" name="visitantes" tabindex="8" type="checkbox" style="display: none;" {if $tsDraft.b_visitantes == 1}checked="checked"{/if}>
                <label class="cbx" for="visitantes"><span><svg width="12px" height="10px" viewbox="0 0 12 10"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                    <span><b>Mostrar visitantes recientes.</b><br><small>Mostrará quienes visitaron tu tema últimamente.</small></span>
                </label>
              <br>
              <hr class="dropdown-divider">
              <input class="inp-cbx" id="smileys" name="smileys" tabindex="9" type="checkbox" style="display: none;" {if $tsDraft.b_smileys == 1}checked="checked"{/if}>
                <label class="cbx" for="smileys"><span><svg width="12px" height="10px" viewbox="0 0 12 10"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                    <span><b>Sin emojis.</b><br><small>No se permitirán emojis en tu tema.</small></span>
                </label>
              <br>
              {if $tsUser->is_admod == 1}
              <hr class="dropdown-divider">
              <input class="inp-cbx" id="patrocinado" name="patrocinado" tabindex="9" type="checkbox" style="display: none;" {if $tsDraft.b_sponsored == 1}checked="checked"{/if}>
                <label class="cbx" for="patrocinado"><span><svg width="12px" height="10px" viewbox="0 0 12 10"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                    <span><b>Patrocinar.</b><br><small>Resaltar este tema entre los demás.</small></span>
                </label>
              <br>
              {/if}
              {if $tsUser->is_admod || $tsUser->permisos.most}
              <hr class="dropdown-divider">
              <input class="inp-cbx" id="sticky" name="sticky" tabindex="7" type="checkbox" style="display: none;" {if $tsDraft.b_sticky == 1}checked="checked"{/if}>
                <label class="cbx" for="sticky"><span><svg width="12px" height="10px" viewbox="0 0 12 10"><polyline points="1.5 6 4.5 9 10.5 1"></polyline></svg></span>
                    <span><b>Sticky.</b><br><small>Fijar este tema en el foro.</small></span>
                </label>
              <br>
              {/if}
          
          
         {if ($tsUser->is_admod > 0 || $tsUser->permisos.moedpo) && $tsDraft.b_title && $tsDraft.b_user != $tsUser->uid}
         <label>Raz&oacute;n</label>
         <span style="display: none;" class="errormsg"></span>
         <input type="text" tabindex="8" name="razon" class="form-control text-inp" value="">
         Si has modificado el contenido de este post ingresa la raz&oacute;n por la cual lo modificaste.
         {/if}
              
          </li>
         <hr>
         <div id="borrador-guardado" style="float: right; font-style: italic; margin: 7px 0pt 0pt;"></div>
         
         <button type="button" class="btn btn-block btn-primary" tabindex="9" title="Guardar en borradores" value="Guardar en borradores" onclick="save_borrador()" id="borrador-save">Guardar borrador</button>
          <div class="btn-group" role="group" style="width: 100%;margin-top: 0.5em;">
              <button type="button" id="vistaPrevia" class="btn btn-secondary">Vista previa</button>
              <button type="button" id="PublicarPost"  class="btn btn-{if $tsDraft}info{else}primary{/if}">{if $tsDraft}Guardar{else}Publicar{/if}</button>
          </div>
      </div>
   </form>
</div>
{/if}