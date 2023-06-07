<?php

/**
 * @author honestphan
 * @copyright 2012
 */

//defined('DSVH') or die('Restricted access');

function listDanhmuccon($ma_cha){
    $parent = mysql_query("select * from loai_san_pham where danh_muc_cha  ='".(int)$ma_cha."' order by ten_loai", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($parent)){
      $result[] = $local;
    }
    return $result;
}

?>