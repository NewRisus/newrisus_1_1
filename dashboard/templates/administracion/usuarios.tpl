<div id="res">
   {if !$tsAct}
   {if !$tsMembers.data}
   <div class="alert alert-warning" role="alert">
      No hay usuarios registrados.
   </div>
   {else}
   <div class="table-responsive">
      <table class="table table-data2">
         <thead>
            <tr>
               <th>Rango</th>
               <th>Usuario</th>
               <th>Email</th>
               <th>Última actividad</th>
               <th>registro</th>
               <th>IP</th>
               <th>Estado</th>
               <th>Acciones</th>
            </tr>
         </thead>
         <tbody>
            {foreach from=$tsMembers.data item=m}
            <tr>
               <th><img src="{$tsConfig.images}/icons/ran/{$m.r_image}"></th>
               <td><a href="{$tsConfig.url}/perfil/{$m.user_name}" style="color:#{$m.r_color};">{$m.user_name}</a></td>
               <td>{$m.user_email}</td>
               <td>{if $m.user_lastactive == 0} Nunca{else}{$m.user_lastactive|hace:true}{/if}</td>
               <td>{$m.user_registro|date_format:"%d/%m/%Y"}</td>
               <td><a href="{$tsConfig.url}/moderacion/buscador/1/1/{$m.user_last_ip}" target="_blank">{$m.user_last_ip}</a></td>
               <td id="status_user_{$m.user_id}">{if $m.user_baneado == 1}<font color="red">Suspendido</font>{elseif $m.user_activo == 0}<font color="purple">Inactivo</font>{else}<font color="green">Activo</font>{/if}</td>
               <td class="admin_actions">
                  <a href="{$tsConfig.url}/admin/users?act=show&uid={$m.user_id}" title="Editar Usuario"><i class="fas fa-edit"></i></a>
                  <a href="#" onclick="admin.users.setInActive({$m.user_id}); return false;" title="Activar/Desactivar Usuario"><i class="fas fa-sync"></i></a>
                  <a href="#" onclick="mod.users.action({$m.user_id}, 'aviso', false); return false;" title="Enviar Alerta"><i class="fas fa-exclamation-triangle"></i></a>
                  <a href="#" onclick="mod.{if $m.user_baneado == 1}reboot({$m.user_id}, 'users', 'unban', false){else}users.action({$m.user_id}, 'ban', false){/if}; return false;" title="{if $m.user_baneado == 1}Reactivar{else}Suspender{/if} Usuario"><i class="fas fa-ban"></i></a>
               </td>
            </tr>
            {/foreach}
         </tbody>
         <tfoot>
         <td colspan="8">P&aacute;ginas: {$tsMembers.pages}</td>
         </tfoot>
      </table>
   </div>
   {/if}
   {elseif $tsAct == 'show'}
   <div class="row">
      <div class="col-sm-6">
         <h3>Administrar a <b>{$tsUsername}</b></h3>
      </div>
      <div class="col-sm-6">
         <div class="float-right">
            <div class="input-group mb-3">
               <select class="custom-select" id="Opciones" onchange="location.href='{$tsConfig.url}/admin/users?act=show&uid={$tsUserID}&t=' + this.value;">
                  <option value="1"{if $tsType == 1} selected="true"{/if}>Vista general</option>
                  <option value="5"{if $tsType == 5} selected="true"{/if}>Preferencias</option>
                  <option value="6"{if $tsType == 6} selected="true"{/if}>Borrar Contenido</option>
                  <option value="7"{if $tsType == 7} selected="true"{/if}>Rango</option>
                  <option value="8"{if $tsType == 8} selected="true"{/if}>Firma</option>
               </select>
            </div>
         </div>
      </div>
   </div>
   <hr class="dropdown-divider">
   {if $tsSave}<div class="alert alert-success">Tus cambios han sido guardados.</div>{/if}
   {if $tsError}<div class="alert alert-danger">{$tsError}</div>{/if}
   <form action="" method="post">
      <fieldset>
         {if !$tsType || $tsType == 1}         
         <div class="row">
            <div class="col-sm-6">
               <dl>
                  <dt><label for="user">Nombre de usuario:</label></dt>
                  <dd><input type="text" name="nick" id="user" value="{$tsUserD.user_name}" class="form-control" title="El nick sólo se cambiará si escribe una nueva contraseña" /></dd>
               </dl>
            </div>
            <div class="col-sm-6">
               <dl>
                  <dt><label for="user">Rango:</label></dt>
                  <dd><input type="text" value="{$tsUserD.r_name}" class="form-control" disabled></dd>
               </dl>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-6">
               <dl>
                  <dt><label for="registro">Fecha de registro:</label></dt>
                  <dd><input type="text" value="{$tsUserD.user_registro|date_format:"%d/%m/%Y a las %H:%M"}" class="form-control" disabled></dd>
               </dl>
            </div>
            <div class="col-sm-6">
               <dl>
                  <dt><label>Última conexión:</label></dt>
                  <dd><input type="text" value="{$tsUserD.user_lastactive|hace}" class="form-control" disabled></dd>
               </dl>
            </div>
         </div>
         <div class="row">
            <div class="col-sm-6">
               <dl>
                  <dt><label>Puntos:</label></dt>
                  <dd><input type="text" name="points" id="points" class="form-control" value="{$tsUserD.user_puntos}"></dd>
               </dl>
            </div>
            <div class="col-sm-6">
               <dl>
                  <dt><label>Puntos para dar:</label></dt>
                  <dd><input type="text" name="pointsxdar" id="pointsxdar" class="form-control" value="{$tsUserD.user_puntosxdar}"></dd>
               </dl>
            </div>
            <div class="col-sm-6">
               <dl>
                  <dt><label>Cambios de nick disponibles:</label></dt>
                  <dd><input type="text" name="changenicks" id="changenicks" class="form-control" value="{$tsUserD.user_name_changes}"></dd>
               </dl>
            </div>
         </div>
         <hr class="dropdown-divider">
         <dl>
            <dt><label for="email">E-mail:</label></dt>
            <dd><input type="text" name="email" id="email" class="form-control" value="{$tsUserD.user_email}" /></dd>
         </dl>
         <dl>
            <dt><label for="pwd">Nueva contraseña:</label><span>Debe tener entre 5 y 35 caracteres.</span></dt>
            <dd><input type="password" name="pwd" id="pwd" class="form-control" onkeypress="if($('#cpwd').val() != '') $('#sendata').fadeIn();"/></dd>
         </dl>
         <dl>
            <dt><label for="cpwd">Confirmar contrase&ntilde;a:</label><span>Necesita confirmar su contrase&ntilde;a s&oacute;lo si la ha cambiado arriba.</span></dt>
            <dd><input type="password" name="cpwd" id="cpwd" class="form-control" onkeypress="if($('#pwd').val() != '') $('#sendata').fadeIn();"/></dd>
         </dl>
         <dl id="sendata" style="display:none;">
            <dt><label for="sendata">Informar al usuario</label><span>Marque esta casilla si quiere enviar un e-mail al usuario con los nuevos datos</span></dt>
            <dd><input type="checkbox" name="sendata"/></dd>
         </dl>
         {elseif $tsType == 5}
         
         <div class="field">
            <dl>
               <dt><label>¿Quién puede ver su muro?</label></dt>
               <dd>
               <select name="muro" class="form-control" class="form-control">
                  {foreach from=$tsPrivacidad item=p key=i}
                  <option value="{$i}"{if $tsPerfil.p_configs.m == $i} selected="true"{/if}>{$p}</option>
                  {/foreach}
               </select>
               </dd>
            </dl>
         </div>
         {$tsPerfil.p_configs.muro}
         <div class="field">
            <dl>
               <dt><label>¿Quién puede publicar en su muro?</label></dt>
               <dd>
               <select name="muro_firm" class="form-control" class="form-control">
                  {foreach from=$tsPrivacidad item=p key=i}
                  {if $i != 6}<option value="{$i}"{if $tsPerfil.p_configs.mf == $i}selected{/if}>{$p}</option>{/if}
                  {/foreach}
               </select>
               </dd>
            </dl>
         </div>
         <div class="field">
            <dl>
               <dt><label>¿Puede mostrar visitantes recientes en su perfil?</label></dt>
               <dd>
               <select name="last_hits" class="form-control" class="form-control">
                  {foreach from=$tsPrivacidad item=p key=i}
                  {if $i != 1 && $i != 2}<option value="{$i}"{if $tsPerfil.p_configs.hits == $i}selected{/if}>{$p}</option>{/if}
                  {/foreach}
               </select>
               </dd>
            </dl>
         </div>
         <div class="field">
            <dl>
               <dt><label>¿Quién puede enviarle mensajes privados?</label>
               <small>Esta opción no se aplica a moderadores y administradores.</small></dt>
               <dd>
               <select name="rec_mps" class="form-control" class="form-control">
                  {foreach from=$tsPrivacidad item=p key=i}
                  {if $i != 6}<option value="{$i}"{if $tsPerfil.p_configs.rmp == $i}selected{/if}>{$p}</option>{/if}
                  {/foreach}
                  <option value="8"{if $tsPerfil.p_configs.rmp == 8}selected{/if}>Deshabilitar mensajer&iacute;a (opci&oacute;n administrativa)</option>
               </select>
               </dd>
            </dl>
         </div>
         {elseif $tsType == 6}
         <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" name="bocuenta" id="bocuenta">
            <label class="custom-control-label" for="bocuenta" onclick="$('#ext').slideToggle();">Eliminar toda la cuenta y su contenido.</label>
         </div>
         <div id="ext" class="pl-2">
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="boposts" id="boposts">
               <label class="custom-control-label" for="boposts">Posts <small>Se eliminar&aacute;n todos sus posts y sus comentarios.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bofotos" id="bofotos">
               <label class="custom-control-label" for="bofotos">Fotos <small>Se eliminar&aacute;n todas sus fotos publicadas y sus comentarios.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="boestados" id="boestados">
               <label class="custom-control-label" for="boestados">Estados <small>Se eliminar&aacute;n todas sus publicaciones de muros.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bocomposts" id="bocomposts">
               <label class="custom-control-label" for="bocomposts">Estados Comentarios de Posts <small>Se eliminar&aacute;n todos sus comentarios en posts.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bocomfotos" id="bocomfotos">
               <label class="custom-control-label" for="bocomfotos">Comentarios de Fotos <small>Se eliminar&aacute;n todos sus comentarios en fotos.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bocomestados" id="bocomestados">
               <label class="custom-control-label" for="bocomestados"> Comentarios en Estados <small>Se eliminar&aacute;n todos sus comentarios en estados.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bolike" id="bolike">
               <label class="custom-control-label" for="bolike"> Like <small>Se eliminar&aacute;n sus likes en estados y comentarios en estados.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="boseguidores" id="boseguidores">
               <label class="custom-control-label" for="boseguidores"> Seguidores <small>Se eliminar&aacute; la lista de todos sus seguidores.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bosiguiendo" id="bosiguiendo">
               <label class="custom-control-label" for="bosiguiendo"> Siguiendo <small>Se eliminar&aacute; la lista de todos a los que sigue.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bofavoritos" id="bofavoritos">
               <label class="custom-control-label" for="bofavoritos"> Favoritos <small>Se eliminar&aacute; la lista de favoritos que haya agregado.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bovotosposts" id="bovotosposts">
               <label class="custom-control-label" for="bovotosposts"> Votos en Posts <small>Se eliminar&aacute;n los votos de puntos que haya dejado en posts.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bovotosfotos" id="bovotosfotos">
               <label class="custom-control-label" for="bovotosfotos"> Votos en Fotos <small>Se eliminar&aacute;n los votos positivos y negativos que haya dejado en fotos.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="boactividad" id="boactividad">
               <label class="custom-control-label" for="boactividad"> Actividad <small>Se eliminar&aacute; toda su actividad.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="boavisos" id="boavisos">
               <label class="custom-control-label" for="boavisos"> Avisos <small>Se eliminar&aacute;n todos los avisos que ha recibido.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bobloqueos" id="bobloqueos">
               <label class="custom-control-label" for="bobloqueos"> Bloqueos <small>Se eliminar&aacute;n todos los bloqueos que ha recibido.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bomensajes" id="bomensajes">
               <label class="custom-control-label" for="bomensajes"> Mensajes Privados <small>Se eliminar&aacute;n todos los mensajes que ha enviado y recibido.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bosesiones" id="bosesiones">
               <label class="custom-control-label" for="bosesiones"> Sesiones <small>Se eliminar&aacute;n todas las sesiones.</small></label>
            </div>
            <hr>
            <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" name="bovisitas" id="bovisitas">
               <label class="custom-control-label" for="bovisitas"> Visitas <small>Se eliminar&aacute;n todo rastro de visitas de este usuario en perfiles, posts y fotos.</small></label>
            </div>
         </div>
            <hr>
         Introduzca su contrase&ntilde;a para continuar: <input placeholder="Ingresa tu contraseña" type="password" class="form-control" name="password"/>
      {elseif $tsType == 7}
      <dl>
         <dt><label>Rango actual:</label></dt>
         <dd><input type="text" value="{$tsUserR.user.r_name}" class="form-control" disabled></dd>
      </dl>
      <dl>
         <dt><label for="user">Nuevo rango:</label></dt>
         <dd><select name="new_rango" class="form-control">
            {foreach from=$tsUserR.rangos item=r}
               <option value="{$r.rango_id}" style="color:#{$r.r_color}" {if $r.rango_id == $tsUserR.user.rango_id}selected="selected"{/if}>{$r.r_name}</option>
            {/foreach}
            </select>
         </dd>
      </dl>
{elseif $tsType == 8}
<textarea name="firma" rows="3" cols="50" class="form-control" placeholder="{if $tsUserF.user_firma == ''}Este usuario aún no ha puesto su firma{/if}">{$tsUserF.user_firma}</textarea><br>
{else}
<div class="phpostAlfa">Pendiente</div>
{/if}
         <br>
<p><input type="submit" name="save" value="Enviar Cambios" class="btn btn-success btn-sm"/></p>
</fieldset>
</form>
{/if}
</div>