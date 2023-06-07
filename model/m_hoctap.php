<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListhoctap($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM hoc_tap
        left join regedit ON id_regedit = hoc_tap.user_id
        order by
        id_hoc_tap desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
 function getListdmhoctap($danh_muc,$start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM  hoc_tap
        left join regedit ON id_regedit = hoc_tap.user_id
        where danh_muc_id = '".$danh_muc."' order by
        id_hoc_tap desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
 
  function totaldmhoctap(){
   $result = mysql_query("select * from hoc_tap",dbconnect());
   return mysql_num_rows($result);
 }
  
 function gethoctap($id)
    {
    $pro = mysql_query("select * from hoc_tap
    where id_hoc_tap = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
 function gethoctap1($id)
    {
    $pro = mysql_query("select * from hoc_tap
    where danh_muc_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }  
 //tinh tong ban ghi day la phan tính  tông
 function totalhoctap(){
   $result = mysql_query("select * from hoc_tap",dbconnect());
   return mysql_num_rows($result);
   
}   

function congdon($soluong,$ma){
    mysql_query("update hoc_tap set luot_xem = '".$soluong."' 
           where id_hoc_tap  = '".$ma."'");
    }	

    
?>