<?php 
define('VersionTheme', '1.1');

/* FORZAMOS EL IDIOMA ESPAÑOL */
setlocale(LC_ALL, "es_ES");
/* NUMBER_FORMAT */
function smarty_modifier_number_format($string, $decimals = 0, $dec_sep=",", $thous_sep = ".") { 
   return number_format($string,$decimals,$dec_sep,$thous_sep);
}

/* NOBBCODE */
function smarty_modifier_nobbcode($nobbcode = ''){
  $nobbcode = preg_replace('/\[([^\]]*)\]/', '', $nobbcode); 
  $regex = "@(https?://([-\w\.]+[-\w])+(:\d+)?(/([\w/_\.#-]*(\?\S+)?[^\.\s])?)?)@";
  $nobbcode = preg_replace($regex, ' ', $nobbcode);
  return $nobbcode;
}

/* MODIFIER_KMG */
function smarty_modifier_kmg($number){
   $pre = 'KMG';
   if ($number >= 1000) {
       for ($i=-1; $number>=1000; ++$i) {
           $number /= 1000;
       }
       return round($number,1).$pre[$i];
   } else return $number;
}

define('Syntax',$tsCore->settings['url'].'/themes/'.TS_TEMA.'/source/prettify');

define('DATE',date('dmyHi'));
$exp = (int)$tsCore->settings['codes'];

switch ($exp) {
  case 0:  define('Style', 'Default');                 break;
  case 1:  define('Style', 'Desert');                  break;
  case 2:  define('Style', 'Sunburst');                break;
  case 3:  define('Style', 'Sons-Of-Obsidian');        break;
  case 4:  define('Style', 'Doxy');                    break;
  case 5:  define('Style', 'Tomorrow-night');          break;
  case 6:  define('Style', 'tomorrow-night-eighties'); break;
  case 7:  define('Style', 'tomorrow-night-blue');     break;
  case 8:  define('Style', 'tomorrow-night-bright');   break;
  case 9:  define('Style', 'tranquil-heart');          break;
  case 10: define('Style', 'atelier-savanna-dark');    break;
  default: define('Style', 'Default');                 break;
}

$html = '<link rel="stylesheet" href="'.Syntax.'/'.Style.'.css?'.DATE.'">
        <link rel="stylesheet" href="'.Syntax.'/setting.css?'.DATE.'">
        <script src="'.Syntax.'/prettify.min.js?'.DATE.'"></script>
        <script src="'.Syntax.'/run_prettify.min.js?'.DATE.'"></script>
        <script type="text/javascript">
            /* CON ESTE CÓDIGO SOLUCIONAMOS EL PROBLEMA CON EL JQUERY 3.4.2, YA QUE ESTE FUNCIONA CON JQUERY 1.7.1 */
            $(document).ready( function() {
                $(".code").each(function(index) {
                    var codeDiv = $(this);
                    var indentFixed= prettyPrint(codeDiv.html());
                    codeDiv.html(indentFixed);
                    codeDiv.addClass("prettyprint");
                });
                PR.prettyPrint();
            });
        </script>';
define('PrettyPrint', $html);

if($_GET['f'] == 'instalar' || $_GET['f'] == 'actualizar'){

  $CInstAct = TS_ROOT.DIRECTORY_SEPARATOR.$_GET['f'];
  if(!$dh = @opendir($CInstAct)) return;
  while (false !== ($current = readdir($dh))) {

    if($current != '.' && $current != '..') {

      if (!@unlink($CInstAct.'/'.$current)) {
        if(!$dh = @opendir($current)) return;
        while (false !== ($current = readdir($dh))) {
          var_dump($mysql);
        }
        if($_GET['f'] == 'instalar') deleteDirectory($CInstAct.'/'.$current);
        if($_GET['f'] == 'actualizar') deleteDirectory($CInstAct.'/'.$current);
      }

    }     

  }
  closedir($dh);
  @rmdir($CInstAct);
}