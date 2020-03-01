<?php
/*
ESTOS SON LOS MODS QUE SE INSTALARÁN
*/
$collection = array(); 
$c_collection = array();

$collection = add_query('Categorías padre', $collection,
'CREATE TABLE IF NOT EXISTS `p_hcats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT \'\',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;');
$c_collection = add_check_query('Categorías padre', $c_collection, array('table', 'p_hcats'));

$collection = add_query('Categorías padre', $collection, 'ALTER TABLE `p_categorias` ADD `c_hcat` INT(11) NOT NULL DEFAULT \'0\'');
$c_collection = add_check_query('Categorías padre', $c_collection,
    array('fields','p_categorias',
        array(
            array('c_hcat', 'ADD'),
        )
    )
);

$collection = add_query('Chat', $collection,'
CREATE TABLE IF NOT EXISTS `c_chat_messages` (
  `msg_id` int(12) NOT NULL AUTO_INCREMENT,
  `msg_user` int(12) NOT NULL DEFAULT \'0\',
  `msg_text` text NOT NULL DEFAULT \'\',
  `msg_date` int(12) NOT NULL DEFAULT \'0\',
  PRIMARY KEY (`msg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1');
$c_collection = add_check_query('Eventos', $c_collection, array('table', 'c_chat_messages'));

$collection = add_query('Chat', $collection,'
CREATE TABLE IF NOT EXISTS `c_chat_blacklist` (
`ban_id` int(12) NOT NULL AUTO_INCREMENT,
  `ban_user` int(12) NOT NULL DEFAULT \'0\',
  `ban_expire` int(12) NOT NULL DEFAULT \'0\',
  `ban_date` int(12) NOT NULL DEFAULT \'0\',
  PRIMARY KEY (`ban_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1');
$c_collection = add_check_query('Chat', $c_collection, array('table', 'c_chat_blacklist'));

$collection = add_query('Chat', $collection, 'ALTER TABLE `u_miembros` ADD `user_chat` int(12) NOT NULL');
$c_collection = add_check_query('Chat', $c_collection,
    array('fields','u_miembros',
        array(
            array('user_chat','ADD'),
        )
    )
);

$collection = add_query('Categorías', $collection, 'ALTER TABLE `p_categorias` ADD `c_fa` VARCHAR(80) NOT NULL DEFAULT \'feather\'');
$collection = add_query('Categorías', $collection, 'ALTER TABLE `p_categorias` ADD `c_color` VARCHAR(80) NOT NULL DEFAULT \'353535\'');
$collection = add_query('Categorías', $collection, 'ALTER TABLE `p_categorias` ADD `c_desc` int(11) NOT NULL DEFAULT 0');
$c_collection = add_check_query('Categorías', $c_collection,
    array('fields','p_categorias',
        array(
            array('c_fa', 'ADD'),
            array('c_color', 'ADD'),
            array('c_desc', 'ADD'),
        )
    )
);
$collection = add_query('Mejor comentario', $collection, 'ALTER TABLE `p_comentarios` ADD `mejor_comentario` int( 2 ) NOT NULL');
$c_collection = add_check_query('Mejor comentario', $c_collection,
    array('fields', 'p_comentarios',
        array(
            array('mejor_comentario', 'ADD'),
        )
    )
);
# =========== CONFIGURACIONES ========== #
$collection = add_query('Configuracion', $collection, 'ALTER TABLE `w_configuracion` ADD `codes` int(1) NOT NULL DEFAULT \'3\'');
$collection = add_query('Configuracion', $collection, 'ALTER TABLE `w_configuracion` ADD `codes` varchar(10) NOT NULL DEFAULT \'es\'');
$collection = add_query('Configuracion', $collection, 'ALTER TABLE `w_configuracion` ADD `c_recaptcha` int(1) NOT NULL DEFAULT \'0\'');
$collection = add_query('Configuracion', $collection, 'ALTER TABLE `w_configuracion` ADD `pkey` varchar(55) NOT NULL DEFAULT \'\'');
$collection = add_query('Configuracion', $collection, 'ALTER TABLE `w_configuracion` ADD `skey` varchar(55) NOT NULL DEFAULT \'\'');
$collection = add_query('Configuracion', $collection, 'ALTER TABLE `w_configuracion` ADD `pkey3` varchar(55) NOT NULL DEFAULT \'\'');
$collection = add_query('Configuracion', $collection, 'ALTER TABLE `w_configuracion` ADD `skey3` varchar(55) NOT NULL DEFAULT \'\'');
$c_collection = add_check_query('Configuracion', $c_collection,
    array('fields','w_configuracion',
        array(
            array('codes', 'ADD'),
            array('idioma', 'ADD'),
            array('c_recaptcha', 'ADD'),
            array('pkey', 'ADD'),
            array('skey', 'ADD'),
            array('pkey3', 'ADD'),
            array('skey3', 'ADD'),
        )
    )
);

# =========== MOD PERFIL PORTADA ========== #
$collection = add_query('Perfil', $collection, 'ALTER TABLE `u_perfil` ADD `p_cabecera` varchar(300) NOT NULL DEFAULT \'\'');
$collection = add_query('Perfil', $collection, 'ALTER TABLE `u_perfil` ADD `p_idioma` varchar(10) NOT NULL DEFAULT \'es\'');
$c_collection = add_check_query('Perfil', $c_collection,
    array('fields','u_perfil',
        array(
            array('p_cabecera', 'ADD'),
            array('p_idioma', 'ADD'),
        )
    )
);

//Agregamos la fecha de la actualizaci&oacute;n
$collection = add_query('Estadisticas Instalación', $collection, 'UPDATE w_stats SET stats_time_upgrade = \''.time().'\' WHERE stats_no = \'1\'');

function update_fundacion_time() {
    //Obtenemos la fecha del registro del primer usuario para asignarla a la fecha de la fundación de la comunidad.
    $query = @mysql_query('SELECT user_registro FROM u_miembros WHERE user_id = \'1\'');
    if ($query) {
        $fundacion = mysql_fetch_assoc($query);
        if ( ! $fundacion) {
            throw new Exception('No se pudieron obtener los datos del usuario.', 1);
            return FALSE;
        }
        $rst = @mysql_query('UPDATE w_stats SET stats_time_foundation = \''.$fundacion['user_registro'].'\' WHERE stats_no = \'1\'');
        if ( ! $rst) {
            throw new Exception(mysql_errno().': '.mysql_error(), mysql_errno());
            return FALSE;
        } else {
            return TRUE;
        }
    } else {
        throw new Exception(mysql_errno().': '.mysql_error(), mysql_errno());
        return FALSE;
    }
}


return array($collection, $c_collection);
