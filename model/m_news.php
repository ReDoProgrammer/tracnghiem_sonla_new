<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListtinhoatdonglienquan($start, $limit, $ten)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc where tieu_de like '%".$ten."%'
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListnews($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc order by
        id_news desc
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
     
 function getnews($id)
    {
    $pro = mysql_query("select * from tin_tuc
    where id_news = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totalnews(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
   return mysql_num_rows($result);
   
}   

function congdon($soluong,$ma){
    mysql_query("update tin_tuc set luot_xem_id = '".$soluong."' 
           where id_news  = '".$ma."'");
} 

function getdanhmucdl($id)
    {
    $pro = mysql_query("select * from dm_news
    where id = '".(int)$id."'", dbconnect());
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
   $result = mysql_query("select * from tin_tuc where dm_id = '".(int)$catid."'",dbconnect());
   return mysql_num_rows($result);
  
}  

function getListtinhoatdong2($start, $limit)
    {
        $sql = "SELECT * FROM tin_tuc ";
        
        if($_REQUEST['cha']){
        $sql .= " where dm_id = '".(int)$_REQUEST['cha']."'";
        }
        
        if($_REQUEST['cat']){
        $sql .= " where id_dm_nho = '".(int)$_REQUEST['cat']."'";
        }
        
        $sql .=" order by
        id_news desc
        limit ".(int)$start.",".(int)$limit." ";
    
    
        $local_list = mysql_query($sql, dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }      
?>