<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListkhuyenhoc($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM khuyen_hoc order by
        id_khuyenhoc desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 
 function getkhuyenhoc($id)
    {
    $pro = mysql_query("select * from khuyen_hoc
    where id_khuyenhoc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi
 function totalkhuyenhoc(){
   $result = mysql_query("select * from khuyen_hoc",dbconnect());
   return mysql_num_rows($result);
   
}   


function luotxem($soluong,$ma){
    mysql_query("update khuyen_hoc set luot_xem = '".$soluong."' 
           where id_khuyenhoc  = '".$ma."'");
}



    
?>