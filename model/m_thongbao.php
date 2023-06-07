<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListthongbao($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM thong_bao order by
        id_thongbao desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 
 function getthongbao($id)
    {
    $pro = mysql_query("select * from thong_bao
    where id_thongbao = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi
 function totalthongbao(){
   $result = mysql_query("select * from thong_bao",dbconnect());
   return mysql_num_rows($result);
   
}   


function luotxem($soluong,$ma){
    mysql_query("update thong_bao set luot_xem = '".$soluong."' 
           where id_thongbao  = '".$ma."'");
}



    
?>