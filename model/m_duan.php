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

function getListduan($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM du_an order by
        id_duan desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }


     
 
 function getduan($id)
    {
    $pro = mysql_query("select * from du_an
    where id_duan = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totalduan(){
   $result = mysql_query("select * from du_an",dbconnect());
   return mysql_num_rows($result);
   
}   



 function getdanhmucdb($id)
    {
    $pro = mysql_query("select * from du_an_dm
    
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 
    
//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from tin_tuc where dm_id = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
  
}

function congdon($soluong,$ma){
    mysql_query("update du_an set luot_xem_id = '".$soluong."' 
           where id_duan  = '".$ma."'");
}  

function getListduan2($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM du_an
        
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