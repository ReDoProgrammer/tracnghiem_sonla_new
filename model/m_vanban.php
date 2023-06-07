<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getlistloaivanban($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM loai_van_ban
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getlistnoibanhanh($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM noi_ban_hanh
        
         ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListvanban($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM van_ban
         left join loai_van_ban ON van_ban.loai_van_ban_id = loai_van_ban.loai_van_ban_id
        left join noi_ban_hanh ON van_ban.noi_ban_hanh_id = noi_ban_hanh.noi_ban_hanh_id
        
       order by van_ban_id desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
 
function getvanban($id)
    {
    $pro = mysql_query("select * from van_ban
        left join loai_van_ban ON van_ban.loai_van_ban_id = loai_van_ban.loai_van_ban_id
        left join noi_ban_hanh ON van_ban.noi_ban_hanh_id = noi_ban_hanh.noi_ban_hanh_id
     where van_ban_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
function totalvanban(){
   $result = mysql_query("select * from van_ban",dbconnect());
    return mysql_num_rows($result);
} 

//tin kiem van ban
function getListVanBanVoiThamSoNangCao($local,$limit,$start){
     
        $sql = "select * from van_ban
        
        WHERE LCASE(ten) like LCASE('%".$local['ten']."%')";
        
        if($local['so_hieu']!=""){
            
            $sql .= "and lcase(so_hieu) like lcase('%".$local['so_hieu']."%')";
        }
        if($local['ngay_ban_hanh']!=""){
            
            $sql .= "and lcase(ngay_ban_hanh) like lcase('%".$local['ngay_ban_hanh']."%')";
        }
        
        if($local['loai_van_ban_id']!=""){
            
            $sql .= "and loai_van_ban_id = '".(int)$local['loai_van_ban_id']."'";
        }
        
         if($local['noi_ban_hanh_id']!=""){
            
            $sql .= "and noi_ban_hanh_id = '".(int)$local['noi_ban_hanh_id']."'";
        }
        
        $sql .= " order by
        van_ban_id desc
        limit ".(int)$start.",".(int)$limit."
         ";
    
    $local_list = mysql_query($sql, dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
        }
        return $result;
 }
 
 function tt($local,$limit,$start){
     
     if($local){
        
      $sql = "select * from van_ban
        
        WHERE LCASE(ten) like LCASE('%".fs($local['ten'])."%')";
        
        if($local['loai_van_ban_id']!=""){
            
            $sql .= "and loai_van_ban_id = '".(int)$local['loai_van_ban_id']."'";
        }
        
        if($local['noi_ban_hanh_id']!=""){
            
            $sql .= "and noi_ban_hanh_id = '".(int)$local['noi_ban_hanh_id']."'";
        }
        
        if($local['so_hieu']!=""){
            
            $sql .= "and so_hieu = '".fs($local['so_hieu'])."'";
        }
        
         if($local['ngay_ban_hanh']!=""){
            
            $sql .= "and ngay_ban_hanh = '".fs($local['ngay_ban_hanh'])."'";
        }
        
        $result = mysql_query($sql, dbconnect());    
       
      }
       return mysql_num_rows($result);

}

function update_count($soluong,$ma){
    mysql_query("update van_ban set luot_xem = '".(int)$soluong."' 
           where van_ban_id = '".$ma."'");
}		   

   
?>