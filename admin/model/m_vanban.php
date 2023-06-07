<?php

/**
 * @author liemphan
 * @copyright 2012
 */
 
 

 
//add chuc danh
function insertvanban($local){
    mysql_query("insert van_ban set ten = '".$local['ten']."',
    file = '".$local['file']."',
    link = '".$local['link']."',
    so_hieu = '".$local['so_hieu']."',
    hieu_luc = '".$local['hieu_luc']."',
    pham_vi = '".$local['pham_vi']."',
	nguoi_ky = '".$local['nguoi_ky']."',
    can_bo_id = '".$_SESSION['can_bo_id']."',
    ngay_ban_hanh = '".$local['ngay_ban_hanh']."',
    loai_van_ban_id = '".$local['loai_van_ban_id']."',
    noi_ban_hanh_id = '".$local['noi_ban_hanh_id']."',
    general = '".$local['mo_ta_chung']."',
    add_date = NOW(),
    mo_ta1 = '".$local['mo_ta1']."'", 
    dbconnect());
}
//cap nhat trong muc sua
function editvanban($id, $local)
{
        mysql_query("update van_ban set 
        ten = '".$local['ten']."',
        file = '".$local['file']."',
        link = '".$local['link']."',
        so_hieu = '".$local['so_hieu']."',
        hieu_luc = '".$local['hieu_luc']."',
		nguoi_ky = '".$local['nguoi_ky']."',
        can_bo_id = '".$_SESSION['can_bo_id']."',
        ngay_ban_hanh = '".$local['ngay_ban_hanh']."',
        loai_van_ban_id = '".$local['loai_van_ban_id']."',
        noi_ban_hanh_id = '".$local['noi_ban_hanh_id']."',
        general = '".$local['general']."',
        mo_ta1 = '".$local['mo_ta1']."',
        add_date = NOW()
        where van_ban_id = '".(int)$id."'", dbconnect());
}

// xoa thu muc
function delvanban($id){
    mysql_query("delete from van_ban where van_ban_id ='".(int)$id."'", dbconnect());
}

function getListvanban($start,$limit)
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

function getListvanbanvoithamso($local, $start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM van_ban
        left join can_bo ON van_ban.id_regedit = regedit.id_regedit
        left join loai_van_ban ON van_ban.loai_van_ban_id = loai_van_ban.loai_van_ban_id
        left join noi_ban_hanh ON van_ban.noi_ban_hanh_id = noi_ban_hanh.noi_ban_hanh_id
        WHERE ten like '%".$local['ten']."%'
        order by van_ban_id desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function total2($local){
   $result = mysql_query("select * from van_ban WHERE ten like '%".$local['ten']."%'",dbconnect());
    return mysql_num_rows($result);
}


function getListvanban1($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM van_ban
        left join can_bo ON van_ban.can_bo_id = can_bo.can_bo_id
        left join khoi_hoc ON khoi_hoc.khoi_hoc_id = van_ban.khoi_hoc_id
        left join nhom_van_ban ON nhom_van_ban.nhom_van_ban_id = van_ban.nhom_van_ban_id
        order by van_ban_id desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu phong ban theo id
function getvanban($id)
    {
    $pro = mysql_query("select * from van_ban where van_ban_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    


function listloaivanban()
    {
        $local_list = mysql_query("SELECT * FROM loai_van_ban
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function listnoibanhanh()
    {
        $local_list = mysql_query("SELECT * FROM noi_ban_hanh
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

 function checkcanbo($param){
    $sql = "SELECT * FROM can_bo where van_ban_id = '".escape($param)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
}

function check_hoso_pvt($param){
    $sql = "SELECT * FROM ho_so_phi_vat_the where van_ban_id = '".escape($param)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
}

function total(){
   $result = mysql_query("select * from van_ban",dbconnect());
    return mysql_num_rows($result);
}

function getlistloaivanban($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM loai_van_ban
        order by sap_xep asc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getlistnoibanhanh($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM noi_ban_hanh
        order by sap_xep asc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

//add chuc danh
function insertloaivanban($local){
    mysql_query("insert loai_van_ban set 
    ten_loai_van_ban = '".$local['ten_loai_van_ban']."',
    can_bo_id = '".$_SESSION['can_bo_id']."',
    sap_xep = '".$local['sap_xep']."',
    add_date = NOW(),
    mo_ta = '".$local['mo_ta']."'", 
    dbconnect());
}

function insertnoibanhanh($local){
    mysql_query("insert noi_ban_hanh set 
    ten_noi_ban_hanh = '".$local['ten_noi_ban_hanh']."',
    sap_xep = '".$local['sap_xep']."',
    mo_ta = '".$local['mo_ta']."'", 
    dbconnect());
}

function editloaivanban($id, $local)
{
        mysql_query("update loai_van_ban set 
        ten_loai_van_ban = '".$local['ten_loai_van_ban']."',
        mo_ta = '".$local['mo_ta']."',
        sap_xep = '".$local['sap_xep']."',
        add_date = NOW()
        where loai_van_ban_id = '".(int)$id."'", dbconnect());
}

function editnoibanhanh($id, $local)
{
        mysql_query("update noi_ban_hanh set 
        ten_noi_ban_hanh = '".$local['ten_noi_ban_hanh']."',
        mo_ta = '".$local['mo_ta']."',
        sap_xep = '".$local['sap_xep']."'
        where noi_ban_hanh_id = '".(int)$id."'", dbconnect());
}

function getloaivanban($id)
    {
    $pro = mysql_query("select * from loai_van_ban where loai_van_ban_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
function getnoibanhanh($id)
    {
    $pro = mysql_query("select * from noi_ban_hanh where noi_ban_hanh_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
        
        
function delloaivanban($id){
    mysql_query("delete from loai_van_ban where loai_van_ban_id ='".(int)$id."'", dbconnect());
}

function delnoibanhanh($id){
    mysql_query("delete from noi_ban_hanh where noi_ban_hanh_id ='".(int)$id."'", dbconnect());
}


function totalloaivanban(){
   $result = mysql_query("select * from loai_van_ban",dbconnect());
    return mysql_num_rows($result);
}

function totalnoibanhanh(){
   $result = mysql_query("select * from noi_ban_hanh",dbconnect());
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
            
            $sql .= "and loai_van_ban_id = '".$local['loai_van_ban_id']."'";
        }
        
         if($local['noi_ban_hanh_id']!=""){
            
            $sql .= "and noi_ban_hanh_id = '".$local['noi_ban_hanh_id']."'";
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
	  
        
        WHERE LCASE(ten) like LCASE('%".$local['ten']."%')";
        
        if($local['loai_van_ban_id']!=""){
            
            $sql .= "and loai_van_ban_id = '".(int)$local['loai_van_ban_id']."'";
        }
        
        if($local['noi_ban_hanh_id']!=""){
            
            $sql .= "and noi_ban_hanh_id = '".(int)$local['noi_ban_hanh_id']."'";
        }
        
        if($local['so_hieu']!=""){
            
            $sql .= "and so_hieu = '".$local['so_hieu']."'";
        }
        
         if($local['ngay_ban_hanh']!=""){
            
            $sql .= "and ngay_ban_hanh = '".$local['ngay_ban_hanh']."'";
        }
        
        $result = mysql_query($sql, dbconnect());    
       
      }
       return mysql_num_rows($result);

}

 function totalvanban(){
   $result = mysql_query("select * from van_ban",dbconnect());
    return mysql_num_rows($result);
} 

?>