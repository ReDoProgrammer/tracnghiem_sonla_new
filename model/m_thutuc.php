<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

  function getListdmthutuc($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_thutuc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function getListthutuc($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM thu_tuc
        LEFT JOIN dm_donvi ON thu_tuc.donvi_id = dm_donvi.id_donvi
    LEFT JOIN dm_linhvuc ON thu_tuc.linhvuc_id = dm_linhvuc.id_dmlinhvuc
        order by
        id_thutuc ASC
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
 
 function getthutuc($id)
    {
    $pro = mysql_query("select * from thu_tuc
    
      LEFT JOIN dm_donvi ON thu_tuc.donvi_id = dm_donvi.id_donvi
    LEFT JOIN dm_linhvuc ON thu_tuc.linhvuc_id = dm_linhvuc.id_dmlinhvuc
    
    where id_thutuc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
     function getthutuc1($id)
    {
    $pro = mysql_query("select * from thu_tuc
    
      LEFT JOIN dm_donvi ON thu_tuc.donvi_id = dm_donvi.id_donvi
    LEFT JOIN dm_linhvuc ON thu_tuc.linhvuc_id = dm_linhvuc.id_dmlinhvuc
    
    where dm_thutuc_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totalthutuc(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
   return mysql_num_rows($result);
   
}   

function congdon($soluong,$ma){
    mysql_query("update thu_tuc set view = '".$soluong."' 
           where id_thutuc  = '".$ma."'");
} 
function getdanhmucdl($id)
    {
    $pro = mysql_query("select * from dm_thutuc
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 
    
//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from tin_tuc where dm_id = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
  
}  

function getListdmabc($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        where dm_id = '".$catid."'
        order by
        id_thutuc desc
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
function getListtimkiemthutuc($local,$limit,$start){
     
        $sql = "select * from thu_tuc
        
        LEFT JOIN dm_donvi ON thu_tuc.donvi_id = dm_donvi.id_donvi
        LEFT JOIN dm_linhvuc ON thu_tuc.linhvuc_id = dm_linhvuc.id_dmlinhvuc
        
        WHERE LCASE(tieu_de) like LCASE('%".$local['tieu_de']."%')";
        
      
        
        if($local['linhvuc_id']){
        $sql .= " AND linhvuc_id = '".$local['linhvuc_id']."'";
        }
    
        if($local['donvi_id']){
        $sql .= " AND donvi_id = '".$local['donvi_id']."'";
        }
        
        $sql .= " order by
        id_thutuc desc
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