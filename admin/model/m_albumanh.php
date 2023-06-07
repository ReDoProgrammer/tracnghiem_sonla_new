<?php

/**
 * @author nguyenbinh
 * @copyright 2012
 */
 
 
defined('DSVH') or die('Restricted access');
 
//add chuc danh
function insertalbumanh($local){
    mysql_query("insert album_anh set ten_album_anh = '".$local['ten_album_anh']."',
    avatar = '".$local['avatar']."',
    general = '".$local['mo_ta_chung']."',
    can_bo_id = '".$_SESSION['can_bo_id']."',
     add_date = NOW(),
    detail = '".$local['mo_ta_chi_tiet']."'", 
    dbconnect());
}
//list chuc danh
function getListalbumanh($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM album_anh
        left join can_bo ON album_anh.can_bo_id = can_bo.can_bo_id
        order by album_anh_id desc LIMIT ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//ham lay du lieu phong ban theo id
function getalbumanh($id)
    {
    $pro = mysql_query("select * from album_anh where album_anh_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong muc sua
function editalbumanh($id, $local)
{
    mysql_query("update album_anh set ten_album_anh ='".$local['ten_album_anh']."',
    avatar = '".$local['avatar']."',
    general = '".$local['mo_ta_chung']."',
    last_edit = NOW(),
    detail = '".$local['mo_ta_chi_tiet']."' 
    where album_anh_id = '".(int)$id."'", dbconnect());
}
// xoa thu muc
function delalbumanh($id){
    mysql_query("delete from album_anh where album_anh_id ='".(int)$id."'", dbconnect());
}

function total(){
   $result = mysql_query("select * from album_anh",dbconnect());
    return mysql_num_rows($result);
}

 function checkcanbo($param){
    $sql = "SELECT * FROM can_bo where album_anh_id = '".escape($param)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
}

function check_hoso_pvt($param){
    $sql = "SELECT * FROM ho_so_phi_vat_the where album_anh_id = '".escape($param)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
}



?>