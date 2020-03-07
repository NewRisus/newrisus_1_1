<div class="frameForm">
    <ul class="options clearfix">
        <li><span class="share">Compartir:</span></li>
        <li>
            <ul class="atta">
                <li>
                    <span class="uiComposer">
                    <a href="#" class="a_blue hidden" onclick="muro.stream.load('status', this); return false;" id="stMain"><i class="fas fa-comment"></i></a>
                    </span>
                </li>
                <li>
                    <span class="uiComposer">
                    <a href="#" class="a_blue" onclick="muro.stream.load('foto', this); return false;"><i class="fas fa-image"></i></a>
                    </span>
                </li>
                <li>
                    <span class="uiComposer">
                    <a href="#" class="a_blue" onclick="muro.stream.load('enlace', this); return false;"><i class="fas fa-link"></i></a>
                    </span>
                </li>
                <li>
                    <span class="uiComposer">
                    <a href="#" class="a_blue" onclick="muro.stream.load('video', this); return false;"><i class="fas fa-video"></i></a>
                    </span>
                </li>
                <li class="streamLoader"><img width="16" height="11" alt="" src="{$tsConfig.images}/loading_white.gif" class="img"/></li>
            </ul>
        </li>
    </ul>
    
    <div class="attaFrame">
        <div id="attaContent">
            <div id="statusFrame" class="form-group" style="display:block">
                <textarea class="form-control" id="wall" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="{if $tsInfo.uid == $tsUser->uid}&iquest;Qu&eacute; est&aacute;s pensando?{else}Escribe algo....{/if}" style="min-height:38px !important;"></textarea>
            </div>
            <div id="fotoFrame" class="form-group" style="min-height: 4em;">
                <span class="row">
                    <input type="text" class="itext form-control col-sm-10 float-left" name="ifoto" value="http://www.phpost.net/images/ejemplo.jpg" title="http://www.phpost.net/images/ejemplo.jpg" onfocus="onfocus_input(this)" onblur="onblur_input(this)" style="min-height:38px !important;">
                    <span class="col-sm float-right">
                        <a href="#" class="btn btn-light" onclick="muro.stream.adjuntar(); return false;">Adjuntar</a>
                    </span>
                </span>
            </div>
            <div id="enlaceFrame" class="form-group" style="min-height: 4em;">
                <input type="text" class="itext form-control" name="ienlace" value="http://www.phpost.net/blog/ejemplo.html" title="http://www.phpost.net/blog/ejemplo.html" onfocus="onfocus_input(this)" onblur="onblur_input(this)" style="min-height:38px !important;">
                <a href="#" class="btn btn-light" onclick="muro.stream.adjuntar(); return false;">Adjuntar</a>
            </div>
            <div id="videoFrame" class="form-group" style="min-height: 4em;">
                <input type="text" class="itext form-control" name="ivideo" value="http://www.youtube.com/watch?v=f_30BAGNqqA" title="http://www.youtube.com/watch?v=f_30BAGNqqA" onfocus="onfocus_input(this)" onblur="onblur_input(this)" style="min-height:38px !important;">
                <a href="#" class="btn btn-light" onclick="muro.stream.adjuntar(); return false;">Adjuntar</a>
            </div>
        </div>
        <div class="attaDesc row">
            <div class="wrap">
                <div class="form-group col-sm-12">
                    <textarea class="form-control" id="attaDesc" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="{if $tsInfo.uid == $tsUser->uid}&iquest;Qu&eacute; est&aacute;s pensando?{else}Escribe algo....{/if}" style="min-height:38px !important;"></textarea>
                </div>
            </div>
            <input type="button" class="btn btn-info shareBtn" value="Compartir" onclick="muro.stream.compartir();" />
        </div>
    </div>
    <div class="btnStatus">
        <input type="button" class="btn btn-success" value="Compartir" onclick="muro.stream.compartir();" /><br>
    </div>
</div>