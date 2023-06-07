<?php

/**
 * @author honestphan
 * @copyright 2011
 */
defined('SLA') or die('Restricted access');
 
function make_alias($str,$ex){
    $str = trim($str);
    if(!$str) return false;
    $unicode = array(
    'a'=>'á|à|?|ã|?|a|?|?|?|?|?|â|?|?|?|?|?',
    'd'=>'d',
    'e'=>'é|è|?|?|?|ê|?|?|?|?|?',
    'i'=>'í|ì|?|i|?',
    'o'=>'ó|ò|?|õ|?|ô|?|?|?|?|?|o|?|?|?|?|?',
    'u'=>'ú|ù|?|u|?|u|?|?|?|?|?',
    'y'=>'ý|?|?|?|?',
    '-'=>' ',
    );
    foreach($unicode as $nonUnicode=>$uni) $str = preg_replace("/($uni)/i",$nonUnicode,$str);
    //$alias = $str + "." + $ex;
    return $str;
}

?>