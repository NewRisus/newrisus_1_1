                	<div class="post-autor vcard">

                        <div class="box_cuerpo">

                            
                            <img src="{$tsConfig.images}/space.gif" class="status {$tsAutor.status.css}" title="{$tsAutor.status.t}"/>
                            <img src="{$tsConfig.images}/icons/ran/{$tsAutor.rango.r_image}" title="{$tsAutor.rango.r_name}" />
                            <img src="{$tsConfig.images}/icons/{if $tsAutor.user_sexo == 0}female{else}male{/if}.png" title="{if $tsAutor.user_sexo == 0}Mujer{else}Hombre{/if}" />
                            <img src="{$tsConfig.images}/flags/{$tsAutor.pais.icon}.png" style="padding:2px" title="{$tsAutor.pais.name}" />
                            
                            
                            <hr class="divider"/>
                            <div class="metadata-usuario">
                            	<span class="nData user_follow_count">{$tsAutor.user_seguidores}</span>
                                <span class="txtData">Seguidores</span>
                                <span class="nData" style="color: #0196ff">{$tsAutor.user_puntos}</span>
                                <span class="txtData">Puntos</span>
                                <span class="nData">{$tsAutor.user_posts}</span>
                                <span class="txtData">Posts</span>
                                <span style="color: #456c00" class="nData">{$tsAutor.user_comentarios}</span>
                                <span class="txtData">Comentarios</span>
                            </div>
                            {if $tsUser->is_admod || $tsUser->permisos.modu || $tsUser->permisos.mosu}
                            <hr class="divider"/>
                            <div class="mod-actions">
                                <b>Herramientas</b>
                                <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$tsPost.post_ip}" class="geoip" target="_blank">{$tsPost.post_ip}</a>
                                {if $tsUser->is_admod == 1}<a href="{$tsConfig.url}/admin/users?act=show&amp;uid={$tsAutor.user_id}" class="edituser">Editar Usuario</a>{/if}
                                {if $tsAutor.user_id != $tsUser->uid} <a href="#" onclick="mod.users.action({$tsAutor.user_id}, 'aviso', false); return false;" class="alert">Enviar Aviso</a>{/if}
                                {if $tsAutor.user_id != $tsUser->uid && $tsUser->is_admod || $tsUser->permisos.modu || $tsUser->permisos.mosu}
								{if $tsAutor.user_baneado}
                                {if $tsUser->is_admod || $tsUser->permisos.modu}<a href="#" onclick="mod.reboot({$tsAutor.user_id}, 'users', 'unban', false); $(this).remove(); return false;" class="unban">Desuspender Usuario</a>{/if}
                                {else}
                                {if $tsUser->is_admod || $tsUser->permisos.mosu}<a href="#" onclick="mod.users.action({$tsAutor.user_id}, 'ban', false); $(this).remove(); return false;" class="ban">Suspender Usuario</a>{/if}
                                {/if}
								{/if}
                            </div>
                            {/if}
                        </div>
						
						<br />
						<div class="categoriaList estadisticasList" {if $tsPost.m_total == 0} style="display:none;"{/if}>
                        <h6>Medallas</h6>
                         {if $tsPost.medallas}
						<ul style="margin-left:11px;">
							{foreach from=$tsPost.medallas item=m}
        			<img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_16.png" style="margin-left:1px;margin-bottom:2px;" class="qtip" title="{$m.m_title} - {$m.m_description}"/>
                            {/foreach}
                        </ul>
						{else}
						 <div class="emptyData">No tiene medallas</div>
                          {/if}
                    </div>

						{if $tsPost.visitas}
						<br />
						<div class="categoriaList estadisticasList">
                        <h6>&Uacute;ltimos visitantes</h6> 
						<ul style="margin-left:11px;">
							{foreach from=$tsPost.visitas item=v}
        			         <a href="{$tsConfig.url}/perfil/{$v.user_name}" class="hovercard" uid="{$v.user_id}" style="display:inline-block;"><img src="{$tsConfig.url}/files/avatar/{$v.user_id}_50.jpg" class="vctip" title="{$v.date|hace:true}" width="32" height="32"/></a> 
                            {/foreach}
                        </ul>
						</div>
                          {/if}

                    </div>