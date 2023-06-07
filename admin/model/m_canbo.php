<?php

/**
 * @author liempv
 * @copyright 2012
 */

defined('DSVH') or die('Restricted access');

//add can bo
function insertCanbo($local){
    mysql_query("insert can_bo set ten_can_bo = '".$local['ten_can_bo']."',
    ngay_sinh = '".$local['ngay_sinh']."',
    ten_dang_nhap = '".$local['ten_dang_nhap']."',
    mat_khau = '".hash('sha256',$local['mat_khau'])."',
    chuc_danh_id = '".$local['chuc_danh_id']."',
    phong_ban_id = '".$local['phong_ban_id']."',
    dia_chi = '".$local['dia_chi']."',
    dien_thoai_noi_bo = '".$local['dien_thoai_noi_bo']."',
    dien_thoai_co_quan = '".$local['dien_thoai_co_quan']."',
    dien_thoai_nha_rieng = '".$local['dien_thoai_nha_rieng']."',
    di_dong = '".$local['di_dong']."',
    fax = '".$local['fax']."',
    email = '".$local['email']."',
    status = '".$local['status']."',
    dan_toc_id = '".$local['dan_toc_id']."'",
    dbconnect());
}

function getListCanbo($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM can_bo
    left join dan_toc ON can_bo.dan_toc_id = dan_toc.dan_toc_id 
    left join chuc_danh_can_bo ON can_bo.chuc_danh_id = chuc_danh_can_bo.chuc_danh_id
    left join phong_ban ON can_bo.phong_ban_id = phong_ban.phong_ban_id  where cap_bac = 'cb' order by ten_phong_ban asc
    LIMIT ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getCanbo($id)
    {
    $pro = mysql_query("select * from can_bo where can_bo_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editCanbo($id, $local)
{
    $sql = "update can_bo set ten_can_bo ='".$local['ten_can_bo']."',
    ngay_sinh = '".$local['ngay_sinh']."',
    ten_dang_nhap = '".$local['ten_dang_nhap']."',";
    if(!empty($local['mat_khau'])){
     $sql .=" mat_khau = '".hash('sha256',$local['mat_khau'])."',";
    }
    $sql .="
    chuc_danh_id = '".$local['chuc_danh_id']."',
    phong_ban_id = '".$local['phong_ban_id']."',
    dia_chi = '".$local['dia_chi']."',
    dien_thoai_noi_bo = '".$local['dien_thoai_noi_bo']."',
    dien_thoai_co_quan = '".$local['dien_thoai_co_quan']."',
    dien_thoai_nha_rieng = '".$local['dien_thoai_nha_rieng']."',
    di_dong = '".$local['di_dong']."',
    fax = '".$local['fax']."',
    email = '".$local['email']."',
    status = '".$local['status']."',
    dan_toc_id = '".$local['dan_toc_id']."'
    where can_bo_id = '".(int)$id."'";
   
    mysql_query($sql, dbconnect());
}   
// xoa thu muc
 function delCanbo($id){
    mysql_query("delete from can_bo where can_bo_id= '".(int)$id."'", dbconnect());
}

function total(){
   $result = mysql_query("select * from can_bo",dbconnect());
    return mysql_num_rows($result);
}

//lay list chuc danh
function getListChucdanh()
    {
        $local_list = mysql_query("SELECT * FROM chuc_danh_can_bo", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//list phong ban
function getListPhongBan()
    {
    $local_list = mysql_query("SELECT * FROM phong_ban", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
//list dan toc
function getListDantoc()
    {
        $local_list = mysql_query("SELECT * FROM dan_toc", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
// kiem tra da ton tai
 function check_exist_local($name){
    $sql = "SELECT * FROM can_bo where ten_can_bo = '".$name."'";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}
 function check_email($email){
    $sql = "SELECT * FROM can_bo where email = '".$email."'";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}
 function check_dn($dn){
    $sql = "SELECT * FROM can_bo where ten_dang_nhap = '".$dn."'";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}

function getAdmin($u,$pwd){
    $sql = "SELECT * FROM can_bo where ten_dang_nhap = '".escape($u)."' and mat_khau = '".escape($pwd)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_fetch_array($result);
} 

function login($u,$pwd){
    $sql = "SELECT * FROM can_bo where ten_dang_nhap = '".escape($u)."' and mat_khau = '".escape($pwd)."' limit 0,1";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
} 

function check_login($u,$pwd){
    $sql = "SELECT * FROM can_bo where ten_dang_nhap = '".$u."' and mat_khau = '".$pwd."' and status ='1' ";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
} 


?>