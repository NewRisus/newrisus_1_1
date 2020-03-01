<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * El footer permite mostrar la plantilla
 * Actualizacion Realizada: Smarty 3
 *
 * @name    footer.php
 * @author  PHPost Team
 */

/*
 * -------------------------------------------------------------------
 *  Realizamos tareas para mostrar la plantilla
 * -------------------------------------------------------------------
*/
define('PLANTILLAS', TS_ROOT.DIRECTORY_SEPARATOR.'themes'.DIRECTORY_SEPARATOR.TS_TEMA.DIRECTORY_SEPARATOR.'templates');  
/*
 * -------------------------------------------------------------------
 *  DEFINIMOS LAS RUTAS DE LOS TEMPLATES (T.PAGINA.TPL)
 * -------------------------------------------------------------------
*/
$smarty->setTemplateDir(array(
  /* ↓ Templates ↓ */
  'One' => PLANTILLAS, 
  /* ↓ Login & Registro ↓ */
  'Two' => TS_ROOT . DIRECTORY_SEPARATOR . 'auth',
  /* ↓ Administración & Moderación ↓ */
  'Three' => TS_ROOT . DIRECTORY_SEPARATOR . 'dashboard',
));

/*
 * -------------------------------------------------------------------
 *  DEFINIMOS EL DIRECTORIO DE LA CARPETA CACHE
 * -------------------------------------------------------------------
*/
$smarty->setCompileDir(TS_ROOT.DIRECTORY_SEPARATOR.'cache'.DIRECTORY_SEPARATOR.TS_TEMA);

/* COMPRIME EL HTML PARA MÁS VELOCIDAD */
$smarty->loadFilter('output', 'trimwhitespace');

/* HABILITA SEGUIRDAD PREDETERMINADA */
$smarty->enableSecurity(); 

/* Establecer los directorios donde se almacenan los archivos de configuración, lo dejamos así porque no hemos creado directorios de configuraciones. (https://www.smarty.net/docs/en/variable.compile.dir.tpl) */
$smarty->setConfigDir(array('url' => $tsCore->settings['url'],'title' => $tsCore->settings['titulo']));

// Página solicitada
$smarty->assign("tsPage",$tsPage);

// Mostramos la plantilla
if($smarty->templateExists("t.{$tsPage}.tpl")) $smarty->display("t.{$tsPage}.tpl");
else die("0: Lo sentimos, se produjo un error al cargar la plantilla 't.{$tsPage}.tpl' en su theme actual. Contacte al administrador");