{include file='sections/main_header.tpl'}
        {literal}
        <script type="text/javascript">
        var buscador = {
            // {/literal}
        	tipo: '{if !$tsEngine}web{$tsEngine}{/if}',
            // {literal}
        	select: function(tipo){
        		if(this.tipo==tipo)
        			return;
        
        		//Cambio de action form
        		//$('form[name="buscador"]').attr('action', '?e='+tipo+'');
                $('input[name="e"]').val(tipo);
        
        		//Solo hago los cambios visuales si no envia consulta
        		if(!this.buscadorLite){
        			//Cambio here en <a />
        			$('a#select_' + this.tipo).removeClass('here');
        			$('a#select_' + tipo).addClass('here');
        
        			//Cambio de logo
        			$('img#buscador-logo-'+this.tipo).css('display', 'none');
        			$('img#buscador-logo-'+tipo).css('display', 'inline');
        
        		}
        
        		//Muestro/oculto los input google
        		if(tipo=='google'){ 
                    //Ahora es google {/literal}
        			$('form[name="buscador"]').append('<input type="hidden" name="cx" value="{$tsConfig.ads_search}" /><input type="hidden" name="cof" value="FORID:10" /><input type="hidden" name="ie" value="ISO-8859-1" />');
                    // {literal}
        		}else if(this.tipo=='google'){ //El anterior fue google
        			$('input[name="cx"]').remove();
        			$('input[name="cof"]').remove();
        			$('input[name="ie"]').remove();
        		}
        
        		this.tipo = tipo;
        	}
        }
        </script>
        {/literal}

        {if $tsQuery || $tsAutor}
<div class="row">
        <div id="buscadorLite" class="col-sm-3">
        	<div>
        		<form action="" method="GET" name="buscador">
        			<div class="searchFil">
                        <div class="boxBox" style="padding: 0.5em;background: #eee;border-radius: 5px; text-align:center;">
                            <h6><b>Buscador</b></h6>
                            <div class="form-group">
                                <input type="text" value="{$tsQuery}" class="form-control" name="q"/>
        					</div>
                            <div class="form-group">
                                <label for="cat">Categoría/Foro</label>
                                <select class="form-control" id="cat" name="cat">
                                    <option value="-1">Todas las categorías</option>
                                    {foreach from=$tsConfig.categorias item=c}
                                    <option value="{$c.cid}"{if $tsCategory == $c.cid} selected="true"{/if}>{$c.c_nombre}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group" id="filtro_autor">
                                <label>Usuario</label>
                                <input type="text" name="autor" class="form-control" value="{$tsAutor}"/>
                            </div>
                            <input type="submit" title="Buscar" value="Buscar" class="btn btn-success btn-sm" style="margin-bottom: 0.5em;">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="resultados" class="col-sm-9">
            <div id="showResult">
                <div class="linksList">
                    <div>
        				<span style="text-align: left;">Mostrando <b>{$tsResults.total}</b> de <b>{$tsResults.pages.total}</b> resultados totales</span>
        			</div>
                    <tbody>
                    {foreach from=$tsResults.data item=r}
                    <div id="div_{$r.post_id}" class="media ultimos-temas-inicio">
                        <a href="{$tsConfig.url}/perfil/{$r.user_name}"><img src="{$tsConfig.url}/files/avatar/{$r.post_user}_50.jpg" class="mr-3"></a>
                            <div class="media-body">
                                <div>
                                    <div class="float-left">
                                        <h6 class="mt-0"><a href="{$tsConfig.url}/posts/{$r.c_seo}/{$r.post_id}/{$r.post_title|seo}.html">{$r.post_title}</a></h6>
                                    </div>
                                    <div class="float-right">
                                        <a href="{$tsConfig.url}/posts/{$r.c_seo}/"><span class="badge badge-primary badge-categoria-inicio" style="background: #{$r.c_color}; color: #fff !important;"><i class="fas fa-{$r.c_fa}"></i> {$r.c_nombre}</span></a>
                                        <span style="float: right;padding-left: 0.5rem;"><h6 class="mt-0"><i class="far fa-comments"></i> {$r.post_comments}</h6></span>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div>
                                    <div class="float-left" style="margin-top: -3px">
                                        <a>Publicado por </a><a href="{$tsConfig.url}/perfil/{$r.user_name}">{$r.user_name}</a> <a><span style="text-transform:lowercase;">{$r.post_date|hace}</span></a>
                                    </div>
                                </div>                
                            </div>
                    </div>
                    {/foreach}
                    </tbody>
                </div>
            </div>
            <div class="paginadorCom">
                {if $tsResults.pages.prev != 0}<div style="display: block; margin: 5px 0pt; width: 110px;text-align:left" class="floatL before"><a href="{$tsConfig.url}/buscador/?page={$tsResults.pages.prev}{if $tsQuery}&q={$tsQuery}{/if}{if $tsEngine}&e={$tsEngine}{/if}{if $tsCategory}&cat={$tsCategory}{/if}{if $tsAutor}&autor={$tsAutor}{/if}">&laquo; Anterior</a></div>{/if}
          		{if $tsResults.pages.next != 0}<div style="display: block; margin: 5px 0pt; width: 110px;text-align:right" class="floatR next"><a href="{$tsConfig.url}/buscador/?page={$tsResults.pages.next}{if $tsQuery}&q={$tsQuery}{/if}{if $tsEngine}&e={$tsEngine}{/if}{if $tsCategory}&cat={$tsCategory}{/if}{if $tsAutor}&autor={$tsAutor}{/if}">Siguiente &raquo;</a></div>{/if}
            </div>
        </div>
        <div class="container170 floatR">
            <center>{$tsConfig.ads_160}</center>
        </div>
</div>
        {/if}
        <div style="clear:both;"></div>                
{include file='sections/main_footer.tpl'}