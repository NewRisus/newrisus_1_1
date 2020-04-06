<div class="bg-white shadow p-2 rounded mb-3">
   <h6 class="h6">Filtrar Actividad</h6>
   <ul class="list-unstyled p-0 checkbox" id="nots_filter">
      <li><label onclick="notifica.filter_check();"><span class="change">Marcar todos</span></label></li>
      <li class="divider"></li>
      <div class="alert alert-info small p-2" id="message__done" style="display:none;">Configuraciones guardadas</div>
      <li><strong>Mis Posts</strong></li>
      <li><input type="checkbox" id="f1" value="1"{if $tsData.filtro.1} checked="true"{/if}/><label for="f1">Favoritos</label></li>
      <li><input type="checkbox" id="f2" value="2"{if $tsData.filtro.2} checked="true"{/if}/><label for="f2">Comentarios</label></li>
      <li><input type="checkbox" id="f3" value="3"{if $tsData.filtro.3} checked="true"{/if}/><label for="f3">Puntos Recibidos</label></li>
      <li><input type="checkbox" id="f16" value="16"{if $tsData.filtro.16} checked="true"{/if}/><label for="f16">Medallas recibidas</label></li>
      <li><strong>Mis Comentarios</strong></li>
      <li><input type="checkbox" id="f8" value="8"{if $tsData.filtro.8} checked="true"{/if}/><label for="f8">Votos</label></li>
      <li><input type="checkbox" id="f9" value="9"{if $tsData.filtro.9} checked="true"{/if}/><label for="f9">Respuestas</label></li>
      <li><strong>Usuarios que sigo</strong></li>
      <li><input type="checkbox" id="f4" value="4"{if $tsData.filtro.4} checked="true"{/if}/><label for="f4">Nuevos</label></li>
      <li><input type="checkbox" id="f5" value="5"{if $tsData.filtro.5} checked="true"{/if}/><label for="f5">Posts</label></li>
      <li><input type="checkbox" id="f10" value="10"{if $tsData.filtro.10} checked="true"{/if}/><label for="f10">Fotos</label></li>
      <li><input type="checkbox" id="f6" value="6"{if $tsData.filtro.6} checked="true"{/if}/><label for="f6">Recomendaciones</label></li>
      <li><input type="checkbox" id="f18" value="18"{if $tsData.filtro.18} checked="true"{/if}/><label for="f8">Menciones</label></li>
      <li><strong>Posts que sigo</strong></li>
      <li><input type="checkbox" id="f7" value="7"{if $tsData.filtro.7} checked="true"{/if}/><label for="f7">Comentarios</label></li>
      <li><strong>Mis Fotos</strong></li>
      <li><input type="checkbox" id="f11" value="11"{if $tsData.filtro.11} checked="true"{/if}/><label for="f11">Comentarios</label></li>
      <li><input type="checkbox" id="f17" value="17"{if $tsData.filtro.17} checked="true"{/if}/><label for="f17">Medallas recibidas</label></li>
      <li><strong>Perfil</strong></li>
      <li><input type="checkbox" id="f12" value="12"{if $tsData.filtro.12} checked="true"{/if}/><label for="f12">Publicaciones</label></li>
      <li><input type="checkbox" id="f13" value="13"{if $tsData.filtro.13} checked="true"{/if}/><label for="f13">Comentarios</label></li>
      <li><input type="checkbox" id="f14" value="14"{if $tsData.filtro.14} checked="true"{/if}/><label for="f14">Likes</label></li> 
      <li><input type="checkbox" id="f15" value="15"{if $tsData.filtro.15} checked="true"{/if}/><label for="f15">Medallas recibidas</label></li>

      <li class="divider"></li>
      <li class="text-center"><a href="#" onclick="notifica.filter(); return false;" class="btn btn-sm btn-info">Guardar cambios</a></li>
   </ul> 
</div>
<div class="bg-white shadow p-2 rounded mb-3">
   <h6 class="h6">Estad&iacute;sticas</h6>
   <ul class="list-unstyled p-0">
      <li class="py-1"><a href="{$tsConfig.url}/monitor/seguidores"><span>Seguidores</span><span class="float-right font-weight-bolder">{$tsData.stats.seguidores}</span></a></li>
      <li class="py-1"><a href="{$tsConfig.url}/monitor/siguiendo"><span>Usuarios Siguiendo</span><span class="float-right font-weight-bolder">{$tsData.stats.siguiendo}</span></a></li>
      <li class="py-1"><a href="{$tsConfig.url}/monitor/posts"><span>Posts</span><span class="float-right font-weight-bolder">{$tsData.stats.posts}</span></a></li>
   </ul>
</div>
{if $tsConfig.c_allow_live == 1}
<div class="bg-white shadow p-2 rounded mb-3">
   <h6 class="h6">Notificaciones Live</h6>
   <ul class="list-unstyled p-0">
      <li class="py-1">
         <label>
            <input type="checkbox"{if $tsStatus.live_nots == 'ON'}checked{/if} onclick="live.ch_status('nots');"/> 
            <b>Mostrar notificaciones</b>
         </label>
      </li>
      <li class="py-1">
         <label>
            <input type="checkbox"{if $tsStatus.live_mps == 'ON'}checked{/if} onclick="live.ch_status('mps');"/> 
            <b>Mostrar mensajes nuevos</b>
         </label>
      </li>
      <li class="py-1">
         <label>
            <input type="checkbox"{if $tsStatus.live_sound == 'ON'}checked{/if} onclick="live.ch_status('sound');"/> 
            <b>Reproducir sonidos</b>
         </label>
      </li>
      </ul>
</div>
{/if}