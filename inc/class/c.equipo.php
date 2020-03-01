<?php if (!defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Modelo para la adminitraciÃ³n
 *
 * @name    c.admin.php
 * @author  PHPost Team
 */
class tsAdmin {
 
    /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    // ADMINISTRAR \\
    /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    /*
        getAdmins()
    */
    function getAdmins($type = NULL) {
        //
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT u.user_puntos, u.user_name, u.user_id, u.user_posts, r.r_name, r.r_color, r.r_image FROM u_miembros AS u LEFT JOIN u_rangos AS r ON u.user_rango = r.rango_id WHERE user_rango = 1 ORDER BY user_id');
        //
        $data = result_array($query);
        //
        return $data;
    }
 
    function getMods($type = NULL) { 
        //
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT u.user_puntos, u.user_name, u.user_id, u.user_posts, r.r_name, r.r_color, r.r_image FROM u_miembros AS u LEFT JOIN u_rangos AS r ON u.user_rango = r.rango_id WHERE user_rango = 2 ORDER BY user_id');
        //
        $data = result_array($query);
        //
        return $data;
    }
    
    function getBetas($type = NULL) {
        //
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT u.user_puntos, u.user_name, u.user_id, u.user_posts, r.r_name, r.r_color, r.r_image FROM u_miembros AS u LEFT JOIN u_rangos AS r ON u.user_rango = r.rango_id WHERE user_rango = \'11\' ORDER BY user_id');
        //
        $data = result_array($query);
        //
        return $data;
    }
 
 
 
    /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
 
}
