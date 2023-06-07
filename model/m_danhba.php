<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListdmdanhba($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM danh_ba_dm
      
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListdanhba($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM danh_ba
        LEFT JOIN danh_ba_dm ON danh_ba.to_chuc_id = danh_ba_dm.id
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
 
 function getdanhba($id)
    {
    $pro = mysql_query("select * from danh_ba
    where id_danhba = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totaldanhba(){
   $result = mysql_query("select * from danh_ba",dbconnect());
   return mysql_num_rows($result);
   
}   

function congdon($soluong,$ma){
    mysql_query("update tin_tuc set luot_xem_id = '".$soluong."' 
           where id_news  = '".$ma."'");
} 


 function getdanhmucdb($id)
    {
    $pro = mysql_query("select * from danh_ba_dm
    
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 
    
//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from tin_tuc where dm_id = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
  
}  

function getListdanhba2($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM danh_ba
        
        where to_chuc_id = '".$catid."'
        
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }   
?>