<section class="au-breadcrumb m-t-75">
   <div class="section__content section__content--p30">
      <div class="container-fluid">
         <div class="row">
            <div class="col-md-12">
               <div class="au-breadcrumb-content">
                  <h3>
                  {if $tsPage == 'admin'}
                     {if $tsAction == ''}
                        Centro de administración de {$tsConfig.titulo}

                     {elseif $tsAction == 'creditos'}
                        Soporte y créditos

                     {elseif $tsAction == 'configs'}
                        Configuración de {$tsConfig.titulo}
                        <p>Desde aquí puedes manejar los ajustes principales de tu sitio.</p>

                     {elseif $tsAction == 'temas'}
                        Personalizar diseño de {$tsConfig.titulo}
                        <input type="button" onclick="location.href = '{$tsConfig.url}/admin/temas?act=nuevo'" value="Instalar nuevo tema" class="btn btn-sm btn-primary">

                     {elseif $tsAction == 'news'}
                        Noticias

                     {elseif $tsAction == 'ads'}
                        Administrar Publicidad

                     {elseif $tsAction == 'medals'}
                        {if $tsAct == 'nueva'}Nueva {elseif $tsAct == 'editar'}Editar {/if}Medallas

                     {elseif $tsAction == 'stats'}
                        Administrar Estad&iacute;sticas

                     {elseif $tsAction == 'posts'}
                        Administrar Posts

                     {elseif $tsAction == 'fotos'}
                        Administrar Fotos

                     {elseif $tsAction == 'afs'}
                        {if $tsAct == 'editar'}Editar{else}Administrar{/if} Afiliados

                     {elseif $tsAction == 'cats'}
                        Subcategorías de {$tsConfig.titulo}
                        <p>Desde aquí puedes editar las subcategorías del sitio.</p>

                     {elseif $tsAction == 'users'}
                        Administrador de usuarios
                        <p>Desde aquí puedes administrar los miembros de {$tsConfig.titulo}.</p>

                     {elseif $tsAction == 'sesiones'}
                        Administrar Sesiones

                     {elseif $tsAction == 'nicks'}
                        Administrar Cambios de Nicks

                     {elseif $tsAction == 'blacklist'}
                        {if $tsAct == 'editar'}Editar bloqueo{elseif $tsAct == 'nuevo'}Agregar bloqueo{else}Administrar Lista Negra{/if}

                     {elseif $tsAction == 'badwords'}
                        {if $tsAct == 'editar'}Editar filtro de{elseif $tsAct == 'nuevo'}Agregar filtro de{else}Censurar{/if} palabras

                     {elseif $tsAction == 'rangos'}
                        {if $tsAct == 'nuevo'}Nuevo Rango{elseif $tsAct == 'editar'}Editar rango{else}Administrar Rangos de Usuarios{/if}

                     {elseif $tsAction == 'hcats'}
                        {if $tsAct == 'nueva'}Nueva{elseif $tsAct == 'editar'}Editar{else}Administrar{/if} categorías padre
                     {/if}
                  {else}
                  {/if}
               </h3>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>