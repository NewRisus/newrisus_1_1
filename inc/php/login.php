<?php

/**********************************\
    [MOD] Login v5 by Lucho
*	(VARIABLES POR DEFAULT)		*

\*********************************/

    $tsPage = "login";
	    	    	
   	include "../../header.php"; // INCLUIR EL HEADER
 
    $smarty->assign("tsDo",$_GET['do']);
		
	$tsLevel = 1;		// NIVEL DE ACCESO A ESTA PAGINA. => VER FAQs

	$tsAjax = empty($_GET['ajax']) ? 0 : 1; // LA RESPUESTA SERA AJAX?
	
	$tsContinue = true;	// CONTINUAR EL SCRIPT

		$tsTitle = $tsCore->settings['titulo'].' - '.$tsCore->settings['slogan']; 	// TITULO DE LA PAGINA ACTUAL

if($tsUser->is_member){


 	$desde = $tsCore->settings['url'];
     header ("Location: ".$desde);
}



		
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

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/


/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/



    include("../ext/datos.php");





    // SOLO MENORES DE 100 AÑOS xD Y MAYORES DE...
    $now_year = date("Y",time());
    $max_year = 100 - $tsCore->settings['c_allow_edad'];
    $end_year = $now_year - $tsCore->settings['c_allow_edad'];
    $smarty->assign("tsMax",$max_year);
    $smarty->assign("tsEndY",$end_year);
    $smarty->assign("tsPaises",$tsPaises);
    $smarty->assign("tsMeces",$tsMeces);
    $smarty->assign("tsFrom",$_GET['from']);
    $smarty->assign("tsType",'normal');
	}
/**********************************\

* (AGREGAR DATOS GENERADOS | SMARTY) *

\*********************************/
	
if(empty($tsAjax)) {	// SI LA PETICION SE HIZO POR AJAX DETENER EL SCRIPT Y NO MOSTRAR PLANTILLA, SI NO ENTONCES MOSTRARLA.

	$smarty->assign("tsTitle",$tsTitle);	// AGREGAR EL TITULO DE LA PAGINA ACTUAL

	/*++++++++ = ++++++++*/
	include(TS_ROOT."/footer.php");
	/*++++++++ = ++++++++*/
}

?>

