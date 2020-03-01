<?php 
/**
 * Controlador
 *
 * @name    admin.php
 * @author  PHPost Team
*/
 
/**********************************\
 
* (VARIABLES POR DEFAULT) *
 
\*********************************/
 
$tsPage = "equipo"; // tsPage.tpl -> PLANTILLA PARA MOSTRAR CON ESTE ARCHIVO.
 
$tsLevel = 2; // NIVEL DE ACCESO A ESTA PAGINA. => VER FAQs
 
$tsAjax = empty($_GET['ajax']) ? 0 : 1; // LA RESPUESTA SERA AJAX?
 
$tsContinue = true; // CONTINUAR EL SCRIPT
 
/*++++++++ = ++++++++*/
 
include "../../header.php"; // INCLUIR EL HEADER
 
$tsTitle = $tsCore->settings['titlo'].' Equipo de '.$tsCore->settings['titulo'];  // TITULO DE LA PAGINA ACTUAL
 
/*++++++++ = ++++++++*/
 
// VERIFICAMOS EL NIVEL DE ACCSESO ANTES CONFIGURADO
$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
if($tsLevelMsg != 1){ 
$tsPage = 'aviso';
$tsAjax = 0;
$smarty->assign("tsAviso",$tsLevelMsg);
//
$tsContinue = false;
}
//
if($tsContinue){
 
/**********************************\
 
* (VARIABLES LOCALES ESTE ARCHIVO) *
 
\*********************************/
 
// ACTION
$action = htmlspecialchars($_GET['action']);
// ACTION 2
$act = htmlspecialchars($_GET['act']);
// CLASE POSTS
include("../class/c.equipo.php");
$tsAdmin = new tsAdmin();
 
 
/**********************************\
 
* (INSTRUCCIONES DE CODIGO) *
 
\*********************************/

	$smarty->assign("tsAdmins",$tsAdmin->getAdmins());
	$smarty->assign("tsMods",$tsAdmin->getMods());
	$smarty->assign("tsBetas",$tsAdmin->getBetas());

/**********************************\
 
* (AGREGAR DATOS GENERADOS | SMARTY) *
 
\*********************************/
// ACCION?
$smarty->assign("tsAction",$action);
//
$smarty->assign("tsAct",$act);
//
}
 
if(empty($tsAjax)) { // SI LA PETICION SE HIZO POR AJAX DETENER EL SCRIPT Y NO MOSTRAR PLANTILLA, SI NO ENTONCES MOSTRARLA.
 
$smarty->assign("tsTitle",$tsTitle); // AGREGAR EL TITULO DE LA PAGINA ACTUAL
 
$smarty->assign("tsSave",$_GET['save']); // AGREGAR EL TITULO DE LA PAGINA ACTUAL
 
/*++++++++ = ++++++++*/
include("../../footer.php");
/*++++++++ = ++++++++*/
}
 
