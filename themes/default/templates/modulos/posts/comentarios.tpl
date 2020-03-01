<div id="post-comentarios" class="comentario-full-page">
    <div class="row" style="padding: 1em 0em 0.5em 0em;margin-bottom: 0.5em; margin-top: 0.5em;">
        <div class="col-sm-6">
            <h5 id="ncomments">{$tsPost.post_comments} respuesta{if $tsPost.post_comments > 1}s{/if}</h5> 
        </div>
        <div class="col-sm-6">
            <div class="float-right">
                {if $tsPost.post_comments > $tsConfig.c_max_com}
                <div class="comentarios-title" style="float: left;">
                    <div class="paginadorCom"><!--HTML de las páginas--></div>
                </div>
                {/if}
                <div class="dropdown" style="float: right; display: inline-block; margin-left:0.5em;">
                    <a class="btn btn-light btn-sm" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <b style="font-size: 0.8em;">ORDENAR COMENTARIOS</b>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="#"><i class="fas fa-arrow-up"></i> M&aacute;s reciente al m&aacute;s antiguo</a>
                        <a class="dropdown-item disabled" href="#"><i class="fas fa-arrow-down"></i> M&aacute;s antiguo al m&aacute;s reciente</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="comentarios">
        <script type="text/javascript">
        // {literal}
        $(document).ready(function(){
        /*
        top_cmt = $("#offset_cmts").offset().top;
        //
        function check_load(){
        if (!comentario.cargado && $(window).scrollTop() + $(window).height() > top_cmt ) {
        // {/literal}
        */
        comentario.cargar({$tsPages.post_id}, 1, {$tsPages.autor});
        /*
        // {literal}
        comentario.cargado = true;
        }
        }
        $(window).scroll(check_load);
        check_load();*/
        });
        // {/literal}
        </script>
        <div id="no-comments">Cargando comentarios espera un momento...</div>
    </div>
    <div class="row" style="padding: 1em 0em 0.5em 0em;margin-bottom: 0.5em;">
        <div class="col-sm-6"></div>
        <div class="col-sm-6">
            <div class="float-right">
                {if $tsPost.post_comments > $tsConfig.c_max_com}
                <div class="comentarios-title" style="float: left;">
                    <div class="paginadorCom"><!--HTML de las páginas--></div>
                </div>
                {/if}
                <div class="dropdown" style="float: right; display: inline-block; margin-left:0.5em;">
                    <a class="btn btn-light btn-sm" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <b style="font-size: 0.8em;">ORDENAR COMENTARIOS</b>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="#"><i class="fas fa-arrow-up"></i> M&aacute;s reciente al m&aacute;s antiguo</a>
                        <a class="dropdown-item disabled" href="#"><i class="fas fa-arrow-down"></i> M&aacute;s antiguo al m&aacute;s reciente</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    {if $tsPost.post_block_comments == 1 && ($tsUser->is_admod == 0 && $tsUser->permisos.mocepc == false)}
    <div class="alert alert-danger" role="alert">El post se encuentra cerrado y no se permiten comentarios.</div>
    {elseif $tsUser->is_member && $tsUser->is_admod == 0 && $tsUser->permisos.gopcp == false}
    <div class="alert alert-danger" role="alert">No tienes permisos para comentar.</div>
    {elseif $tsUser->is_member && ($tsPost.post_block_comments != 1 || $tsPost.post_user == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.gopcp) && $tsPost.block == 0}
    <div class="miComentario">
        {include file='modulos/posts/comentar.tpl'}
    </div>
    {/if}
</div>
<div class="clearfix"></div>