<?php

/**
 * @name /upgrade/index.php
 * @author PHPost Team
 * @copyright 2019
 */
error_reporting(0);
//

session_start();

include("mysql2i.class.php");
include("functions.php");

$step = htmlspecialchars(intval($_GET['step']));
$version_title = "New Risus";
if(!$step)  header('Location: index.php?step=1');

list($coll, $c_coll) = include("collection.php");

switch($step) {
   case 1: // Password base de datos.
      $chmod = substr(sprintf('%o', fileperms('../config.inc.php')), -3);
      chmod('../config.inc.php', 0666);
      if($chmod != 666) $message = 'Por favor cambia los permisos CHMOD del archivo <strong>config.inc.php</strong> a 666';
      // Verificamos connección
      if ($_POST['connect']) {
         // Tratamos de conectar
         $db['hostname'] = $_POST['dbhost'];
         $db['username'] = $_POST['dbuser'];
         $db['password'] = $_POST['dbpass'];
         $db['database'] = $_POST['dbname'];
         // CONECTAMOS
         $rst = do_connect($db);
         if ($rst == 1) {
            // Guardamos en una variable de session para continuar el proceso.
            $_SESSION['db'] = $db;
            // Actualizamos config.inc.php
            $config = file_get_contents('../config.inc.php');
            $config = str_replace(
               array('dbhost', 'dbuser', 'dbpass', 'dbname'), 
               array($db['hostname'], $db['username'], $db['password'], $db['database']), $config
            );
            file_put_contents('../config.inc.php',$config);
            // Segundo páso
            header("Location: index.php?step=2");
		    }
		    else
		    {
		        $message = 'Tus datos de conexi&oacute;n son incorrectos.';
		    }

        }
        break;
    case 2: // Seleccion de actualización.
        check_connection();

        break;
    case 3: // Aplicación cambios BD.
        check_connection();

        // Verificamos el POST.
        if ( ! isset($_POST['update']) || ! is_array($_POST['update']))
        {
            header('Location: index.php?step=2&error=1');
        }
        $rst = procesar_collection($coll, $_POST['update'], $c_coll);

        break;
    case 4: // Resumen instalación.
        //check_connection();
        //unset($_SESSION['passwd']);
        //session_destroy();

        break;
    default:
        header("Location: index.php?step=1");

}
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="<?php echo $version_title; ?>" />
    <title>Actualizaci&oacute;n de <?php echo $version_title; ?></title>
    <link href="../dashboard/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../auth/css/estilo.css" rel="stylesheet" type="text/css" />
    <link href="estilo.css?<?php echo time(); ?>" rel="stylesheet" type="text/css" />
</head>

<body>
   <header>
      <a href="http://newrisus.com" target="_blank"><img src="../auth/img/Footer.png" /></a>
      <ul class="menu">
         <li id="mstep_1" <?php if($_GET['step']>0) echo 'class="ok"';?>>Conexi&oacute;n</li>
         <li id="mstep_1" <?php if($_GET['step']>1) echo 'class="ok"';?>>Selecci&oacute;n</li>
         <li id="mstep_1" <?php if($_GET['step']>2) echo 'class="ok"';?>>Actualizaci&oacute;n</li>
         <li id="mstep_1" <?php if($_GET['step']>3) echo 'class="ok"';?>>Resumen</li>
      </ul>
    </header>
    <div class="container">
      <div class="auth">
         <div class="auth-box">
            <div class="auth-filter-blur"></div>
            <div class="auth-content">
               <div class="auth-login-cuerpo" id="step_<?=$step;?>">
                  <h3 class="step_num"><?php if($step){echo $step;}else{echo 'N';}?></h3>
                  <?php if($step==1){ ?>
                     <form action="index.php?step=1" method="post" id="form" class="datosbase">
                       <fieldset>
                           <legend>Conexi&oacute;n</legend>
                           <p>Ingresa los datos de acceso a la base de datos en d&oacute;nde actualmente tienes instalado PHPost.</p>
                           <?php if($message) echo '<div class="alert alert-danger">'.$message.'</div>';?>
                           <dl>
                              <dt><label for="f1">Servidor:<span>D&oacute;nde est&aacute; la base de datos, ej: <strong>localhost</strong></span></label></dt>
                              <dd><input type="text" class="form-control" onfocus="this.removeAttribute('readonly');" readonly placeholder="localhost" autocomplete="off" id="f1" name="dbhost" value="<?php echo $dbhost;?>" /></span></dd>
                           </dl>
                           <dl>
                              <dt><label for="f2">Usuario:<span>El usuario de tu base de datos.</span></label></dt>
                              <dd><input type="text" class="form-control" onfocus="this.removeAttribute('readonly');" readonly placeholder="root" autocomplete="off" id="f2" name="dbuser" value="<?php echo $dbuser;?>" /></span></dd>
                           </dl>
                           <dl>
                              <dt><label for="f3">Contrase&ntilde;a:<span>Para acceder a la base de datos.</span></label></dt>
                              <dd><input type="password" placeholder="****" class="form-control" onfocus="this.removeAttribute('readonly');" readonly autocomplete="off" id="f3" name="dbpass" value="<?php echo $dbpass;?>" /></span></dd>
                           </dl>
                           <dl>
                              <dt><label for="f4">Base de datos<span>Nombre de la base de datos para tu web.</span></label></dt>
                              <dd><input type="text" placeholder="Base de datos" class="form-control" onfocus="this.removeAttribute('readonly');" readonly autocomplete="off" id="f4" name="dbname" value="<?php echo $dbname;?>" /></span></dd>
                           </dl>
                           <p><input type="submit" name="connect" class="btn btn-success mt-2" value="Conectar &raquo;"/></p>
                       </fieldset>
                    </form>
                  <?php } elseif($step == 2) { ?>
                     <form action="index.php?step=3" method="post" id="form" class="datosbase">
                        <?php if (isset($_GET['error'])): ?>
                           <div class="alert alert-warning">No ha seleccionado correctamente los campos.</div>
                        <?php endif; ?>
                        <fieldset>
                           <legend>Selecciones procedimiento de instalación:</legend>
                           <?php echo generate_collection($coll); ?>
                           <p><input type="submit" name="select" class="btn btn-success mt-2" value="Realizar &raquo;"/></p>
                        </fieldset>
                    </form>
                  <?php } elseif($step == 3) {?>
                    <form action="index.php?step=4" method="post" id="form" class="datosbase">
                       <fieldset>
                           <legend>Resultado de la actualización:</legend>
                           <?php echo resultado_html($coll, $rst); ?>                        
                           <p><input type="submit" name="select" class="btn btn-success mt-2" value="Continuar &raquo;"/></p>
                       </fieldset>
                    </form>
                    <?php } elseif($step == 4) {include "../header.php";?>
                    <div class="form">
                       <fieldset>
                           <legend><h2>Bienvenido a New Risus</h2></legend>
                           <p class="lead my-2">La actualizaci&oacute;n ha sido exitosa y ahora puede volver a usar su comunidad. Gracias por usar <strong>New risus</strong> como su sistema de compartimiento de enlaces. No deje de <a href="https://newrisus/" target="_blank"><u>visitarnos</u></a> y estar pendiente de futuras actualizaciones. Recuerde reportar cualquier bug que encuentre para as&iacute; poder solucionarlos.</p><br>
                           <div class="alert alert-danger">La carpeta <strong><?php echo basename(getcwd()); ?></strong> se eliminará automáticamente.</div>
                       </fieldset>
                       <center>
                           <input type="hidden" name="key" value="<?php echo $key; ?>" />
                           <a href="<?php echo $tsCore->settings['url']?>/?f=actualizar" class="btn btn-success mt-2">Volver a <?php echo $tsCore->settings['titulo']; ?></a>
                       </center>
                     </div>
                    <?php }?>
               </div><!-- .auth-login-cuerpo -->
            </div><!-- .auth-content -->
            <div id="footer">
               <p><a href="https://newrisus" target="_blank">NewRisus</a> &copy; <?php echo date('Y'); ?></p>
            </div>
         </div><!-- .auth-box -->
      </div><!-- .auth -->
   </div>
</body>
</html>