<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListlct($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM lich_cong_tac order by
        id_lich desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 
 function getlct($id)
    {
    $pro = mysql_query("select * from lich_cong_tac
    where id_lich = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi
 function totallct(){
   $result = mysql_query("select * from lich_cong_tac",dbconnect());
   return mysql_num_rows($result);
   
}   


function luotxem($soluong,$ma){
    mysql_query("update lich_cong_tac set luot_xem = '".$soluong."' 
           where id_lich  = '".$ma."'");
}



    
?>