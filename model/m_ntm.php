<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListtinhoatdonglienquan($start, $limit, $ten)
    {
        $local_list = mysql_query("SELECT * FROM ntm where tieu_de like '%".$ten."%'
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListntm($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM ntm order by
        id_ntm desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
  
 function getListtheodanhmucntm($danh_muc,$start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM  ntm
		left join dm_ntm ON id_dmntm = ntm.dm_id
		where dm_id = '".$danh_muc."'
	
		order by
        id_ntm desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
  
 function getListdmntm($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM dm_nho 
        left join dm_ntm on dm_nho.id_dm_ntm = dm_new.id
        left join ntm on dm_nho.id_dm_ntm = ntm.dm_id
        order by
        id_ntm desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
 function getntm($id)
    {
    $pro = mysql_query("select * from ntm
	left join dm_ntm ON id_dmntm = ntm.dm_id
    where id_ntm = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totalntm(){
   $result = mysql_query("select * from ntm",dbconnect());
   return mysql_num_rows($result);
   
}   

function congdon($soluong,$ma){
    mysql_query("update ntm set luot_xem_id = '".$soluong."' 
           where id_ntm  = '".$ma."'");
} 

function getdanhmucdl($id)
    {
    $pro = mysql_query("select * from dm_ntm
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
   $result = mysql_query("select * from ntm where id_ntm = '".(int)$catid."'",dbconnect());
   return mysql_num_rows($result);
  
}  

function getListtinhoatdong2($start, $limit)
    {
        $sql = "SELECT * FROM ntm ";
        
        if($_REQUEST['cha']){
        $sql .= " where dm_id = '".(int)$_REQUEST['cha']."'";
        }
        
        if($_REQUEST['cat']){
        $sql .= " where id_dm_nho = '".(int)$_REQUEST['cat']."'";
        }
        
        $sql .=" order by
        id_ntm desc
        limit ".(int)$start.",".(int)$limit." ";
    
    
        $local_list = mysql_query($sql, dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }      
?>