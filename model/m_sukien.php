<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

	  function getListnewsxemnhieu($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc where luot_xem_id
		order by
        id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListsukien($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM su_kien order by
        id_sukien desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }


     
 
 function getsukien($id)
    {
    $pro = mysql_query("select * from su_kien
    where id_sukien = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totalsukien(){
   $result = mysql_query("select * from su_kien",dbconnect());
   return mysql_num_rows($result);
   
}   



 function getdanhmucdb($id)
    {
    $pro = mysql_query("select * from su_kien_dm
    
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 
    
//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from tin_tuc where dm_id = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
  
}

function congdon($soluong,$ma){
    mysql_query("update su_kien set view = '".$soluong."' 
           where id_sukien  = '".$ma."'");
}  

function getListsukien2($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM su_kien
        
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