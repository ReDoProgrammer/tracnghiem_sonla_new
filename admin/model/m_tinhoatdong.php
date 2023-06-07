<?php

/**
 * @author nguyenbinh
 * @copyright 2012
 */
 
 
defined('DSVH') or die('Restricted access');

function insert_tien_do_xu_ly($uid, $tid, $act){
    mysql_query("insert tien_do_xu_ly set 
    tin_id = '".$tid."',
    ngay_gio = NOW(),
    uid = '".$uid."',
    hanh_dong = '".$act."'", 
    dbconnect());
}


function get_list_tien_do_xu_ly($tid)
    {
        $local_list = mysql_query("SELECT * FROM tien_do_xu_ly
        left join regedit ON regedit.id_regedit = tien_do_xu_ly.uid
        WHERE tin_id = '".$tid."' order by tdxl_id desc
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    

  function get_list_ykxl($tid)
    {
        $local_list = mysql_query("SELECT * FROM y_kien_xu_ly
        left join regedit ON regedit.id_regedit = y_kien_xu_ly.duyet_uid
        WHERE tin_id = '".$tid."'
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function insert_y_kien_xu_ly($local){
    mysql_query("insert y_kien_xu_ly set 
    tin_id = '".$local['tin_id']."',
    gio_gui = NOW(),
    duyet_uid = '".$local['duyet_uid']."',
    y_kien = '".$local['y_kien']."'", 
    dbconnect());
}


  function update_kiem_duyet($id, $local)
{
    mysql_query("update tin_tuc set 
    kiem_duyet = '".$local."' 
    where id_news = '".(int)$id."'", dbconnect());
}

  function get_list_chuyen_muc_cua_user($uid)
    {
        $local_list = mysql_query("SELECT * FROM quyen_chuyen_muc
        left join dm_news ON dm_news.id = quyen_chuyen_muc.cm_id
        WHERE user_id = '".$uid."'
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }


function getlisttinhoatdong_tbt($chuyenmuc, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        left join regedit ON tin_tuc.regedit_id = regedit.id_regedit
        left join dm_news ON tin_tuc.dm_id = dm_news.id 
        WHERE (kiem_duyet <>  'btv_sua' and kiem_duyet <> 'sua' and kiem_duyet <> 'chua' and kiem_duyet <> 'gui' and kiem_duyet <> 'btv_nhan' and kiem_duyet <>'btv_tra_ve') and dm_id = '".$chuyenmuc."'
        order by id_news desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }


function getlisttinhoatdongtheohuyenmuckhactrangthai($trangthai,$chuyenmuc, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        left join regedit ON tin_tuc.regedit_id = regedit.id_regedit
        left join dm_news ON tin_tuc.dm_id = dm_news.id 
        WHERE kiem_duyet <>  '".$trangthai."' and dm_id = '".$chuyenmuc."'
        order by id_news desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getlisttinhoatdongtheotrangthaivachuyenmuc($trangthai,$chuyenmuc, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        left join regedit ON tin_tuc.regedit_id = regedit.id_regedit
        left join dm_news ON tin_tuc.dm_id = dm_news.id 
        WHERE kiem_duyet =  '".$trangthai."' and dm_id = '".$chuyenmuc."'
        order by id_news desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }


function getlisttinhoatdongtheonguoi($uid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        left join regedit ON tin_tuc.regedit_id = regedit.id_regedit
         left join dm_news ON tin_tuc.dm_id = dm_news.id 
        WHERE regedit_id =  '".$uid."'
        order by id_news desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }




function del_quy_trinh($id){
    mysql_query("delete from quy_trinh where quy_trinh_id ='".(int)$id."'", dbconnect());
}


function insert_quy_trinh($local){
    mysql_query("insert quy_trinh set 
    ben_a = '".$local['ben_a']."',
    ben_b = '".$local['ben_b']."',
    hanh_dong = '".$local['hanh_dong']."'", 
    dbconnect());
}

 function get_list_roles_sub($ben_a)
    {
        $local_list = mysql_query("SELECT * FROM roles
        WHERE role_key <> '".$ben_a."'
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function get_list_roles($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM roles
        order by role_id desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
    
    

function get_list_quy_trinh($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM quy_trinh
        order by quy_trinh_id desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }


 function getcat($id)
    {
    $pro = mysql_query("select * from danh_muc where ma_danh_muc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
 
 function get_list_cat($catid)
    {
        $local_list = mysql_query("SELECT * FROM dm_news
        WHERE cha_id = '".$catid."'
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
  function get_list_cha()
    {
        $local_list = mysql_query("SELECT * FROM dm_news
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//add chuc danh
function inserttinhoatdong1($local){
    mysql_query("insert tin_tuc set 
    tieu_de = '".$local['ten_tin_hoat_dong']."',
    file = '".$local['file']."',
    general = '".$local['mo_ta_chung']."',
    cat_id = '".$local['cat_id']."',
    noi_bat = '".$local['tieu_diem']."',
    regedit_id = '".$_SESSION['regedit_id']."',
    time = NOW(),
    kiem_duyet = '".$local['kiem_duyet']."',
    noi_dung = '".$local['mo_ta_chi_tiet']."'", 
    dbconnect());
}

function inserttinhoatdong($local){
    mysql_query("insert tin_tuc set 
    tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    tag = '".$local['tag']."',
    file = '".$local['file']."',
    regedit_id = '".$_SESSION['regedit_id']."',
    tac_gia = '".$local['tac_gia']."',
    nguon_tin = '".$local['nguon_tin']."',
    kiem_duyet = '".$local['kiem_duyet']."',
    noi_bat = '".$local['noi_bat']."',
    dm_id = '".$local['dm_id']."',
    id_dm_nho = '".$local['id_dm_nho']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
  
}
//list chuc danh
function getListtinhoatdong($uid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        left join regedit ON tin_tuc.regedit_id = regedit.id_regedit
        left join dm_news ON tin_tuc.dm_id = dm_news.id
        WHERE tin_tuc.regedit_id = '".$uid."'
        order by id_news desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getlisttinhoatdongvoithamso($local, $uid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        left join regedit ON tin_tuc.regedit_id = regedit.id_regedit
        left join dm_news ON tin_tuc.dm_id = dm_news.id 
        WHERE regedit_id = '".$uid."' tieu_de like '%".$local['ten_tin_tuc']."%'
        order by id_news desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    

function total2($uid, $local){
   $result = mysql_query("select * from tin_tuc 
   WHERE regedit_id = '".$uid."' tieu_de like '%".$local['ten_tin_tuc']."%'",dbconnect());
    return mysql_num_rows($result);
}


//ham lay du lieu phong ban theo id
function gettinhoatdong($id)
    {
    $pro = mysql_query("select * from tin_tuc where id_news = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong muc sua
function edittinhoatdong($id, $local)
{
    mysql_query("update tin_tuc set 
    tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    tag = '".$local['tag']."',
    file = '".$local['file']."',
    tac_gia = '".$local['tac_gia']."',
    nguon_tin = '".$local['nguon_tin']."',
    kiem_duyet = '".$local['kiem_duyet']."',
    noi_bat = '".$local['noi_bat']."',
    dm_id = '".$local['dm_id']."',
    id_dm_nho = '".$local['id_dm_nho']."',
    noi_dung = '".$local['noi_dung']."',
    edit_date = NOW()
    where id_news = '".(int)$id."'", dbconnect());
}
// xoa thu muc
function deltinhoatdong($id){
    mysql_query("delete from tin_tuc where id_news ='".(int)$id."'", dbconnect());
}

function total($uid){
   $result = mysql_query("select * from tin_tuc WHERE regedit_id = '".$uid."'",dbconnect());
    return mysql_num_rows($result);
}

function total_all_news(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
    return mysql_num_rows($result);
}


function total_quy_trinh(){
   $result = mysql_query("select * from quy_trinh",dbconnect());
    return mysql_num_rows($result);
}


 function checkcanbo($param){
    $sql = "SELECT * FROM regedit where tin_tuc_id = '".escape($param)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
}

function check_hoso_pvt($param){
    $sql = "SELECT * FROM ho_so_phi_vat_the where tin_tuc_id = '".escape($param)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
}

function getListCattin($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM cat_tin
        order by sap_xep asc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
 function getListdanhmuc($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM danh_muc 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }   

?>