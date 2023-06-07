<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListdownload($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM download order by
    id_download desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
 function getListdmnews($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM dm_nho 
        left join dm_news on dm_nho.id_dm_news = dm_new.id
        left join tin_tuc on dm_nho.id_dm_news = tin_tuc.dm_id
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
 function getdownload($id)
    {
    $pro = mysql_query("select * from download
    where id_download = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totaldownload(){
   $result = mysql_query("select * from download",dbconnect());
   return mysql_num_rows($result);
   
}   

function congdon($soluong,$ma){
    mysql_query("update download set luot_xem = '".$soluong."' 
           where id_download  = '".$ma."'");
} 

function getdanhmucdl($id)
    {
    $pro = mysql_query("select * from dm_download
    where id_dmdownload = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 
  
  function getdanhmucnho($id)
    {
    $pro = mysql_query("select * from dm_nho
    where dm_nho_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }   
    
//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from download where danh_muc = '".(int)$catid."'",dbconnect());
   return mysql_num_rows($result);
  
}  

function getListtinhoatdong2($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM download
        where danh_muc = '".$catid."'
       
       order by
    id_download desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }      
?>