<div class="navbar-light bg-light nr-subnav nr-subnav-bread">
        <ul>
            <div class="float-left">
            {if $tsPage == 'home'}
            {foreach from=$tsHCats item=i}
            <li class="nav-item navbar-text dropdown">
                <a class="nav-link nr-menu-sub" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$i.name}</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    {foreach from=$i.cats item=c}
                    <a class="dropdown-item link-dropdownn" href="{$tsConfig.url}/posts/{$c.c_seo}/">{$c.c_nombre}</a>
                    {/foreach}
                </div>
            </li>
            {/foreach}
            {elseif $tsPage == 'posts'}
            <ol class="breadcrumb nr-bread">
                <li class="breadcrumb-item"><a href="{$tsConfig.url}/">Inicio</a></li>
                <li class="breadcrumb-item"><a href="{$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/">{$tsPost.categoria.c_nombre}</a></li>
                <li class="breadcrumb-item active" aria-current="page">{$tsPost.post_title}</li>
            </ol>
            {elseif $tsPage == 'usuarios'}
            <ol class="breadcrumb nr-bread">
                <li class="breadcrumb-item"><a href="{$tsConfig.url}/">Inicio</a></li>
                <li class="breadcrumb-item active" aria-current="page">Usuarios de {$tsConfig.titulo}</li>
            </ol>
            {elseif $tsPage == 'equipo'}
            <ol class="breadcrumb nr-bread">
                <li class="breadcrumb-item"><a href="{$tsConfig.url}/">Inicio</a></li>
                <li class="breadcrumb-item"><a href="{$tsConfig.url}/usuarios/">Usuarios de {$tsConfig.titulo}</a></li>
                <li class="breadcrumb-item active" aria-current="page">Equipo STAFF</li>
            </ol>
            {elseif $tsPage == 'perfil'}
            <ol class="breadcrumb nr-bread">
                <li class="breadcrumb-item"><a href="{$tsConfig.url}/">Inicio</a></li>
                <li class="breadcrumb-item"><a href="{$tsConfig.url}/usuarios/">Usuarios de {$tsConfig.titulo}</a></li>
                <li class="breadcrumb-item active" aria-current="page">{$tsInfo.nick}</li>
            </ol>
            {else}
            <ol class="breadcrumb nr-bread">
                <li class="breadcrumb-item"><a href="{$tsConfig.url}/">Inicio</a></li>
                <li class="breadcrumb-item active" aria-current="page" style="text-transform: capitalize;">{$tsPage}</li>
            </ol>
            {/if}
            </div>
            <div class="float-right">
                <form action="{$tsConfig.url}/buscador/" name="top_search_box" gid="{$tsConfig.ads_search}">
                    <input type="text" name="q" onkeypress="ibuscador_intro(event)" onfocus="onfocus_input(this)" onblur="onblur_input(this)" value="Buscar" title="Buscar" class="form-control nr-search-gbl" style="font-size: 1em;border-radius: 4px;">
                    <span class="ico-search" style="color: #454545;position: absolute;top: 1.4em;right: 1.7em;"><i class="fas fa-search"></i></span>
                </form>
            </div>
        </ul>
</div>

{literal}
<style>
.nr-search-gbl {
    float: right;
    -webkit-transition: width 1s ease-out;
    -moz-transition: width 1s ease-out;
    -o-transition: width 1s ease-out;
    transition: width 1s ease-out;
}
.nr-search-gbl:active, .nr-search-gbl:hover {
    width: 200%;
    -webkit-transition: width 1s ease-out;
    -moz-transition: width 1s ease-out;
    -o-transition: width 1s ease-out;
    transition: width 1s ease-out;
}

.nr-subnav-bread {
    padding: .6em 1em .6em 0em !important;
    margin-bottom: -3px;
}
.nr-subnav {
    position: relative;
    display: inline-block;
    width: 100%;
    z-index: 2;
    padding: 1em;
    color: #fff;
    box-shadow: 0px 0px 5px rgba(0,0,0,.2);
}
.nr-headd {
    background-image: url('https://newrisus.com/themes/default/images/header_blue.jpg');
    background-blend-mode: luminosity;
    background-position: 0% 17.3%;
}
@media (max-width: 575px) {
.nr-subnav {
    padding: 0em;
} 
}
    
@media (max-width: 767px) {
.nr-subnav {
    padding: 0em;
}   
}
    
@media (max-width: 991px) {
.nr-subnav {
    padding: 0em;
}   
}
    
@media (max-width: 575px) {
.nr-subnav-bread {
    margin-top: -12px;
} 
}
    
@media (max-width: 767px) {
.nr-subnav-bread {
    margin-top: -12px;
}   
}
    
@media (max-width: 991px) {
.nr-subnav-bread {
    margin-top: -12px;
}   
}
</style>
{/literal}