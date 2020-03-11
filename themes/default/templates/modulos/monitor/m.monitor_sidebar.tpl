<div style="width: 210px; float: right;" id="post-izquierda">
   <div class="categoriaList">
      <h6 style="margin:0;">Filtrar Actividad</h6>
      <ul id="nots_filter">
         <li style="text-align:center;">Elige que notificaciones recibir y cuales no.</li>
         <li class="divider"></li>
         <li><label onclick="notifica.filter_check();"><strong>&bull; <span class="change">Marcar todos</span></strong></label></li>
         <li class="divider"></li>
         <div class="emptyData" id="Msj" style="display:none;">Configuraciones guardadas</div>
         <li><strong>Mis Posts</strong></li>
         <li><label><span class="monac_icons ma_star"></span><input type="checkbox" value="1" {if $tsData.filtro.1 == false}checked="true"{/if} /> Favoritos</label></li>
         <li><label><span class="monac_icons ma_comment_post"></span><input type="checkbox" value="2" {if $tsData.filtro.2 == false}checked="true"{/if} /> Comentarios</label></li>
         <li><label><span class="monac_icons ma_points"></span><input type="checkbox" value="3" {if $tsData.filtro.3 == false}checked="true"{/if} /> Puntos Recibidos</label></li>
         <li><label><span class="monac_icons ma_medal"></span><input type="checkbox" value="16" {if $tsData.filtro.16 == false}checked="true"{/if} /> Medallas recibidas</label></li>
         <li><strong>Mis Comentarios</strong></li>
         <li><label><span class="monac_icons ma_voto"></span><input type="checkbox" value="8" {if $tsData.filtro.8 == false}checked="true"{/if} /> Votos</label></li>
         <li><label><span class="monac_icons ma_comment_resp"></span><input type="checkbox" value="9" {if $tsData.filtro.9 == false}checked="true"{/if} /> Respuestas</label></li>
         <li><strong>Usuarios que sigo</strong></li>
         <li><label><span class="monac_icons ma_follow"></span><input type="checkbox" value="4" {if $tsData.filtro.4 == false}checked="true"{/if} /> Nuevos</label></li>
         <li><label><span class="monac_icons ma_post"></span><input type="checkbox" value="5" {if $tsData.filtro.5 == false}checked="true"{/if} /> Posts</label></li>
         <li><label><span class="monac_icons ma_photo"></span><input type="checkbox" value="10" {if $tsData.filtro.10 == false}checked="true"{/if} /> Fotos</label></li>
         <li><label><span class="monac_icons ma_share"></span><input type="checkbox" value="6" {if $tsData.filtro.6 == false}checked="true"{/if} /> Recomendaciones</label></li>
         <li><strong>Posts que sigo</strong></li>
         <li><label><span class="monac_icons ma_blue_ball"></span><input type="checkbox" value="7" {if $tsData.filtro.7 == false}checked="true"{/if} /> Comentarios</label></li>
         <li><strong>Mis Fotos</strong></li>
         <li><label><span class="monac_icons ma_comment_post"></span><input type="checkbox" value="11" {if $tsData.filtro.11 == false}checked="true"{/if} /> Comentarios</label></li>
         <li><label><span class="monac_icons ma_medal"></span><input type="checkbox" value="17" {if $tsData.filtro.17 == false}checked="true"{/if} /> Medallas recibidas</label></li>
         <li><strong>Perfil</strong></li>
         <li><label><span class="monac_icons ma_status"></span><input type="checkbox" value="12" {if $tsData.filtro.12 == false}checked="true"{/if} /> Publicaciones</label></li>
         <li><label><span class="monac_icons ma_w_comment"></span><input type="checkbox" value="13" {if $tsData.filtro.13 == false}checked="true"{/if} /> Comentarios</label></li>
         <li><label><span class="monac_icons ma_w_like"></span><input type="checkbox" value="14" {if $tsData.filtro.14 == false}checked="true"{/if} /> Likes</label></li>
         <li><label><span class="monac_icons ma_medal"></span><input type="checkbox" value="15" {if $tsData.filtro.15 == false}checked="true"{/if} /> Medallas recibidas</label></li>
         <li class="divider"></li>
         <center><a href="#" onclick="notifica.filter(); return false;" class="mBtn btnOk" style="margin:auto;display:inline-block;">Guardar cambios</a></center>
      </ul>
   </div>
   <div class="categoriaList estadisticasList">
      <h6>Estad&iacute;sticas</h6>
      <ul>
         <li class="clearfix"><a href="{$tsConfig.url}/monitor/seguidores"><span class="floatL">Seguidores</span><span class="floatR number">{$tsData.stats.seguidores}</span></a></li>
         <li class="clearfix"><a href="{$tsConfig.url}/monitor/siguiendo"><span class="floatL">Usuarios Siguiendo</span><span class="floatR number">{$tsData.stats.siguiendo}</span></a></li>
         <li class="clearfix"><a href="{$tsConfig.url}/monitor/posts"><span class="floatL">Posts</span><span class="floatR number">{$tsData.stats.posts}</span></a></li>
      </ul>
   </div>
   {if $tsConfig.c_allow_live == 1}
   <div class="categoriaList">
      <h6>Notificaciones Live</h6>
      <ul>
         <li class="clearfix"><label><input type="checkbox" value="" {if $tsStatus.live_nots == 'ON'}checked="true"{/if} onclick="live.ch_status('nots');"/> <b>Mostrar notificaciones</b></label></li>
         <li class="clearfix"><label><input type="checkbox" value="" {if $tsStatus.live_mps == 'ON'}checked="true"{/if} onclick="live.ch_status('mps');"/> <b>Mostrar mensajes nuevos</b></label></li>
         <li class="clearfix"><label><input type="checkbox" value="" {if $tsStatus.live_sound == 'ON'}checked="true"{/if} onclick="live.ch_status('sound');"/> <b>Reproducir sonidos</b></label></li>
      </ul>
   </div>
   {/if}
</div>