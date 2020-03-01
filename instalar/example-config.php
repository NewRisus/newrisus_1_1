<?php if ( ! defined('TS_HEADER')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------
| AJUSTES DE BASE DE DATOS
| -------------------------------------------------------------------
| Esta variable contendra los ajustes necesarios para acceder a su base de datos.
| -------------------------------------------------------------------
| EXPLICACION DE VARIABLES
| -------------------------------------------------------------------
|
|	['hostname'] The hostname of your database server.
|	['username'] The username used to connect to the database
|	['password'] The password used to connect to the database
|	['database'] The name of the database you want to connect to
*/

$db['hostname'] = 'dbhost';
$db['username'] = 'dbuser';
$db['password'] = 'dbpass';
$db['database'] = 'dbname';

/*
 * -------------------------------------------------------------------
 *  Constantes
 * -------------------------------------------------------------------
 */
define('TSCookieName','PPCook');

/*
| -------------------------------------------------------------------
| AJUSTES DE MENSAJES ESTATICOS
| -------------------------------------------------------------------
| Esta variable contendra los ajustes necesarios para mostrar un mensaje estatico.
| -------------------------------------------------------------------
| EXPLICACION DE VALORES
| -------------------------------------------------------------------
|
|	['msgs'] = false <No mostrara la pagina estatica>
|	['msgs'] = 1 <Mostrara la pagina estatica con descripcion breve para visitantes/usuarios y detalles para moderadores/administradores>
|	['msgs'] = 2 <Mostrara la pagina estatica con detalles para todos>
*/
$display['msgs'] = 1;