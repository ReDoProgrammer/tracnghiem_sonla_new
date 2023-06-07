<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListQuayphim($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM quay_phim order by
        ma_quay_phim desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 
 function getquayphim($id)
    {
    $pro = mysql_query("select * from quay_phim
    where ma_quay_phim = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
function get1Video(){
    $pro = mysql_query("select * from quay_phim order by
        ma_quay_phim desc
    LIMIT 1", dbconnect());
    return mysql_fetch_array($pro);
}
    
 //tinh tong ban ghi
 function totalquayphim(){
   $result = mysql_query("select * from quay_phim",dbconnect());
   return mysql_num_rows($result);
   
}   

function congdon($soluong,$ma){
    mysql_query("update quay_phim set luot_xem = '".$soluong."' 
           where ma_quay_phim  = '".$ma."'");
}






    
?>