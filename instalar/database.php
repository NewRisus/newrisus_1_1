<?php
/**
 * @name database.php
 * @author PHPost Team
 * @copyright 2011-2018
 */

$phpos_sql['f_comentarios'] = "CREATE TABLE IF NOT EXISTS `f_comentarios` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `c_foto_id` int(11) NOT NULL DEFAULT 0,
  `c_user` int(11) NOT NULL DEFAULT 0,
  `c_date` int(10) NOT NULL DEFAULT 0,
  `c_body` text NOT NULL DEFAULT '',
  `c_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['w_visitas'] = "CREATE TABLE IF NOT EXISTS `w_visitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT 0,
  `for` int(11) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;";

$phpos_sql['f_fotos'] = "
CREATE TABLE IF NOT EXISTS `f_fotos` (
  `foto_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_title` varchar(40) NOT NULL DEFAULT '',
  `f_date` int(10) NOT NULL DEFAULT 0,
  `f_description` text NOT NULL DEFAULT '',
  `f_url` varchar(200) NOT NULL DEFAULT '',
  `f_user` int(11) NOT NULL DEFAULT 0,
  `f_closed` int(1) NOT NULL DEFAULT 0,
  `f_visitas` int(1) NOT NULL DEFAULT 0,
  `f_votos_pos` int(3) NOT NULL DEFAULT 0,
  `f_votos_neg` int(3) NOT NULL DEFAULT 0,
  `f_status` int(1) NOT NULL DEFAULT 0,
  `f_last` int(1) NOT NULL DEFAULT 0,
  `f_hits` int(11) NOT NULL DEFAULT 0,
  `f_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`foto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['f_votos'] = "
CREATE TABLE IF NOT EXISTS `f_votos` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `v_foto_id` int(11) NOT NULL DEFAULT 0,
  `v_user` int(11) NOT NULL DEFAULT 0,
  `v_type` int(1) NOT NULL DEFAULT 0,
  `v_date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['p_borradores'] = "
CREATE TABLE IF NOT EXISTS `p_borradores` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `b_user` int(11) NOT NULL DEFAULT 0,
  `b_date` int(10) NOT NULL DEFAULT 0,
  `b_title` varchar(60) NOT NULL DEFAULT '',
  `b_body` text,
  `b_tags` varchar(128) DEFAULT NULL,
  `b_category` int(4) NOT NULL DEFAULT 0,
  `b_private` int(1) NOT NULL DEFAULT 0,
  `b_block_comments` int(1) NOT NULL DEFAULT 0,
  `b_sponsored` int(1) NOT NULL DEFAULT 0,
  `b_sticky` int(1) NOT NULL DEFAULT 0,
  `b_smileys` int(1) NOT NULL DEFAULT 0,
  `b_visitantes` int(1) NOT NULL DEFAULT 0,
  `b_post_id` int(11) NOT NULL DEFAULT 0,
  `b_status` int(1) NOT NULL DEFAULT '1',
  `b_causa` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['p_categorias'] = "
CREATE TABLE IF NOT EXISTS `p_categorias` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `c_hcat` INT(11) NOT NULL DEFAULT 0,
  `c_orden` int(11) NOT NULL DEFAULT 0,
  `c_nombre` varchar(32) NOT NULL DEFAULT '',
  `c_seo` varchar(32) NOT NULL DEFAULT '',
  `c_img` varchar(32) NOT NULL DEFAULT 'comments.png',
  `c_fa` VARCHAR(80) NOT NULL DEFAULT 'feather',
  `c_color` VARCHAR(6) NOT NULL DEFAULT '212121',
  `c_desc` varchar(132) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;";

$phpos_sql['pv_categorias'] = "
INSERT INTO `p_categorias` (`cid`, `c_hcat`, `c_orden`, `c_nombre`, `c_seo`, `c_img`, `c_fa`, `c_color`, `c_desc`) VALUES
(1, 0, 1, 'Animaciones', 'animaciones', 'flash.png', 'feather', '212121', 'Descripción aquí'),
(2, 0, 2, 'Apuntes y Monografías', 'apuntesymonografias', 'report.png', 'feather', '212121', 'Descripción aquí'),
(3, 0, 3, 'Arte', 'arte', 'palette.png', 'feather', '212121', 'Descripción aquí'),
(4, 0, 4, 'Autos y Motos', 'autosymotos', 'car.png', 'feather', '212121', 'Descripción aquí'),
(5, 0, 5, 'Celulares', 'celulares', 'phone.png', 'feather', '212121', 'Descripción aquí'),
(6, 0, 6, 'Ciencia y Educación', 'cienciayeducacion', 'lab.png', 'feather', '212121', 'Descripción aquí'),
(7, 0, 7, 'Comics', 'comics', 'comic.png', 'feather', '212121', 'Descripción aquí'),
(8, 0, 8, 'Deportes', 'deportes', 'sport.png', 'feather', '212121', 'Descripción aquí'),
(9, 0, 9, 'Downloads', 'downloads', 'disk.png', 'feather', '212121', 'Descripción aquí'),
(10, 0, 10, 'E-books y Tutoriales', 'ebooksytutoriales', 'ebook.png', 'feather', '212121', 'Descripción aquí'),
(11, 0, 11, 'Ecología', 'ecologia', 'nature.png', 'feather', '212121', 'Descripción aquí'),
(12, 0, 12, 'Economía y Negocios', 'economiaynegocios', 'economy.png', 'feather', '212121', 'Descripción aquí'),
(13, 0, 13, 'Femme', 'femme', 'female.png', 'feather', '212121', 'Descripción aquí'),
(14, 0, 14, 'Hazlo tu mismo', 'hazlotumismo', 'escuadra.png', 'feather', '212121', 'Descripción aquí'),
(15, 0, 15, 'Humor', 'humor', 'humor.png', 'feather', '212121', 'Descripción aquí'),
(16, 0, 16, 'Imágenes', 'imagenes', 'photo.png', 'feather', '212121', 'Descripción aquí'),
(17, 0, 17, 'Info', 'info', 'book.png', 'feather', '212121', 'Descripción aquí'),
(18, 0, 18, 'Juegos', 'juegos', 'controller.png', 'feather', '212121', 'Descripción aquí'),
(19, 0, 19, 'Links', 'links', 'link.png', 'feather', '212121', 'Descripción aquí'),
(20, 0, 20, 'Linux', 'linux', 'tux.png', 'feather', '212121', 'Descripción aquí'),
(21, 0, 21, 'Mac', 'mac', 'mac.png', 'feather', '212121', 'Descripción aquí'),
(22, 0, 22, 'Manga y Anime', 'mangayanime', 'manga.png', 'feather', '212121', 'Descripción aquí'),
(23, 0, 23, 'Mascotas', 'mascotas', 'pet.png', 'feather', '212121', 'Descripción aquí'),
(24, 0, 24, 'Música', 'musica', 'music.png', 'feather', '212121', 'Descripción aquí'),
(25, 0, 25, 'Noticias', 'noticias', 'newspaper.png', 'feather', '212121', 'Descripción aquí'),
(26, 0, 26, 'Off Topic', 'offtopic', 'comments.png', 'feather', '212121', 'Descripción aquí'),
(27, 0, 27, 'Recetas y Cocina', 'recetasycocina', 'cake.png', 'feather', '212121', 'Descripción aquí'),
(28, 0, 28, 'Salud y Bienestar', 'saludybienestar', 'heart.png', 'feather', '212121', 'Descripción aquí'),
(29, 0, 29, 'Solidaridad', 'solidaridad', 'salva.png', 'feather', '212121', 'Descripción aquí'),
(30, 0, 30, 'Taringa!', 'taringa', 'tscript.png', 'feather', '212121', 'Descripción aquí'),
(31, 0, 31, 'Turismo', 'turismo', 'brujula.png', 'feather', '212121', 'Descripción aquí'),
(32, 0, 32, 'TV, Peliculas y series', 'tvpeliculasyseries', 'tv.png', 'feather', '212121', 'Descripción aquí'),
(33, 0, 33, 'Videos On-line', 'videosonline', 'film.png', 'feather', '212121', 'Descripción aquí');";

$phpos_sql['p_hcats'] = "
CREATE TABLE IF NOT EXISTS `p_hcats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;";

$phpos_sql['c_chat_messages'] = "
CREATE TABLE IF NOT EXISTS `c_chat_messages` (
`msg_id` int(12) NOT NULL AUTO_INCREMENT,
  `msg_user` int(12) NOT NULL DEFAULT 0,
  `msg_text` text NOT NULL DEFAULT '',
  `msg_date` int(12) NOT NULL DEFAULT 0,
  PRIMARY KEY (`msg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['c_chat_blacklist'] = "
CREATE TABLE IF NOT EXISTS `c_chat_blacklist` (
`ban_id` int(12) NOT NULL AUTO_INCREMENT,
  `ban_user` int(12) NOT NULL DEFAULT 0,
  `ban_expire` int(12) NOT NULL DEFAULT 0,
  `ban_date` int(12) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ban_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['p_comentarios'] = "
CREATE TABLE IF NOT EXISTS `p_comentarios` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `c_post_id` int(11) NOT NULL DEFAULT 0,
  `c_user` int(11) NOT NULL DEFAULT 0,
  `c_date` int(10) NOT NULL DEFAULT 0,
  `c_body` text NOT NULL DEFAULT '',
  `c_votos` int(3) NOT NULL DEFAULT 0,
  `c_status` ENUM(  '0',  '1' ) NOT NULL DEFAULT  '0',
  `c_ip` varchar(15) NOT NULL DEFAULT '',
  `mejor_comentario` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['p_favoritos'] = "
CREATE TABLE IF NOT EXISTS `p_favoritos` (
  `fav_id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_user` int(11) NOT NULL DEFAULT 0,
  `fav_post_id` int(11) NOT NULL DEFAULT 0,
  `fav_date` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fav_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['p_posts'] = "
CREATE TABLE IF NOT EXISTS `p_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_user` int(11) NOT NULL DEFAULT 0,
  `post_category` int(4) NOT NULL DEFAULT 0,
  `post_title` varchar(60) NOT NULL DEFAULT '',
  `post_body` text NOT NULL DEFAULT '',
  `post_date` int(10) NOT NULL DEFAULT 0,
  `post_tags` varchar(128) NOT NULL DEFAULT '',
  `post_puntos` int(11) unsigned NOT NULL DEFAULT '0',
  `post_comments` int(11) NOT NULL DEFAULT 0,
  `post_seguidores` int(11) NOT NULL DEFAULT 0,
  `post_shared` int(11) NOT NULL DEFAULT 0,
  `post_favoritos` int(11) NOT NULL DEFAULT 0,
  `post_cache` int(10) NOT NULL DEFAULT 0,
  `post_hits` int(11) NOT NULL DEFAULT 0,
  `post_ip` varchar(15) NOT NULL DEFAULT '',
  `post_private` int(1) NOT NULL DEFAULT 0,
  `post_block_comments` int(1) NOT NULL DEFAULT 0,
  `post_sponsored` int(1) NOT NULL DEFAULT 0,
  `post_sticky` int(1) NOT NULL DEFAULT 0,
  `post_smileys` int(1) NOT NULL DEFAULT 0,
  `post_visitantes` int(1) NOT NULL DEFAULT 0,
  `post_status` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;";

$phpos_sql['pv_posts'] = "
INSERT INTO `p_posts` (`post_id`, `post_user`, `post_category`, `post_title`, `post_body`, `post_date`, `post_tags`, `post_puntos`, `post_hits`,  `post_private`, `post_block_comments`, `post_sponsored`, `post_sticky`, `post_status`) VALUES
(1, 1, 30, 'Bienvenido a New Risus', '[align=center][size=18]Este es el primer post de los miles que tendrá tu web  ;)  \r\n\r\nGracias por elegir a [url=http://www.phpost.net]PHPost[/url] como tu Link Sharing System.[/size][/align]', 0, 'NewRisus, Risus, 1.3.0.0, Phpost!', 0, 0, 0, 0, 0, 0, 0);";

$phpos_sql['p_votos'] = "
CREATE TABLE IF NOT EXISTS `p_votos` (
  `voto_id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL DEFAULT 0,
  `tuser` int(11) NOT NULL DEFAULT 0,
  `cant` int(11) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT '1',
  `date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`voto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_actividad'] = "
CREATE TABLE IF NOT EXISTS `u_actividad` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `obj_uno` int(11) NOT NULL DEFAULT 0,
  `obj_dos` int(11) NOT NULL DEFAULT 0,
  `ac_type` int(2) NOT NULL DEFAULT 0,
  `ac_date` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ac_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_avisos'] = "
CREATE TABLE IF NOT EXISTS `u_avisos` (
  `av_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `av_subject` varchar(24) NOT NULL DEFAULT '',
  `av_body` text NOT NULL DEFAULT '',
  `av_date` int(10) NOT NULL DEFAULT 0,
  `av_read` int(1) NOT NULL DEFAULT 0,
  `av_type` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`av_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_bloqueos'] = "
CREATE TABLE IF NOT EXISTS `u_bloqueos` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `b_user` int(11) NOT NULL DEFAULT 0,
  `b_auser` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_follows'] = "
CREATE TABLE IF NOT EXISTS `u_follows` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_user` int(11) NOT NULL DEFAULT 0,
  `f_id` int(11) NOT NULL DEFAULT 0,
  `f_type` int(1) NOT NULL DEFAULT 0,
  `f_date` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`follow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_mensajes'] = "
CREATE TABLE IF NOT EXISTS `u_mensajes` (
  `mp_id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_to` int(11) NOT NULL DEFAULT 0,
  `mp_from` int(11) NOT NULL DEFAULT 0,
  `mp_answer` int(1) NOT NULL DEFAULT 0,
  `mp_read_to` int(1) NOT NULL DEFAULT 0,
  `mp_read_from` int(1) NOT NULL DEFAULT '1',
  `mp_read_mon_to` int(1) NOT NULL DEFAULT 0,
  `mp_read_mon_from` int(1) NOT NULL DEFAULT '1',
  `mp_del_to` int(1) NOT NULL DEFAULT 0,
  `mp_del_from` int(1) NOT NULL DEFAULT 0,
  `mp_subject` varchar(50) NOT NULL DEFAULT '',
  `mp_preview` varchar(75) NOT NULL DEFAULT '',
  `mp_date` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_miembros'] = "
CREATE TABLE IF NOT EXISTS `u_miembros` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(16) NOT NULL DEFAULT '',
  `user_password` varchar(32) NOT NULL DEFAULT '',
  `user_email` varchar(35) NOT NULL DEFAULT '',
  `user_rango` int(3) NOT NULL DEFAULT '3',
  `user_puntos` int(6) unsigned NOT NULL DEFAULT '0',
  `user_posts` int(11) NOT NULL DEFAULT 0,
  `user_comentarios` int(11) NOT NULL DEFAULT 0,
  `user_seguidores` int(11) NOT NULL DEFAULT 0,
  `user_cache` int(10) NOT NULL DEFAULT 0,
  `user_puntosxdar` int(2) unsigned NOT NULL DEFAULT '0',
  `user_bad_hits` int(2) unsigned NOT NULL DEFAULT '0',
  `user_nextpuntos` int(10) NOT NULL DEFAULT 0,
  `user_registro` int(10) NOT NULL DEFAULT 0,
  `user_lastlogin` int(10) NOT NULL DEFAULT 0,
  `user_lastactive` int(10) NOT NULL DEFAULT 0,
  `user_lastpost` int(10) NOT NULL DEFAULT 0,
  `user_last_ip` varchar(15) NOT NULL DEFAULT '0',
  `user_name_changes` int(11) NOT NULL DEFAULT '3',
  `user_activo` int(1) NOT NULL DEFAULT 0,
  `user_baneado` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_nicks'] = "
CREATE TABLE IF NOT EXISTS `u_nicks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_email` varchar(50) NOT NULL DEFAULT '',
  `name_1` varchar(15) NOT NULL DEFAULT '',
  `name_2` varchar(15) NOT NULL DEFAULT '',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `estado` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;";

$phpos_sql['u_monitor'] = "
CREATE TABLE IF NOT EXISTS `u_monitor` (
  `not_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `obj_user` int(11) NOT NULL DEFAULT 0,
  `obj_uno` int(11) NOT NULL DEFAULT 0,
  `obj_dos` int(11) NOT NULL DEFAULT 0,
  `obj_tres` int(11) NOT NULL DEFAULT 0,
  `not_type` int(2) NOT NULL DEFAULT 0,
  `not_date` int(10) NOT NULL DEFAULT 0,
  `not_total` int(2) NOT NULL DEFAULT '1',
  `not_menubar` int(1) NOT NULL DEFAULT '2',
  `not_monitor` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`not_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_muro'] = "
CREATE TABLE IF NOT EXISTS `u_muro` (
  `pub_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_user` int(11) NOT NULL DEFAULT 0,
  `p_user_pub` int(11) NOT NULL DEFAULT 0,
  `p_date` int(10) NOT NULL DEFAULT 0,
  `p_comments` int(4) NOT NULL DEFAULT 0,
  `p_body` text NOT NULL DEFAULT '',
  `p_likes` int(4) NOT NULL DEFAULT 0,
  `p_type` int(1) NOT NULL DEFAULT 0,
  `p_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`pub_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_muro_adjuntos'] = "
CREATE TABLE IF NOT EXISTS `u_muro_adjuntos` (
  `adj_id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_id` int(11) NOT NULL DEFAULT 0,
  `a_title` varchar(100) NOT NULL DEFAULT '',
  `a_url` text NOT NULL DEFAULT '',
  `a_img` text NOT NULL DEFAULT '',
  `a_desc` text NOT NULL DEFAULT '',
  PRIMARY KEY (`adj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_muro_comentarios'] = "
CREATE TABLE IF NOT EXISTS `u_muro_comentarios` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pub_id` int(11) NOT NULL DEFAULT 0,
  `c_user` int(11) NOT NULL DEFAULT 0,
  `c_date` int(10) NOT NULL DEFAULT 0,
  `c_body` text NOT NULL DEFAULT '',
  `c_likes` int(4) NOT NULL DEFAULT 0,
  `c_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_muro_likes'] = "
CREATE TABLE IF NOT EXISTS `u_muro_likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `obj_id` int(11) NOT NULL DEFAULT 0,
  `obj_type` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`like_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_perfil'] = "
CREATE TABLE IF NOT EXISTS `u_perfil` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_dia` int(2) NOT NULL DEFAULT 0,
  `user_mes` int(2) NOT NULL DEFAULT 0,
  `user_ano` int(4) NOT NULL DEFAULT 0,
  `user_pais` varchar(2) NOT NULL DEFAULT '',
  `user_estado` int(2) NOT NULL DEFAULT '1',
  `user_sexo` int(1) NOT NULL DEFAULT '1',
  `user_firma` text NOT NULL DEFAULT '',
  `p_cabecera` varchar(300) NOT NULL DEFAULT '',
  `p_idioma` varchar(10) NOT NULL DEFAULT 'es',
  `p_nombre` varchar(32) NOT NULL DEFAULT '',
  `p_avatar` int(1) NOT NULL DEFAULT 0,
  `p_mensaje` varchar(60) NOT NULL DEFAULT '',
  `p_sitio` varchar(60) NOT NULL DEFAULT '',
  `p_socials` text NOT NULL DEFAULT '',
  `p_gustos` varchar(71) NOT NULL DEFAULT 'a:5:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;}',
  `p_estado` int(1) NOT NULL DEFAULT 0,
  `p_hijos` int(1) NOT NULL DEFAULT 0,
  `p_vivo` int(1) NOT NULL DEFAULT 0,
  `p_altura` int(3) NOT NULL DEFAULT 0,
  `p_peso` int(3) NOT NULL DEFAULT 0,
  `p_pelo` int(1) NOT NULL DEFAULT 0,
  `p_ojos` int(1) NOT NULL DEFAULT 0,
  `p_fisico` int(1) NOT NULL DEFAULT 0,
  `p_dieta` int(1) NOT NULL DEFAULT 0,
  `p_tengo` varchar(60) NOT NULL DEFAULT 'a:2:{i:0;i:0;i:1;i:0;}',
  `p_fumo` int(1) NOT NULL DEFAULT 0,
  `p_tomo` int(1) NOT NULL DEFAULT 0,
  `p_estudios` int(1) NOT NULL DEFAULT 0,
  `p_idiomas` varchar(102) NOT NULL DEFAULT 'a:7:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;}',
  `p_profesion` varchar(32) NOT NULL DEFAULT '',
  `p_empresa` varchar(32) NOT NULL DEFAULT '',
  `p_sector` int(2) NOT NULL DEFAULT 0,
  `p_ingresos` int(1) NOT NULL DEFAULT 0,
  `p_int_prof` text NOT NULL DEFAULT '',
  `p_hab_prof` text NOT NULL DEFAULT '',
  `p_intereses` text NOT NULL DEFAULT '',
  `p_hobbies` text NOT NULL DEFAULT '',
  `p_tv` text NOT NULL DEFAULT '',
  `p_musica` text NOT NULL DEFAULT '',
  `p_deportes` text NOT NULL DEFAULT '',
  `p_libros` text NOT NULL DEFAULT '',
  `p_peliculas` text NOT NULL DEFAULT '',
  `p_comida` text NOT NULL DEFAULT '',
  `p_heroes` text NOT NULL DEFAULT '',
  `p_configs` varchar(100) NOT NULL DEFAULT 'a:3:{s:1:\"m\";s:1:\"5\";s:2:\"mf\";i:5;s:3:\"rmp\";s:1:\"5\";}',
  `p_total` varchar(54) NOT NULL DEFAULT 'a:6:{i:0;i:5;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;}',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;";

$phpos_sql['u_portal'] = "
CREATE TABLE IF NOT EXISTS `u_portal` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `last_posts_visited` text NOT NULL DEFAULT '',
  `last_posts_shared` text NOT NULL DEFAULT '',
  `last_posts_cats` text NOT NULL DEFAULT '',
  `c_monitor` text NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;";

$phpos_sql['u_rangos'] = "
CREATE TABLE IF NOT EXISTS `u_rangos` (
  `rango_id` int(3) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(32) NOT NULL DEFAULT '',
  `r_color` varchar(6) NOT NULL DEFAULT '171717',
  `r_image` varchar(32) NOT NULL DEFAULT 'new.png',
  `r_cant` int(5) NOT NULL DEFAULT 0,
  `r_allows` varchar(1000) NOT NULL DEFAULT '',
  `r_type` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rango_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;";

$phpos_sql['uv_rangos'] = "
INSERT INTO `u_rangos` (`rango_id`, `r_name`, `r_color`, `r_image`, `r_cant`, `r_allows`, `r_type`) VALUES
(1, 'Administrador', 'D6030B', 'rosette.png', 0, 'a:4:{s:4:\"suad\";s:2:\"on\";s:4:\"goaf\";s:1:\"5\";s:5:\"gopfp\";s:2:\"20\";s:5:\"gopfd\";s:2:\"50\";}', 0),
(2, 'Moderador', 'ff9900', 'shield.png', 0, 'a:4:{s:4:\"sumo\";s:2:\"on\";s:4:\"goaf\";s:2:\"15\";s:5:\"gopfp\";s:2:\"18\";s:5:\"gopfd\";s:2:\"30\";}', 0),
(3, 'Novato', '171717', 'new.png', 0, 'a:12:{s:4:\"godp\";s:2:\"on\";s:4:\"gopp\";s:2:\"on\";s:5:\"gopcp\";s:2:\"on\";s:5:\"govpp\";s:2:\"on\";s:5:\"govpn\";s:2:\"on\";s:5:\"goepc\";s:2:\"on\";s:5:\"godpc\";s:2:\"on\";s:4:\"gopf\";s:2:\"on\";s:5:\"gopcf\";s:2:\"on\";s:4:\"goaf\";s:2:\"20\";s:5:\"gopfp\";s:1:\"5\";s:5:\"gopfd\";s:1:\"5\";}', 0),
(4, 'New Full User', '0198E7', 'star_bronze_3.png', 50, 'a:12:{s:4:\"godp\";s:2:\"on\";s:4:\"gopp\";s:2:\"on\";s:5:\"gopcp\";s:2:\"on\";s:5:\"govpp\";s:2:\"on\";s:5:\"govpn\";s:2:\"on\";s:5:\"goepc\";s:2:\"on\";s:5:\"godpc\";s:2:\"on\";s:4:\"gopf\";s:2:\"on\";s:5:\"gopcf\";s:2:\"on\";s:4:\"goaf\";s:2:\"20\";s:5:\"gopfp\";s:2:\"10\";s:5:\"gopfd\";s:2:\"10\";}', 1),
(5, 'Full User', '00ccff', 'star_silver_3.png', 70, 'a:12:{s:4:\"godp\";s:2:\"on\";s:4:\"gopp\";s:2:\"on\";s:5:\"gopcp\";s:2:\"on\";s:5:\"govpp\";s:2:\"on\";s:5:\"govpn\";s:2:\"on\";s:5:\"goepc\";s:2:\"on\";s:5:\"godpc\";s:2:\"on\";s:4:\"gopf\";s:2:\"on\";s:5:\"gopcf\";s:2:\"on\";s:4:\"goaf\";s:2:\"20\";s:5:\"gopfp\";s:2:\"12\";s:5:\"gopfd\";s:2:\"20\";}', 1),
(6, 'Great User', '01A021', 'star_gold_3.png', 0, 'a:12:{s:4:\"godp\";s:2:\"on\";s:4:\"gopp\";s:2:\"on\";s:5:\"gopcp\";s:2:\"on\";s:5:\"govpp\";s:2:\"on\";s:5:\"govpn\";s:2:\"on\";s:5:\"goepc\";s:2:\"on\";s:5:\"godpc\";s:2:\"on\";s:4:\"gopf\";s:2:\"on\";s:5:\"gopcf\";s:2:\"on\";s:4:\"goaf\";s:2:\"20\";s:5:\"gopfp\";s:2:\"11\";s:5:\"gopfd\";s:2:\"15\";}', 0),
(7, 'Gold User', 'cc6600', 'asterisk_yellow.png', 120, 'a:12:{s:4:\"godp\";s:2:\"on\";s:4:\"gopp\";s:2:\"on\";s:5:\"gopcp\";s:2:\"on\";s:5:\"govpp\";s:2:\"on\";s:5:\"govpn\";s:2:\"on\";s:5:\"goepc\";s:2:\"on\";s:5:\"godpc\";s:2:\"on\";s:4:\"gopf\";s:2:\"on\";s:5:\"gopcf\";s:2:\"on\";s:4:\"goaf\";s:2:\"20\";s:5:\"gopfp\";s:2:\"12\";s:5:\"gopfd\";s:2:\"25\";}', 1);";

$phpos_sql['u_respuestas'] = "
CREATE TABLE IF NOT EXISTS `u_respuestas` (
  `mr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_id` int(11) NOT NULL DEFAULT 0,
  `mr_from` int(11) NOT NULL DEFAULT 0,
  `mr_body` text NOT NULL DEFAULT '',
  `mr_ip` varchar(15) NOT NULL DEFAULT '',
  `mr_date` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['u_sessions'] = "
CREATE TABLE IF NOT EXISTS `u_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `session_ip` varchar(40) NOT NULL DEFAULT '',
  `session_time` int(10) unsigned NOT NULL DEFAULT '0',
  `session_autologin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`session_id`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_time` (`session_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;";

$phpos_sql['u_suspension'] = "
CREATE TABLE IF NOT EXISTS `u_suspension` (
  `susp_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `susp_causa` text NOT NULL DEFAULT '',
  `susp_date` int(10) NOT NULL DEFAULT 0,
  `susp_termina` int(10) NOT NULL DEFAULT 0,
  `susp_mod` int(11) NOT NULL DEFAULT 0,
  `susp_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`susp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['w_afiliados'] = "
CREATE TABLE IF NOT EXISTS `w_afiliados` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `a_titulo` varchar(35) NOT NULL DEFAULT '',
  `a_url` varchar(40) NOT NULL DEFAULT '',
  `a_banner` varchar(100) NOT NULL DEFAULT '',
  `a_descripcion` varchar(200) NOT NULL DEFAULT '',
  `a_sid` int(11) NOT NULL DEFAULT 0,
  `a_hits_in` int(11) NOT NULL DEFAULT 0,
  `a_hits_out` int(11) NOT NULL DEFAULT 0,
  `a_date` int(10) NOT NULL DEFAULT 0,
  `a_active` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['w_configuracion'] = "
CREATE TABLE IF NOT EXISTS `w_configuracion` (
  `tscript_id` int(11) NOT NULL DEFAULT 0,
  `titulo` varchar(24) NOT NULL DEFAULT '',
  `slogan` varchar(32) NOT NULL DEFAULT '',
  `favicon` varchar(100) NOT NULL DEFAULT '0',
  `url` tinytext NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `banner` varchar(100) NOT NULL DEFAULT '',
  `tema_id` int(11) NOT NULL DEFAULT 0,
  `ads_300` text NOT NULL DEFAULT '',
  `ads_468` text NOT NULL DEFAULT '',
  `ads_160` text NOT NULL DEFAULT '',
  `ads_728` text NOT NULL DEFAULT '',
  `ads_search` varchar(50) NOT NULL DEFAULT '',
  `chat_id` varchar(20) NOT NULL DEFAULT '',
  `xat_id` varchar(20) NOT NULL DEFAULT '',
  `c_last_active` int(2) NOT NULL DEFAULT 0,
  `c_allow_sess_ip` int(1) NOT NULL DEFAULT 0,
  `c_count_guests` int(1) NOT NULL DEFAULT 0,
  `c_reg_active` int(1) NOT NULL DEFAULT 0,
  `c_reg_activate` int(1) NOT NULL DEFAULT 0,
  `c_reg_rango` int(5) NOT NULL DEFAULT 0,
  `c_met_welcome` int(1) NOT NULL DEFAULT 0,
  `c_message_welcome` varchar(500) NOT NULL DEFAULT '',
  `c_fotos_private` int(11) NOT NULL DEFAULT 0,
  `c_hits_guest` int(1) NOT NULL DEFAULT 0,
  `c_keep_points` int(1) NOT NULL DEFAULT 0,
  `c_allow_points` int(11) NOT NULL DEFAULT 0,
  `c_allow_edad` int(11) NOT NULL DEFAULT 0,
  `c_max_posts` int(2) NOT NULL DEFAULT 0,
  `c_max_com` int(3) NOT NULL DEFAULT 0,
  `c_max_nots` int(3) NOT NULL DEFAULT 0,
  `c_max_acts` int(3) NOT NULL DEFAULT 0,
  `c_newr_type` int(11) NOT NULL DEFAULT 0,
  `c_allow_sump` int(11) NOT NULL DEFAULT 0,
  `c_allow_firma` int(1) NOT NULL DEFAULT 0,
  `c_allow_upload` int(1) NOT NULL DEFAULT 0,
  `c_allow_portal` int(1) NOT NULL DEFAULT 0,
  `c_allow_live` int(1) NOT NULL DEFAULT 0,
  `c_see_mod` int(1) NOT NULL DEFAULT 0,
  `c_stats_cache` int(7) NOT NULL DEFAULT '15',
  `c_desapprove_post` int(1) NOT NULL DEFAULT 0,
  `offline` int(1) NOT NULL DEFAULT 0,
  `offline_message` varchar(255) NOT NULL DEFAULT '',
  `codes` int(1) NOT NULL DEFAULT 3,
  `c_recaptcha` int(1) NOT NULL DEFAULT 0,
  `pkey` varchar(55) NOT NULL DEFAULT '',
  `skey` varchar(55) NOT NULL DEFAULT '',
  `pkey3` varchar(55) NOT NULL DEFAULT '',
  `skey3` varchar(55) NOT NULL DEFAULT '',
  `version` varchar(16) NOT NULL DEFAULT '',
  `version_code` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`tscript_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;";

$phpos_sql['wv_configuracion'] = "
INSERT INTO `w_configuracion` (`tscript_id`, `titulo`, `slogan`, `url`, `email`, `banner`, `tema_id`, `ads_300`, `ads_468`, `ads_160`, `ads_728`, `ads_search`, `chat_id`, `xat_id`, `c_last_active`, `c_allow_sess_ip`, `c_count_guests`, `c_reg_active`, `c_reg_activate`, `c_reg_rango`, `c_met_welcome`, `c_message_welcome`, `c_fotos_private`, `c_hits_guest`, `c_keep_points`, `c_allow_points`, `c_allow_edad`, `c_max_posts`, `c_max_com`, `c_max_nots`, `c_max_acts`, `c_newr_type`, `c_allow_sump`, `c_allow_firma`, `c_allow_upload`, `c_allow_portal`, `c_allow_live`, `c_see_mod`, `c_stats_cache`, `c_desapprove_post`, `offline`, `offline_message`, `codes`, `c_recaptcha`, `pkey`, `skey`, `pkey3`, `skey3`, `version`, `version_code`) VALUES
(1, 'Taringa!', 'Inteligencia Recargada', '', '', 'http://i.imgur.com/2nEr3s.png?1', 1, '<a href=\"http://www.phpost.net/\" target=\"_blank\"><img src=\"/themes/default/images/ads300x250.png\"/></a>', '<a href=\"http://www.phpost.net/\" target=\"_blank\"><img src=\"/themes/default/images/ads468x60.png\"/></a>', '<a href=\"http://www.phpost.net/\" target=\"_blank\"><img src=\"/themes/default/images/ads160x600.png\"/></a>', '<a href=\"http://www.phpost.net/\" target=\"_blank\"><img src=\"/themes/default/images/ads728x90.png\"/></a>', 'partner-pub-5535725517227860:7900040286', '', 0, 15, 1, 0, 1, 1, 3, 0, 'Hola [usuario], [welcome] a [b][web][/b].', 0, 0, 0, 0, 18, 50, 50, 99, 99, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 'Estamos en mantenimiento', 3, 0, '', '', '', '', 'Risus 1.3.0.000', 'risus_1_3_0_000');";

$phpos_sql['w_denuncias'] = "
CREATE TABLE IF NOT EXISTS `w_denuncias` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) NOT NULL DEFAULT 0,
  `d_user` int(11) NOT NULL DEFAULT 0,
  `d_razon` int(2) NOT NULL DEFAULT 0,
  `d_extra` text NOT NULL DEFAULT '',
  `d_total` int(1) NOT NULL DEFAULT '1',
  `d_type` int(1) NOT NULL DEFAULT 0,
  `d_date` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['w_contacts'] = "
CREATE TABLE IF NOT EXISTS `w_contacts` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL DEFAULT 0,
`user_email` varchar(50) NOT NULL DEFAULT '',
`time` int(15) NOT NULL DEFAULT 0,
`type` int(1) NOT NULL DEFAULT 0,
`hash` varchar(32) NOT NULL DEFAULT '',
PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;";

$phpos_sql['w_medallas'] = "
CREATE TABLE IF NOT EXISTS `w_medallas` (
  `medal_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_autor` int(11) NOT NULL DEFAULT 0,
  `m_title` varchar(25) NOT NULL DEFAULT '',
  `m_description` varchar(120) NOT NULL DEFAULT '',
  `m_image` varchar(120) NOT NULL DEFAULT '',
  `m_cant` int(11) NOT NULL DEFAULT 0,
  `m_type` int(1) NOT NULL DEFAULT 0,
  `m_cond_user` int(11) NOT NULL DEFAULT 0,
  `m_cond_user_rango` int(11) NOT NULL DEFAULT 0,
  `m_cond_post` int(11) NOT NULL DEFAULT 0,
  `m_cond_foto` int(11) NOT NULL DEFAULT 0,
  `m_date` int(11) NOT NULL DEFAULT 0,
  `m_total` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`medal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;";

$phpos_sql['w_medallas_assign'] = "
CREATE TABLE IF NOT EXISTS `w_medallas_assign` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`medal_id` int(11) NOT NULL DEFAULT 0,
`medal_for` int(11) NOT NULL DEFAULT 0,
`medal_date` int(11) NOT NULL DEFAULT 0,
`medal_ip` varchar(15) NOT NULL DEFAULT '',
PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;";

$phpos_sql['w_historial'] = "
CREATE TABLE IF NOT EXISTS `w_historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pofid` int(11) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 0,
  `action` int(1) NOT NULL DEFAULT 0,
  `mod` int(11) NOT NULL DEFAULT 0,
  `reason` text NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT 0,
  `mod_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['w_noticias'] = "
CREATE TABLE IF NOT EXISTS `w_noticias` (
  `not_id` int(11) NOT NULL AUTO_INCREMENT,
  `not_body` text NOT NULL DEFAULT '',
  `not_autor` int( 11 ) NOT NULL DEFAULT 0,
  `not_date` int(10) NOT NULL DEFAULT 0,
  `not_active` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`not_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;";

$phpos_sql['w_blacklist'] = "
CREATE TABLE IF NOT EXISTS `w_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT 0,
  `value` varchar(50) NOT NULL DEFAULT '',
  `reason` varchar(120) NOT NULL DEFAULT '',
  `author` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;";

$phpos_sql['w_badwords'] = "
CREATE TABLE IF NOT EXISTS `w_badwords` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(250) NOT NULL DEFAULT '',
  `swop` varchar(250) NOT NULL DEFAULT '',
  `method` int(1) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 0,
  `author` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;";

$phpos_sql['w_stats'] = "
CREATE TABLE IF NOT EXISTS `w_stats` (
  `stats_no` int(1) NOT NULL DEFAULT 0,
  `stats_max_online` int(11) NOT NULL DEFAULT 0,
  `stats_max_time` int(10) NOT NULL DEFAULT 0,
  `stats_time` int(10) NOT NULL DEFAULT 0,
  `stats_time_cache` int(10) NOT NULL DEFAULT 0,
  `stats_time_foundation` int(11) NOT NULL DEFAULT 0,
  `stats_time_upgrade` int(11) NOT NULL DEFAULT 0,
  `stats_miembros` int(11) NOT NULL DEFAULT 0,
  `stats_posts` int(11) NOT NULL DEFAULT 0,
  `stats_fotos` int(11) NOT NULL DEFAULT 0,
  `stats_comments` int(11) NOT NULL DEFAULT 0,
  `stats_foto_comments` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`stats_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;";

$phpos_sql['wv_stats'] = "
INSERT INTO `w_stats` (`stats_no`, `stats_max_online`) VALUES (1, 0);";

$phpos_sql['w_temas'] = "
CREATE TABLE IF NOT EXISTS `w_temas` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` tinytext NOT NULL DEFAULT '',
  `t_url` tinytext NOT NULL DEFAULT '',
  `t_path` tinytext NOT NULL DEFAULT '',
  `t_copy` tinytext NOT NULL DEFAULT '',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2;";

$phpos_sql['wv_temas'] = "
INSERT INTO `w_temas` (`tid`, `t_name`, `t_url`, `t_path`, `t_copy`) VALUES
(1, 'New Risus', '/themes/default', 'default', 'Tuente & Miguel92');";
