<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

  function getListdmtieuchi($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_tieuchi
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function getListtieuchi($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tieu_chi
   
        order by
        id_tieuchi ASC
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
 
 function gettieuchi($id)
    {
    $pro = mysql_query("select * from tieu_chi
    
     LEFT JOIN dm_tieuchi ON tieu_chi.dmtieuchi_id = dm_tieuchi.id_dmtieuchi
    where id_tieuchi = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
     function gettieuchi1($id)
    {
    $pro = mysql_query("select * from tieu_chi
    
      LEFT JOIN dm_donvi ON tieu_chi.donvi_id = dm_donvi.id_donvi
    LEFT JOIN dm_linhvuc ON tieu_chi.linhvuc_id = dm_linhvuc.id_dmlinhvuc
    
    where dm_tieuchi_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totaltieuchi(){
   $result = mysql_query("select * from tieu_chi",dbconnect());
   return mysql_num_rows($result);
   
}   

function congdon($soluong,$ma){
    mysql_query("update tieu_chi set view = '".$soluong."' 
           where id_tieuchi  = '".$ma."'");
} 
function getdanhmucdl($id)
    {
    $pro = mysql_query("select * from dm_tieuchi
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 
    
//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from tieu_chi where dmtieuchi_id = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
  
}  

 function getListtheodanhmuctieuchi($danh_muc,$start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM  tieu_chi
		
		where dmtieuchi_id = '".$danh_muc."'
	
		order by
        id_tieuchi desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
    //get list danh muc   
    function getListdonvi($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_donvi 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
    //get list danh muc   
    function getListlinhvuc($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_linhvuc 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }  
    
    
    //tin kiem van ban
//tin kiem van ban
function getListtimkiemtieuchi($local,$limit,$start){
     
        $sql = "select * from tieu_chi
        
        LEFT JOIN dm_donvi ON tieu_chi.donvi_id = dm_donvi.id_donvi
        LEFT JOIN dm_linhvuc ON tieu_chi.linhvuc_id = dm_linhvuc.id_dmlinhvuc
        
        WHERE LCASE(tieu_de) like LCASE('%".$local['tieu_de']."%')";
        
      
        
        if($local['linhvuc_id']){
        $sql .= " AND linhvuc_id = '".$local['linhvuc_id']."'";
        }
    
        if($local['donvi_id']){
        $sql .= " AND donvi_id = '".$local['donvi_id']."'";
        }
        
        $sql .= " order by
        id_tieuchi desc
        limit ".(int)$start.",".(int)$limit."
         ";
    
    $local_list = mysql_query($sql, dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
        }
        return $result;
 }
?>