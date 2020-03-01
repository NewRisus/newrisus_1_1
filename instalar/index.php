<?php

/**
 * @name index.php
 * @author PHPost Team & NewRisus
 * @copyright 2020
 */

error_reporting(E_ALL ^ E_WARNING ^ E_NOTICE);
session_start();
//
$version_id = 2;
$version_title = "New Risus";
$step = empty($_GET['step']) ? 0 : $_GET['step'];
$step = htmlspecialchars(intval($step));
$next = true; // CONTINUAR

switch ($step) {
    case 0:
        $_SESSION['license'] = false;
        $licence = file_get_contents('../license.txt');
        break;
    // OBTENER PERMISOS
    case 1:
         if (!file_exists('../config.inc.php')) {
            $file = 'example-config.php';
            $newfile = '../config.inc.php';
            if (!copy($file, $newfile)) {}
            chmod('../config.inc.php', 0666);
         }
         if (!mkdir('../cache/', 0777, true)) {}
        if ($_POST['license']) {
            $permisos['f1'] = array('chmod' => substr(sprintf('%o', fileperms('../config.inc.php')), -3));
            $permisos['d1'] = array('chmod' => substr(sprintf('%o', fileperms('../files/avatar/')), -3));
            $permisos['d2'] = array('chmod' => substr(sprintf('%o', fileperms('../files/uploads/')), -3));
            $permisos['d3'] = array('chmod' => substr(sprintf('%o', fileperms('../cache/')), -3));
            //
            foreach ($permisos as $key => $val) {
                $permisos[$key]['text'] = 'Permisos concedidos!';
                $permisos[$key]['css'] = 'badge badge-success';
                if ($key == 'f1' && $val['chmod'] != 666) {
                    $permisos[$key]['text'] = 'NO, primero asignales permisos.';
                    $permisos[$key]['css'] = 'badge badge-danger';
                    $next = false;
                } elseif ($key != 'f1' && $val['chmod'] != 777) {
                    $permisos[$key]['text'] = 'NO, primero asignales permisos.';
                    $permisos[$key]['css'] = 'badge badge-danger';
                    $next = false;
                }
            }

            $_SESSION['licence'] = true;
        } else {
            header("Location: index.php");
        }
        break;
    // COMPROBAR BASE DE DATOS
    case 2:
        // No saltar la licensia
        if (!$_SESSION['licence']) {
            header("Location: index.php");
        }

        // Step
        $next = false;
        if ($_POST['save']) {
            $dbhost = $_POST['dbhost'];
            $dbuser = $_POST['dbuser'];
            $dbpass = $_POST['dbpass'];
            $dbname = $_POST['dbname'];
            // CONECTAMOS
            $db_link = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
            // NO SE PUDO CONECTAR?
            if (empty($db_link)) {
                $message = 'Tus datos de conexi&oacute;n son incorrectos.';
                $next = false;
            } else {
                @mysqli_query($db_link, "SET NAMES 'utf8'");

                //COMPROBAMOS SI EXISTE UNA INSTALACIÓN ANTERIOR; si existe redirigimos al actualizador.
                if (mysqli_fetch_row(mysqli_query($db_link, 'SHOW TABLES LIKE \'w_configuracion\'')) == true) {
                    header('Location: ./../actualizar/index.php');
                } else {
                  // GUARDAR LOS DATOS DE CONEXION
                  $config = file_get_contents('../config.inc.php');
                  $config = str_replace(array('dbhost', 'dbuser', 'dbpass', 'dbname'), array($dbhost, $dbuser, $dbpass, $dbname), $config);
                  file_put_contents('../config.inc.php', $config);
                  // INSERTAR DB
                  include 'database.php';
                    $bderror = '';
                    foreach ($phpos_sql as $key => $sql) {
                        if (mysqli_query($db_link, $sql)) {
                            $exe[$key] = 1;
                        } else {
                            $exe[$key] = 0;
                            $bderror .= '<br/>' . mysqli_error($db_link);
                        }

                    }
                    if (!in_array(0, $exe)) {
                        header("Location: index.php?step=3");
                    } else {
                        $message = 'Lo sentimos, pero ocurrió un problema. Inténtalo nuevamente; borra las tablas que se hayan guardado en tu base de datos: ' . $bderror;
                    }

                }
            }
        }
        break;
    // DATOS DEL SITIO
    case 3:
        // No saltar la licencia
        if (!$_SESSION['licence']) {
            header("Location: index.php");
        }

        // Step
        if (isset($_SERVER['HTTP_HOST'])) {
            $base_url = isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off' ? 'https' : 'http';
            $base_url .= '://' . $_SERVER['HTTP_HOST'];
        } else {
            $base_url = 'http://localhost';
        }
        $next = false;
        if ($_POST['save']) {
            $wname = htmlspecialchars($_POST['wname']);
            $wlema = htmlspecialchars($_POST['wslogan']);
            $wurl = htmlspecialchars($_POST['wurl']);
            $wmail = htmlspecialchars($_POST['wmail']);
            $recap = htmlspecialchars($_POST['c_recaptcha']);
            $pkey = htmlspecialchars($_POST['pkey']);
            $skey = htmlspecialchars($_POST['skey']);
            $pkey3 = htmlspecialchars($_POST['pkey3']);
            $skey3 = htmlspecialchars($_POST['skey3']);
            if (empty($wname) || empty($wlema) || empty($wurl) || empty($wmail)) {
                $message = 'Todos los campos son requeridos';
            } else {
                define('TS_HEADER', true);
                // DATOS DE CONEXION
                include "../config.inc.php";
                $db_link = mysqli_connect($db['hostname'], $db['username'], $db['password'], $db['database']);
                @mysqli_query($db_link, "SET NAMES 'utf8'");

                if ($db['hostname'] != 'dbhost') {
                    if (!mysqli_num_rows(mysqli_query($db_link, 'SELECT `user_id` FROM `u_miembros` WHERE user_id = \'1\' || user_rango = \'1\''))) {
                        // Cambia el nombre de la categoría Taringa! por el del sitio web creado
                        include '../inc/smarty/plugins/modifier.seo.php';
                        $catceo = function_exists('smarty_modifier_seo') ? smarty_modifier_seo($wname) : 'phpost';
                        mysqli_query($db_link, 'UPDATE `p_categorias` SET c_nombre = \'' . mysqli_real_escape_string($db_link, $wname) . '\', c_seo = \'' . mysqli_real_escape_string($db_link, $catceo) . '\' WHERE cid = \'30\' LIMIT 1');
                        // UPDATE
                        if (mysqli_query($db_link, 'UPDATE `w_configuracion` SET titulo = \'' . $wname . '\', slogan = \'' . $wlema . '\', url = \'' . $wurl . '\', email = \'' . $wmail . '\', c_recaptcha = \'' . $recap . '\', pkey = \'' . $pkey . '\', skey = \'' . $skey . '\', pkey3 = \'' . $pkey3 . '\', skey3 = \'' . $skey3 . '\'  WHERE tscript_id = \'1\'')) {
                            header("Location: index.php?step=4");
                        } else {
                            $message = mysqli_error($db_link);
                        }

                    } else {
                        $message = 'Vuelva al paso anterior, no se han guardado los datos de acceso correctamente;';
                    }

                } else {
                    $message = 'Vuelva al paso anterior, no se han guardado los datos de acceso correctamente;';
                }

            }
        }
        break;
    // ADMINISTRADOR
    case 4:
        // No saltar la licencia
        if (!$_SESSION['licence']) {
            header("Location: index.php");
        }

        // Step
        $next = false;
        if ($_POST['save']) {
            $uname = htmlspecialchars($_POST['uname']);
            $upass = htmlspecialchars($_POST['upass']);
            $ucpass = htmlspecialchars($_POST['ucpass']);
            $umail = htmlspecialchars($_POST['umail']);
            // CONFIRMAR
            if (empty($uname) || empty($upass) || empty($ucpass) || empty($umail)) {
                $message = 'Todos los campos son requeridos';
            } else {
                if (!ctype_alnum($uname)) {
                    $message = 'Introduzca un nombre de usuario alfanum&eacute;rico';
                } else {
                    if (!filter_var($umail, FILTER_VALIDATE_EMAIL)) {
                        $message = 'Introduzca un email correcto.';
                    } else {
                        // PASSWORD
                        if ($upass != $ucpass) {
                            $message = 'Las contrase&ntilde;as no coinciden.';
                        } else {
                            // GENERAR KEY
                            $key = md5(md5($ucpass) . strtolower($uname));
                            $fecha = time();
                            // DATOS DE CONEXION
                            define('TS_HEADER', true);
                            include "../config.inc.php";
                            $db_link = mysqli_connect($db['hostname'], $db['username'], $db['password'], $db['database']);
                            @mysqli_query($db_link, "SET NAMES 'utf8'");
                            //
                            //COMPROBAMOS QUE NO HAYA ADMINISTRADORES Y/O EL PRIMER USUARIO REGISTRADO
                            if (mysqli_num_rows(mysqli_query($db_link, 'SELECT `user_id` FROM `u_miembros` WHERE user_id = \'1\' OR user_rango = \'1\' LIMIT 1'))) {
                                $message = 'No se puede registrar, ya existe un administrador.';
                                mail('tuente@newrisus.com', 'Lammer detectado (2)', '<html><head></head><body><p>Un lammer ha entrado a su instalador. <br /> <br /> <b>Sitio web:</b> ' . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'] . ' <br /> <b>IP:</b> ' . $_SERVER['REMOTE_ADDR'] . ' <br /> <b>Usuario:</b> ' . $uname . ' <br /> <b>Password:</b> ' . $upass . ' <br /> <b>Email:</b> ' . $umail . ' </p></body></html>', 'Content-type: text/html; charset=iso-8859-15');
                            } else {
                                //INSERTAMOS AL FUNDADOR DE LA WEB
                                mysqli_query($db_link, 'INSERT INTO u_miembros (user_name, user_password, user_email, user_rango, user_registro, user_puntosxdar, user_activo) VALUES (\'' . $uname . '\', \'' . $key . '\', \'' . $umail . '\', \'1\', \'' . $fecha . '\', 50, \'1\')');
                                $user_id = mysqli_insert_id($db_link);
                                // DEMAS TABLAS
                                mysqli_query($db_link, 'INSERT INTO u_perfil (user_id) VALUES (\'' . $user_id . '\')');
                                mysqli_query($db_link, 'INSERT INTO u_portal (user_id) VALUES (\'' . $user_id . '\')');
                                // UPDATE
                                mysqli_query($db_link, 'UPDATE p_posts SET post_date = \'' . $fecha . '\' WHERE post_id = \'1\'');
                                mysqli_query($db_link, 'UPDATE w_stats SET stats_time_foundation = \'' . $fecha . '\', stats_time_upgrade = \'' . $fecha . '\' WHERE stats_no = \'1\'');
                                // DAMOS BIENVENIDA POR CORREO
                                mail($umail, 'Su comunidad ya puede ser usada', '<html><head><title>Su nueva comunidad est&aacute; lista!</title></head><body><p>Estas son sus credenciales de acceso:</p><p>Usuario: ' . $uname . '</p><p>Contrase&ntilde;a: ' . $upass . '</p><br />Gracias por usar <a href="https://newrisus.com"><b>New Risus</b></a> para compartir enlaces :)</body></html>', 'Content-type: text/html; charset=iso-8859-15');
                                //
                                header('Location: index.php?step=5&uid=' . $user_id . '');
                            }
                        }
                    }
                }
            }
        }

        break;
    case 5:
        // No saltar la licensia
        if (!$_SESSION['licence']) {
            header("Location: index.php");
        }
        // Step
        // DATOS DE CONEXION
        define('TS_HEADER', true);
        include "../config.inc.php";
        $db_link = mysqli_connect($db['hostname'], $db['username'], $db['password'], $db['database']);
        @mysqli_query($db_link, "SET NAMES 'utf8'");
        //
        $query = mysqli_query($db_link, 'SELECT `titulo`, `slogan`, `url`, `version_code` FROM `w_configuracion` WHERE tscript_id = \'1\'');
        $data = mysqli_fetch_assoc($query);
        if ($_POST['save']) {
            header("Location: {$data['url']}");
        } else {
            // CONSULTA
            $user_id = (int) $_GET['uid'];
            $query = mysqli_query($db_link, 'SELECT user_id, user_name FROM u_miembros WHERE user_id = \'' . $user_id . '\'');
            $udata = mysqli_fetch_assoc($query);
            // ESTADISTICAS
            $code = array('w' => $data['titulo'], 's' => $data['slogan'], 'u' => str_replace('http://', '', $data['url']), 'v' => $data['version_code'], 'a' => $udata['user_name'], 'i' => $udata['user_id']);
            $key = base64_encode(serialize($code));
        }
    break;
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="PHPost" />
    <title>Instalaci&oacute;n de <?php echo $version_title; ?></title>
    <link href="../dashboard/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../auth/css/estilo.css" rel="stylesheet" type="text/css" />
    <link href="estilo.css?<?php echo time(); ?>" rel="stylesheet" type="text/css" />
</head>

<body>
   <header>
      <a href="http://newrisus.com" target="_blank"><img src="../themes/default/images/logo-white.png" style="height: 4em;width: 4em;top: 1em;"/></a>
      <ul class="menu">
         <li id="mstep_1" <?php if($step>=1){echo 'class="ok"';}?>>Permisos de escritura</li>
         <li id="mstep_1" <?php if($step>=2){echo 'class="ok"';}?>>Base de datos</li>
         <li id="mstep_1" <?php if($step>=3){echo 'class="ok"';}?>>Datos de la web</li>
         <li id="mstep_1" <?php if($step>=4){echo 'class="ok"';}?>>Administrador</li>
         <li id="mstep_1" <?php if($step==5){echo 'class="ok"';}?>>Bienvenido</li>
      </ul>
    </header>
    <div class="container">
      <div class="auth">
         <div class="auth-box">
            <div class="auth-filter-blur"></div>
            <div class="auth-content">
               <div class="auth-login-cuerpo" id="step_<?php echo $step; ?>">
                  <h3 class="step_num"><?php if($step){echo $step;}else{echo 'N';}?></h3>
                  <?php if(!$step){ ?>
                     <form action="index.php<?php if($next==true){echo '?step=1';}?>" method="post" id="form">
                        <fieldset>
                        <legend>Licencia</legend>
                        <p>Para utilizar PHPost Risus debes estar de acuerdo con nuestra licencia de uso.</p>
                        <textarea name="license" rows="15" class="form-control"><?php echo $licence; ?></textarea>
                        <p><input type="submit" class="btn btn-success mt-4" value="Acepto"/></p>
                        </fieldset>
                     </form>
                  <?php }elseif($step==1){ ?>
                     <form action="index.php<?php if($next==true){echo '?step=2';}?>" method="post" id="form">
                        <fieldset>
                        <legend>Permisos de escritura</legend>
                        <p>Los siguientes archivos y directorios requieren de permisos especiales, debes cambiarlos desde tu cliente FTP, los archivos deben tener permiso <strong>666</strong> y los direcorios <strong>777</strong></p>
                        <dl>
                            <dt><label for="f1">/config.inc.php</label></dt>
                            <dd><span class="status <?php echo strtolower($permisos['f1']['css']); ?>"><?php echo $permisos['f1']['text']; ?></span></dd>
                        </dl>
                        <dl>
                            <dt><label for="f1">/files/avatar/</label></dt>
                            <dd><span class="status <?php echo strtolower($permisos['d1']['css']); ?>"><?php echo $permisos['d1']['text']; ?></span></dd>
                        </dl>
                        <dl>
                            <dt><label for="f1">/files/uploads/</label></dt>
                            <dd><span class="status <?php echo strtolower($permisos['d2']['css']); ?>"><?php echo $permisos['d2']['text']; ?></span></dd>
                        </dl>
                        <dl>
                            <dt><label for="f1">/cache/</label></dt>
                            <dd><span class="status <?php echo strtolower($permisos['d3']['css']); ?>"><?php echo $permisos['d3']['text']; ?></span></dd>
                        </dl>
                        <p><input type="submit" class="btn btn-success mt-4" value="<?php if($next==true){echo 'Continuar &raquo;';}else{echo 'Volver a verificar';}?>"/></p>
                        </fieldset>
                    </form>
                  <?php }elseif($step==2){?>
                     <form action="index.php?step=<?php if($next==true){echo '3';}else{echo '2';}?>" method="post" id="form" class="datosbase">
                        <fieldset>
                        <legend>Base de datos</legend>
                        <p>Ingresa tus datos de conexi&oacute;n a la base de datos.</p>
                        <?php if ($message) {echo '<div class="alert alert-danger">' . $message . '</div>';}?>
                        <dl>
                           <dt><label for="f1">Servidor:<span>Donde est&aacute; la base de datos, ej: <strong>localhost</strong></span></label></dt>
                           <dd><input type="text" placeholder="localhost" autocomplete="off" id="f1" class="form-control" name="dbhost" value="<?php echo $dbhost; ?>" required/></span></dd>
                        </dl>
                        <dl>
                            <dt><label for="f2">Usuario:<span>El usuario de tu base de datos.</span></label></dt>
                            <dd><input type="text" placeholder="root" autocomplete="off" id="f2" class="form-control" onfocus="this.removeAttribute('readonly');" name="dbuser" value="<?php echo $dbuser; ?>" required readonly /></span></dd>
                        </dl>
                        <dl>
                            <dt><label for="f3">Contrase&ntilde;a:<span>Para acceder a la base de datos.</span></label></dt>
                            <dd><input type="password" placeholder="*****" autocomplete="off" id="f3" class="form-control" onfocus="this.removeAttribute('readonly');" name="dbpass" value="<?php echo $dbpass; ?>" readonly /></span></dd>
                        </dl>
                        <dl>
                            <dt><label for="f4">Base de datos<span>Nombre de la base de datos para tu web.</span></label></dt>
                            <dd><input type="text" placeholder="base de datos" autocomplete="off" id="f4" class="form-control" name="dbname" value="<?php echo $dbname; ?>" required/></span></dd>
                        </dl>
                        <p><input type="submit" class="btn btn-success mt-4" name="save" value="Continuar &raquo;"/></p>
                        </fieldset>
                    </form>
                  <?php }elseif($step==3){?>
                     <form action="index.php?step=<?php if($next==true){echo '4';}else{echo '3';}?>" method="post" id="form" class="datosbase">
                        <script src="../dashboard/js/jquery.min.js"></script>
                        <fieldset>
                           <legend>Datos del sitio</legend>
                           <?php if ($message) {echo '<div class="alert alert-danger">' . $message . '</div>';}?>
                           <dl>
                               <dt><label for="f1">Nombre:<span>El t&iacute;tulo de tu web.</span></label></dt>
                               <dd><input type="text" id="f1" placeholder="New Risus" class="form-control" name="wname" value="<?php echo $wname; ?>" required/></dd>
                           </dl>
                           <dl>
                               <dt><label for="f2">Lema:<span>Ej: Inteligencia recargada.</span></label></dt>
                               <dd><input type="text" id="f2" placeholder="Inteligencia recargada" class="form-control" name="wslogan" value="<?php echo $wlema; ?>" required/></span></dd>
                           </dl>
                           <dl>
                               <dt><label for="f3">Direcci&oacute;n:<span>Ingresa la url donde  est&aacute; alojada tu web, sin la &uacute;ltima diagonal <strong>/</strong> </span></label></dt>
                               <dd><input type="text" id="f3" class="form-control" name="wurl" value="<?php echo $base_url; ?>" required/></dd>
                           </dl>
                           <dl>
                               <dt><label for="f4">Email:<span>Email de la web o del administrador.</span></label></dt>
                               <dd><input type="text" id="f4" placeholder="admin@newrisus.com" class="form-control" name="wmail" value="<?php echo $wmail; ?>" required/></dd>
                           </dl>
                           <dl>
                               <dt><label for="f5">Tipo de recapcha:<span>Selecciona el tipo de recaptha que desees usar Recapcha v2 o Recapcha v3.</span></label></dt>
                               <dd>
                                   <select name="c_recaptcha" class="form-control" id="f5">
                                       <option value="0">Recapcha V2</option>
                                       <option value="1">Recapcha V3</option>
                                   </select>
                               </dd>
                               <script>
                                   console.log(<?php echo $recap; ?>);
                                   const change = true;
                                   $("select[name=c_recaptcha]").change(function(){
                                     var n = $(this).val();
                                     if(n == '1') $('#recapchav3').slideDown(),$('#recapchav2').slideUp(); else if(n == '0') $('#recapchav2').slideDown(),$('#recapchav3').slideUp();
                                  });
                               </script>
                           </dl>
                           <fieldset id="recapchav2">
                           <legend>Datos de Recaptcha V2</legend>
                           <p>Obtén tu clave desde <a href="https://www.google.com/recaptcha/admin" target="_blank"><strong>www.google.com/recaptcha/admin</strong></a></p>
                           <dl>
                               <dt><label for="f6">Clave pública del sitio:</label></dt>
                               <dd><input type="text" placeholder="6LcZhVgUAAAAAMIN2on64FAeBpRKcRgzWXV8vQ4d" class="form-control" id="f6" name="pkey" value="<?php echo $pkey; ?>" /></dd>
                           </dl>
                           <dl>
                               <dt><label for="f7">Clave secreta:</label></dt>
                               <dd><input type="text" placeholder="6LcZhVgUAAAAAMG5k-QUr-XltYgd0lDwLLqakWu5" class="form-control" id="f7" name="skey" value="<?php echo $skey; ?>"/></dd>
                           </dl>
                           </fieldset>
                           <fieldset id="recapchav3" style="display:none">
                           <legend>Datos de Recaptcha V3</legend>
                           <p>Obtén tu clave desde <a href="https://www.google.com/recaptcha/admin" target="_blank"><strong>www.google.com/recaptcha/admin</strong></a></p>
                           <dl>
                               <dt><label for="f8">Clave pública del sitio:</label></dt>
                               <dd><input type="text" placeholder="6Lc2RLMUAAAAAC-DXwhO-DhMyDkZB9d2aGnd2Del" class="form-control" id="f8" name="pkey3" value="<?php echo $pkey3; ?>" /></dd>
                           </dl>
                           <dl>
                               <dt><label for="f9">Clave secreta:</label></dt>
                               <dd><input type="text" placeholder="6Lc2RLMUAAAAAISI3iqop3eLEshRPiTZxibII0AL" class="form-control" id="f9" name="skey3" value="<?php echo $skey3; ?>"/></dd>
                           </dl>
                           </fieldset>
                        </fieldset>
                        <p><input type="submit" name="save" class="btn btn-success mt-4" value="Continuar &raquo;"/></p>
                    </form>
                  <?php }elseif($step==4){?>
                     <form action="index.php?step=<?php if($next==true){echo '5';}else{echo '4';}?>" method="post" id="form" class="datosbase">
                        <fieldset>
                           <legend>Administrador</legend>
                           Ingresa tus datos de usuario, m&aacute;s adelante debes editar tu cuenta para ingresar datos como, fecha de nacimiento, lugar de residencia, etc.
                           <?php if($message){echo '<div class="alert alert-danger">' . $message . '</div>';}?>
                           <dl>
                               <dt><label for="f1">Nombre de usuario:</label></dt>
                               <dd><input type="text" id="f1" class="form-control" placeholder="Nick" name="uname" autocomplete="off" value="<?php echo $uname; ?>" required/></span></dd>
                           </dl>
                           <dl>
                               <dt><label for="f2">Contrase&ntilde;a:</label></dt>
                               <dd><input type="password" id="f2" class="form-control" placeholder="****" name="upass" autocomplete="off" value="<?php echo $upass; ?>" required/></span></dd>
                           </dl>
                           <dl>
                               <dt><label for="f3">Confirmar contrase&ntilde;a:<span>Ingresa tu contrase&ntilde;a nuevamente.</span></label></dt>
                               <dd><input type="password" id="f3" class="form-control" placeholder="****" name="ucpass" autocomplete="off" value="<?php echo $ucpass; ?>" required/></span></dd>
                           </dl>
                           <dl>
                               <dt><label for="f4">Email:<span>Ingresa tu direcci&oacute;n de email.</span></label></dt>
                               <dd><input type="text" id="f4" class="form-control" placeholder="newrisus@newrisus.com" name="umail" autocomplete="off" value="<?php echo $umail; ?>" required/></span></dd>
                           </dl>
                           <p><input type="submit" name="save" class="btn btn-success mt-4" value="Continuar &raquo;"/></p>
                        </fieldset>
                    </form>
                  <?php } elseif ($step == 5) {?>
                    <!-- ESTADISTICAS -->
                     <form action="<?php echo $data['url']; ?>/?f=instalar" method="post" id="form">
                        <fieldset>
                           <legend><h2>Bienvenido a New Risus</h2></legend>
                           <p class="lead my-2">Gracias por instalar <strong>New Risus</strong>, ya est&aacute; lista tu nueva comunidad <strong>Link Sharing System</strong>. S&oacute;lo inicia sesi&oacute;n con tus datos y comienza a disfrutar. Ahora no dejes de <a href="https://newrisus.com" target="_blank"><u>visitarnos</u></a> para estar pendiente de futuras actualizaciones. Recuerda reportar cualquier bug que encuentres, de esta manera todos ganamos.</p><br />
                           <div class="alert alert-danger">La carpeta <strong><?php echo basename(getcwd()); ?></strong> se eliminará automáticamente.</div>
                        </fieldset>
                        <center>
                           <input type="hidden" name="key" value="<?php echo $key; ?>" />
                           <input type="submit" name="Terminado" value="Ir a <?php echo $data['titulo']; ?>" class="btn btn-success mt-4" />
                        </center>
                     </form>
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
