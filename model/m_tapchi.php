<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListtapchi($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tap_chi
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 
 function gettapchi($id)
    {
    $pro = mysql_query("select * from tap_chi
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi
 function totaltapchi(){
   $result = mysql_query("select * from tap_chi",dbconnect());
   return mysql_num_rows($result);
   
}   


function luotxem($soluong,$ma){
    mysql_query("update tap_chi set view = '".$soluong."' 
           where id  = '".$ma."'");
}



    
?>