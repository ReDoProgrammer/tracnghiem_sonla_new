<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListTintuc($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc order by
        ma_tin_tuc desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 
 function gettintuc($id)
    {
    $pro = mysql_query("select * from tin_tuc
    where ma_tin_tuc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi
 function totaltintuc(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
   return mysql_num_rows($result);
   
}   






    
?>