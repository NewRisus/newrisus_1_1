<div class="container-fluid box-search" style="background: linear-gradient(to bottom left,rgba(13,71,161 ,1),rgba(79,195,247 ,1));">
    <div class="area">
        <ul class="circles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <!-- BOX NORMAL 
            <div class="box-homi nr-uno" style="height: 300px;background-image: url('https://i.pinimg.com/originals/ae/b1/35/aeb135578200d078b6076b9cc3d1445f.gif');background-size: 65%;background-position: 100% 100%;background-repeat: no-repeat;">
            -->
            <!-- BOX NAVIDAD -->
            <div class="box-homi nr-uno" style="height: 300px;background-image: url('https://i.pinimg.com/originals/04/d9/3d/04d93d7295aa44cd227ac3fe1081909d.gif');background-size: 65%;background-position: 145% 100%;background-repeat: no-repeat; padding-left:20px;">
                <h1 style="font-size: 3rem;line-height: 45px;width: 400px;"><b>¡Lo mejor en diseños y complementos!</b></h1>
                <h6 style="width: 75%;">Con nosotros encontrarás temas, complementos <br>y soporte para tu sitio web creado con PHPost o NewRisus.</h6>
                <div class="float-left">
                    {if $tsUser->is_member}
                    <button class="btn btn-sm btn-primary" href="{$tsConfig.url}/agregar/">Crea un tema</button>.
                    {else}
                    <button class="btn btn-sm btn-primary" href="{$tsConfig.url}/registro/">Únete</button> o <a href="{$tsConfig.url}/login/"><b>inicia sesión</b></a>.
                    {/if}
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="box-homi row align-items-center nr-dos" style="height: 300px;">
                <div>
                <h3><i class="fas fa-quote-right"></i></h3>
                <h1><b>{$tsStats.stats_posts}</b></h1>
                <h6>ARTÍCULOS PUBLICADOS</h6>
                <p>Incluyendo diseños, complementos, artículos de soporte, off-topics, etc.</p>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="row">
                <div class="col-sm-12">
                    <div class="box-homi nr-tres" style="height: 145px;">
                        <div>
                        <h5><i class="fas fa-comments"></i></h5>
                        <h1><b>{$tsStats.stats_comments}</b></h1>
                        <h6>RESPUESTAS A TEMAS</h6>
                        <p style="margin-top: -10px;margin-bottom: 0px !important;">realizadas por más de {$tsStats.stats_miembros} miembros.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 nr-members">
                    <div class="box-homi nr-cuatro" style="height: 145px;">
                        <div class="nr-members">
                            <div class="nr-last-user">
                                {foreach from=$tsLastUser item=m}
                                <img src="{$tsConfig.url}/files/avatar/{$m.user_id}_120.jpg">
                                <span>
                                    <span style="padding: 7px;">ÚLTIMO MIEMBRO</span><br>
                                    <a class="nr-name-last-user" data-toggle="bottom" title="{$m.user_lastactive|hace}" href="{$tsConfig.url}/perfil/{$m.user_name}"><b>{$m.user_name}</b></a>
                                </span>
                                {/foreach}
                            </div>
                        <a href="{$tsConfig.url}/usuarios/">
                        <h5><i class="fas fa-users"></i></h5>
                        <h1><b>{$tsStats.stats_miembros}</b></h1>
                        <h6>MIEMBROS</h6>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{literal}
<style>
.box-homi {
    text-align: center;
    background: white;
    color: #FFF;
    border-radius: 5px;
    margin-bottom: 10px;
    box-shadow: 0px 0px 3px rgba(0,0,0,0.1);
    padding: 1em;
    align-items: center !important;
    display: grid;
    cursor: pointer;
    -webkit-transition: background 1s, color 1s ease;
    -moz-transition: background 1s, color 1s ease;
    -o-transition: background 1s, color 1s ease;
    transition: background 1s, color 1s ease;
}
.box-homi:hover, .box-homi:active {
    background: white;
    color: #454545 !important;
    -webkit-transition: background 1s, color 1s ease;
    -moz-transition: background 1s, color 1s ease;
    -o-transition: background 1s, color 1s ease;
    transition: background 1s, color 1s ease;
}
.nr-members {
    
}
.nr-last-user {
    display: none;
    position: absolute;
    top: 11px;
}
.nr-last-user img {
    width: 35px;
    border-radius: 5px;
    box-shadow: 0px 0px 3px rgba(0,0,0,0.3);
    border: 1px solid #eee;
}
.nr-members:hover > .nr-last-user {
    display: flex;
}
.nr-name-last-user {
    float: left;
    padding: 6px 8px 0px;
    font-size: 1.7em;
    color: #689F38 !important;
}
.nr-uno {background: #FFF; text-align: left; color: #454545 !important;}
.nr-uno:hover, nr-uno:active {color: #454545 !important;}
    
.nr-dos {background-color: #f44336;
background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1000 1000'%3E%3Cg fill='%23cdbf73'%3E%3Cpolygon points='1000 -50 0 -50 500 450'/%3E%3Cpolygon points='550 500 1050 1000 1050 0'/%3E%3Cpolygon points='-50 0 -50 1000 450 500'/%3E%3Cpolygon points='0 1050 1000 1050 500 550'/%3E%3C/g%3E%3Cg fill='%239c804d'%3E%3Cpolygon points='1000 -133.3 0 -133.3 500 366.7'/%3E%3Cpolygon points='633.3 500 1133.3 1000 1133.3 0'/%3E%3Cpolygon points='-133.3 0 -133.3 1000 366.7 500'/%3E%3Cpolygon points='0 1133.3 1000 1133.3 500 633.3'/%3E%3C/g%3E%3Cg fill='%236a4026'%3E%3Cpolygon points='1000 -216.7 0 -216.7 500 283.3'/%3E%3Cpolygon points='716.7 500 1216.7 1000 1216.7 0'/%3E%3Cpolygon points='-216.7 0 -216.7 1000 283.3 500'/%3E%3Cpolygon points='0 1216.7 1000 1216.7 500 716.7'/%3E%3C/g%3E%3Cg fill='%23380000'%3E%3Cpolygon points='1000 -300 0 -300 500 200'/%3E%3Cpolygon points='800 500 1300 1000 1300 0'/%3E%3Cpolygon points='-300 0 -300 1000 200 500'/%3E%3Cpolygon points='0 1300 1000 1300 500 800'/%3E%3C/g%3E%3Cg fill-opacity='0.5'%3E%3Cpolygon fill='%23ff0000' points='0 707.1 0 292.9 292.9 0 707.1 0 1000 292.9 1000 707.1 707.1 1000 292.9 1000'/%3E%3Cg fill='%23cd0000'%3E%3Cpolygon points='464.6 -242.5 -242.5 464.6 464.6 464.6'/%3E%3Cpolygon points='535.4 464.6 1242.5 464.6 535.4 -242.5'/%3E%3Cpolygon points='-242.5 535.4 464.6 1242.5 464.6 535.4'/%3E%3Cpolygon points='535.4 1242.5 1242.5 535.4 535.4 535.4'/%3E%3C/g%3E%3Cg fill='%239c0000'%3E%3Cpolygon points='405.7 -301.4 -301.4 405.7 405.7 405.7'/%3E%3Cpolygon points='594.3 405.7 1301.4 405.7 594.3 -301.4'/%3E%3Cpolygon points='-301.4 594.3 405.7 1301.4 405.7 594.3'/%3E%3Cpolygon points='594.3 1301.4 1301.4 594.3 594.3 594.3'/%3E%3C/g%3E%3Cg fill='%236a0000'%3E%3Cpolygon points='346.8 -360.3 -360.3 346.8 346.8 346.8'/%3E%3Cpolygon points='653.2 346.8 1360.3 346.8 653.2 -360.3'/%3E%3Cpolygon points='-360.3 653.2 346.8 1360.3 346.8 653.2'/%3E%3Cpolygon points='653.2 1360.3 1360.3 653.2 653.2 653.2'/%3E%3C/g%3E%3Cg fill='%23380000'%3E%3Cpolygon points='287.9 -419.2 -419.2 287.9 287.9 287.9'/%3E%3Cpolygon points='712.1 287.9 1419.2 287.9 712.1 -419.2'/%3E%3Cpolygon points='-419.2 712.1 287.9 1419.2 287.9 712.1'/%3E%3Cpolygon points='712.1 1419.2 1419.2 712.1 712.1 712.1'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
background-attachment: fixed;
background-size: cover;}
.nr-dos:hover, nr-dos:active {color: #f44336 !important;border: 2px solid #f44336;}
    
.nr-tres {text-align: left; background-color: #ff9d00; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg stroke='%23000' stroke-width='66.7' stroke-opacity='0.05' %3E%3Ccircle fill='%23ff9d00' cx='0' cy='0' r='1800'/%3E%3Ccircle fill='%23fb8d17' cx='0' cy='0' r='1700'/%3E%3Ccircle fill='%23f47d24' cx='0' cy='0' r='1600'/%3E%3Ccircle fill='%23ed6e2d' cx='0' cy='0' r='1500'/%3E%3Ccircle fill='%23e35f34' cx='0' cy='0' r='1400'/%3E%3Ccircle fill='%23d85239' cx='0' cy='0' r='1300'/%3E%3Ccircle fill='%23cc453e' cx='0' cy='0' r='1200'/%3E%3Ccircle fill='%23be3941' cx='0' cy='0' r='1100'/%3E%3Ccircle fill='%23b02f43' cx='0' cy='0' r='1000'/%3E%3Ccircle fill='%23a02644' cx='0' cy='0' r='900'/%3E%3Ccircle fill='%23901e44' cx='0' cy='0' r='800'/%3E%3Ccircle fill='%23801843' cx='0' cy='0' r='700'/%3E%3Ccircle fill='%236f1341' cx='0' cy='0' r='600'/%3E%3Ccircle fill='%235e0f3d' cx='0' cy='0' r='500'/%3E%3Ccircle fill='%234e0c38' cx='0' cy='0' r='400'/%3E%3Ccircle fill='%233e0933' cx='0' cy='0' r='300'/%3E%3Ccircle fill='%232e062c' cx='0' cy='0' r='200'/%3E%3Ccircle fill='%23210024' cx='0' cy='0' r='100'/%3E%3C/g%3E%3C/svg%3E"); background-attachment: fixed; background-size: cover;}
.nr-tres:hover, nr-tres:active {color: #FF6F00 !important;}
    
.nr-cuatro {text-align: right; background-color: #38c91e; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='540' height='450' viewBox='0 0 1080 900'%3E%3Cg fill-opacity='.1'%3E%3Cpolygon fill='%23444' points='90 150 0 300 180 300'/%3E%3Cpolygon points='90 150 180 0 0 0'/%3E%3Cpolygon fill='%23AAA' points='270 150 360 0 180 0'/%3E%3Cpolygon fill='%23DDD' points='450 150 360 300 540 300'/%3E%3Cpolygon fill='%23999' points='450 150 540 0 360 0'/%3E%3Cpolygon points='630 150 540 300 720 300'/%3E%3Cpolygon fill='%23DDD' points='630 150 720 0 540 0'/%3E%3Cpolygon fill='%23444' points='810 150 720 300 900 300'/%3E%3Cpolygon fill='%23FFF' points='810 150 900 0 720 0'/%3E%3Cpolygon fill='%23DDD' points='990 150 900 300 1080 300'/%3E%3Cpolygon fill='%23444' points='990 150 1080 0 900 0'/%3E%3Cpolygon fill='%23DDD' points='90 450 0 600 180 600'/%3E%3Cpolygon points='90 450 180 300 0 300'/%3E%3Cpolygon fill='%23666' points='270 450 180 600 360 600'/%3E%3Cpolygon fill='%23AAA' points='270 450 360 300 180 300'/%3E%3Cpolygon fill='%23DDD' points='450 450 360 600 540 600'/%3E%3Cpolygon fill='%23999' points='450 450 540 300 360 300'/%3E%3Cpolygon fill='%23999' points='630 450 540 600 720 600'/%3E%3Cpolygon fill='%23FFF' points='630 450 720 300 540 300'/%3E%3Cpolygon points='810 450 720 600 900 600'/%3E%3Cpolygon fill='%23DDD' points='810 450 900 300 720 300'/%3E%3Cpolygon fill='%23AAA' points='990 450 900 600 1080 600'/%3E%3Cpolygon fill='%23444' points='990 450 1080 300 900 300'/%3E%3Cpolygon fill='%23222' points='90 750 0 900 180 900'/%3E%3Cpolygon points='270 750 180 900 360 900'/%3E%3Cpolygon fill='%23DDD' points='270 750 360 600 180 600'/%3E%3Cpolygon points='450 750 540 600 360 600'/%3E%3Cpolygon points='630 750 540 900 720 900'/%3E%3Cpolygon fill='%23444' points='630 750 720 600 540 600'/%3E%3Cpolygon fill='%23AAA' points='810 750 720 900 900 900'/%3E%3Cpolygon fill='%23666' points='810 750 900 600 720 600'/%3E%3Cpolygon fill='%23999' points='990 750 900 900 1080 900'/%3E%3Cpolygon fill='%23999' points='180 0 90 150 270 150'/%3E%3Cpolygon fill='%23444' points='360 0 270 150 450 150'/%3E%3Cpolygon fill='%23FFF' points='540 0 450 150 630 150'/%3E%3Cpolygon points='900 0 810 150 990 150'/%3E%3Cpolygon fill='%23222' points='0 300 -90 450 90 450'/%3E%3Cpolygon fill='%23FFF' points='0 300 90 150 -90 150'/%3E%3Cpolygon fill='%23FFF' points='180 300 90 450 270 450'/%3E%3Cpolygon fill='%23666' points='180 300 270 150 90 150'/%3E%3Cpolygon fill='%23222' points='360 300 270 450 450 450'/%3E%3Cpolygon fill='%23FFF' points='360 300 450 150 270 150'/%3E%3Cpolygon fill='%23444' points='540 300 450 450 630 450'/%3E%3Cpolygon fill='%23222' points='540 300 630 150 450 150'/%3E%3Cpolygon fill='%23AAA' points='720 300 630 450 810 450'/%3E%3Cpolygon fill='%23666' points='720 300 810 150 630 150'/%3E%3Cpolygon fill='%23FFF' points='900 300 810 450 990 450'/%3E%3Cpolygon fill='%23999' points='900 300 990 150 810 150'/%3E%3Cpolygon points='0 600 -90 750 90 750'/%3E%3Cpolygon fill='%23666' points='0 600 90 450 -90 450'/%3E%3Cpolygon fill='%23AAA' points='180 600 90 750 270 750'/%3E%3Cpolygon fill='%23444' points='180 600 270 450 90 450'/%3E%3Cpolygon fill='%23444' points='360 600 270 750 450 750'/%3E%3Cpolygon fill='%23999' points='360 600 450 450 270 450'/%3E%3Cpolygon fill='%23666' points='540 600 630 450 450 450'/%3E%3Cpolygon fill='%23222' points='720 600 630 750 810 750'/%3E%3Cpolygon fill='%23FFF' points='900 600 810 750 990 750'/%3E%3Cpolygon fill='%23222' points='900 600 990 450 810 450'/%3E%3Cpolygon fill='%23DDD' points='0 900 90 750 -90 750'/%3E%3Cpolygon fill='%23444' points='180 900 270 750 90 750'/%3E%3Cpolygon fill='%23FFF' points='360 900 450 750 270 750'/%3E%3Cpolygon fill='%23AAA' points='540 900 630 750 450 750'/%3E%3Cpolygon fill='%23FFF' points='720 900 810 750 630 750'/%3E%3Cpolygon fill='%23222' points='900 900 990 750 810 750'/%3E%3Cpolygon fill='%23222' points='1080 300 990 450 1170 450'/%3E%3Cpolygon fill='%23FFF' points='1080 300 1170 150 990 150'/%3E%3Cpolygon points='1080 600 990 750 1170 750'/%3E%3Cpolygon fill='%23666' points='1080 600 1170 450 990 450'/%3E%3Cpolygon fill='%23DDD' points='1080 900 1170 750 990 750'/%3E%3C/g%3E%3C/svg%3E");}
.nr-cuatro:hover, nr-cuatro:active {color: #689F38 !important;}
    
</style>
{/literal}