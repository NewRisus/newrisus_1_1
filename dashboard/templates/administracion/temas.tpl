<div id="res" class="boxy-content">
   {if $tsSave}
   <div class="alert alert-success" role="alert">
      Tus cambios han sido guardados.
   </div>
   {/if}
   {if $tsAct == ''}
   <div class="row">
      {foreach from=$tsTemas item=tema}
      <div class="col-md-4">
         <div class="card">
            <div class="card-body">
               <div class="mx-auto d-block">
                  <img style="object-fit:cover;" class="rounded mx-auto d-block" src="{$tema.t_url}/screenshot.png" alt="Previa del tema">
                  <h5 class="text-sm-center mt-2 mb-1">{if $tsConfig.tema_id == $tema.tid}<i class="fas fa-check" title="En uso"></i> {/if}{$tema.t_name}</h5>
               </div>
               <hr>
               <div class="card-text text-sm-center">
                  <div class="btn-group btn-group-sm">
                     <a class="btn btn-info" href="?act=editar&tid={$tema.tid}">Editar</a>
                     {if $tsConfig.tema_id == $tema.tid}
                     {else}
                        <a class="btn btn-success" href="?act=usar&tid={$tema.tid}&tt={$tema.t_name}">Activar</a>
                        {if $tema.tid != 1}
                           <a class="btn btn-danger" href="?act=borrar&tid={$tema.tid}&tt={$tema.t_name}">Eliminar</a>
                        {/if}
                     {/if}
                  </div>
               </div>
            </div>
         </div>
      </div>
      {/foreach}
   </div>
   {elseif $tsAct == 'editar'}
   <div class="card mb-3">
      <div class="row no-gutters">
         <div class="col-md-2 mt-4">
            <img src="{$tsTema.t_url}/screenshot.png" class="rounded mx-auto d-block" alt="Previa del tema">
         </div>
         <div class="col-md-10">
            <div class="card-body">
               <h5 class="card-title">{$tsTema.t_name}</h5>
               <form action="" method="post" id="admin_form" autocomplete="off">
                  <div class="form-group">
                     <label for="ai_url">Url completa de la plantilla:</label>
                     <input type="text" id="ai_url" name="url" class="form-control" value="{$tsTema.t_url}" size="30" />
                  </div><div class="form-group">
                     <label for="ai_path">Nombre de la carpeta donde esta el tema:</label>
                     <input type="text" id="ai_path" name="path" class="form-control" value="{$tsTema.t_path}" size="30" />
                  </div>
                  <input type="submit" value="Guardar tema" name="save" class="btn btn-sm btn-success" style="margin-top:1em;">
               </form>
            </div>
         </div>
      </div>
   </div>
   {elseif $tsAct == 'usar' || $tsAct == 'borrar'}
   <form action="" method="post" id="admin_form" autocomplete="off">
      <h3 align="center">{$tt}</h3>
      <label>&nbsp;</label> 
      <input type="submit" name="confirm" value="{if $tsAct == 'usar'}Confirmar el cambio de{else}Continuar borrando este{/if} tema &raquo;" class="btn btn-{if $tsAct == 'usar'}success{else}danger{/if}">
      {if $tsAct == 'borrar'}<p align="center">Te recordamos que debes borrar la carpeta del Tema manualmente en el servidor.</p>{/if}
   </form>
   {elseif $tsAct == 'nuevo'}
   {if $tsError}<div class="alert alert-danger">{$tsError}</div>{/if}
   <form action="" method="post" id="admin_form" class="form-group" autocomplete="off">
      <label for="ai_path">Nombre de la carpeta donde esta el tema a instalar:</label>
      <div class="input-group">
         <div class="input-group-addon">{$tsConfig.url}/themes/</div>
         <input type="text" id="ai_path" name="path" placeholder="name_theme" class="form-control">
      </div>
      <hr />
      <label>&nbsp;</label> <input type="submit" value="Instalar tema" class="btn btn-success">
   </form>
   {/if}
</div>
<style>
.form-group .input-group .form-control {
   border-radius: 0 5px 5px 0;
   border-left: 0;
}
.form-group .input-group .input-group-addon {
   border-radius: 5px 0 0 5px;
   border-right: 0;
}
</style>