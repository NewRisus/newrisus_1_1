<script type="text/javascript" src="{$tsConfig.url}/dashboard/js/color.min.js"></script>
<div id="res" class="boxy-content">
   
   {if $tsSave}<div class="alert alert-success" role="alert">Tus cambios han sido guardados.</div>{/if}
   {if $tsAct == ''}
   <div class="table-responsive">
      <table class="table table-data2">
         <thead>
            <th>ID</th>
            <th style="width: 25px;">Icono</th>
            <th>Nombre</th>
            <th>Descripci&oacute;n</th>
            <th>Acciones</th>
         </thead>
         <tbody>
            {foreach from=$tsConfig.categorias item=c}
            <tr>
               <td>{$c.c_orden}</td>
               <td style="width: 25px;"><i class="fa fa-{$c.c_fa}" style="font-size:18px; color: #{$c.c_color};"></i></td>
               <td><span style="color: #{$c.c_color};">{$c.c_nombre}</span></td>
               <td>{$c.c_desc}</td>
               <td class="admin_actions">
                  <a href="?act=editar&cid={$c.cid}&t=cat" title="Editar Categor&iacute;a"><i class="fas fa-edit"></i></a>
                  <a href="?act=borrar&cid={$c.cid}&t=cat" title="Borrar Categor&iacute;a"><i class="fas fa-times"></i></a>
               </td>
            </tr>
            {/foreach}
         </tbody>
      </table>
   </div>
   <br>
   <input type="button" onclick="location.href = '{$tsConfig.url}/admin/cats?act=nueva&t=cat'" value="Agregar nueva subcategoría" class="btn btn-success"/>
   <input type="button" style="cursor:pointer;" onclick="location.href = '/admin/cats?act=change'" value="Mover Posts" class="btn btn-warinig">
   {elseif $tsAct == 'editar'}
   <form action="" method="post" autocomplete="off">
      <fieldset>
         <dl>
            <dt><label for="cat_name">Nombre de la subcategoría:</label></dt>
            <dd><input type="text" class="form-control" id="cat_name" class="form-control" name="c_nombre" value="{$tsCat.c_nombre}">
            </dd>
         </dl>
         <dl>
            <dt><label for="cat_desc">Descripción:</label></dt>
            <dd><textarea id="cat_desc" class="form-control" name="c_desc" class="form-control">{$tsCat.c_desc}</textarea></dd>
         </dl>
         <dl>
            <dt><label for="hcat">Categoría padre:</label></dt>
            <dd>
            <select name="hcat" class="form-control" id="hcat" class="form-control">
               {foreach from=$tshCats item=h}
               <option value="{$h.id}" {if $tsCat.c_hcat == $h.id}selected="selected"{/if}>{$h.name}</option>
               {/foreach}
            </select>
            </dd>
         </dl>
         <dl>
            <dt><label for="cat_fa">Icono:</label><span>Ingresa el código del icono, considerando que en el siguiente formulario <b>ya se encuentra fa fa-</b>.</span></dt>
            <dd>
            <input type="text" class="form-control" id="cat_fa" name="c_fa" value="{$tsCat.c_fa}" aria-label="{$tsCat.c_fa}" aria-describedby="basic-addon1"></dd>
         </dl>
         <dl>
            <dt><label for="cat_color">Color:</label>
            <span>Ingresa el color en formato hexadecimal, solo los número y letras, no considerar el #. Ejemplo: #FAFAFA</span></dt>
            <dd><input type="text" id="cat_color" class="jscolor form-control" name="c_color" value="{$tsCat.c_color}" /></dd>
         </dl>
         <script>
         $(document).ready(function(){
            $('input[name=c_nombre]').on("keyup", function(e){
               $('#cate').html(e.target.value);
            });
            $('textarea[name=c_desc]').on("keyup", function(e){
               $('#desc').html(e.target.value);
            });
            $('input[name=c_fa]').on("change", function(e){
               $('#icon').removeClass('fa-{$tsCat.c_fa}').toggleClass('fa-'+e.target.value);
            });
            $('input[name=c_color]').on("change", function(e){
               $('.icono-categoria').css("background", "#"+e.target.value);
            });
         });
         </script>
         <div>
            <div class="row categoria-foro" style="background:#eee; margin-bottom: 1em;">
               <small class="text-muted">Vista previa</small>
               <div class="col-sm-12 categoria-foro-uno">
                  <span class="icono-categoria" style="background: #{$tsCat.c_color};">
                     <i id="icon" class="fa fa-{$tsCat.c_fa}"></i>
                  </span>
                  <span class="titulo-categoria">
                     <a rel="dofollow" href="#" id="cate">{$tsCat.c_nombre}</a>
                     <p  class="text-muted" id="desc">{$tsCat.c_desc}</p>
                  </span>
               </div>
            </div>
         </div>
         
         <p><input type="submit" name="save" value="Guardar cambios" class="btn btn-primary"/  ></p>
      </fieldset>
   </form>
   {elseif $tsAct == 'nueva'}
   <form action="" method="post" autocomplete="off">
      <fieldset>
         <dl>
            <dt><label for="cat_name">Nombre de la subcategoría:</label></dt>
            <dd><input type="text" id="cat_name" class="form-control" name="c_nombre" value="{$tsCat.c_nombre}">
            </dd>
         </dl>
         <dl>
            <dt><label for="cat_desc">Descripción:</label></dt>
            <dd><textarea id="cat_desc" name="c_desc" class="form-control">{$tsCat.c_desc}</textarea></dd>
         </dl>
         <dl>
            <dt><label for="hcat">Categoría padre:</label></dt>
            <dd>
            <select name="hcat" id="hcat" class="form-control">
               {foreach from=$tshCats item=h}
               <option value="{$h.id}" {if $tsCat.c_hcat == $h.id}selected="selected"{/if}>{$h.name}</option>
               {/foreach}
            </select>
            </dd>
         </dl>
         <dl>
            <dt><label for="cat_fa">Icono:</label></dt>
            <p>Ingresa el código del icono, considerando que en el siguiente formulario <b>ya se encuentra fa fa-</b>.</p>
            <dd>
            <input type="text" class="form-control" id="cat_fa" name="c_fa" value="{$tsCat.c_fa}" aria-label="{$tsCat.c_fa}" aria-describedby="basic-addon1"></dd>
         </dl>
         <dl>
            <dt><label for="cat_color">Color:</label></dt>
            <p>Ingresa el color en formato hexadecimal, solo los número y letras, no considerar el #. Ejemplo: #FAFAFA</p>
            <dd><input type="text" id="cat_color" class="jscolor form-control" name="c_color" value="{$tsCat.c_color}" /></dd>
         </dl>
         <p><input type="submit" name="save" value="Crear Categor&iacute;a" class="btn btn-success"/></p>
      </fieldset>
   </form>
   {elseif $tsAct == 'borrar'}
   {if $tsError}<div class="alert alert-danger" role="alert">{$tsError}</div>{/if}
   {if $tsType == 'cat'}
   <form action="" method="post" id="admin_form">
      <label>Borrar categor&iacute;a y mover las subcategor&iacute;as y demas datos a otra categor&iacute;a diferente. Mover datos a:</label>
      <select name="ncid" class="form-control">
         <option value="-1">Categor&iacute;as</option>
         {foreach from=$tsConfig.categorias item=c}
         {if $c.cid != $tsCID}
         <option value="{$c.cid}">{$c.c_nombre}</option>
         {/if}
         {/foreach}
      </select>
      <br>
      <input type="submit" name="save" value="Guardar cambios" class="btn btn-success">
   </form>
   {/if}
   {elseif $tsAct == 'change'}
   {if $tsError}<div class="alert alert-danger" role="alert">{$tsError}</div>{/if}
   <form action="" method="post" id="admin_form">
      <label>Mover todos los posts de la categor&iacute;a </label>
      <select name="oldcid" class="form-control">
         <option value="-1">Categor&iacute;as</option>
         {foreach from=$tsConfig.categorias item=c}
         {if $c.cid != $tsCID}
         <option value="{$c.cid}">{$c.c_nombre}</option>
         {/if}
         {/foreach}
      </select>
      <label> a </label>
      <select name="newcid" class="form-control">
         <option value="-1">Categor&iacute;as</option>
         {foreach from=$tsConfig.categorias item=c}
         {if $c.cid != $tsCID}
         <option value="{$c.cid}">{$c.c_nombre}</option>
         {/if}
         {/foreach}
      </select>
      <br>
      <input type="submit" name="save" value="Guardar cambios" class="btn btn-success">
   </form>
   {/if}
</div>