<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertCanbo($local){
    mysql_query("insert can_bo set ten_can_bo = '".$local['ten_can_bo']."'",
    dbconnect());
}

function getListCanbo()
    {
    $local_list = mysql_query("SELECT * FROM can_bo", dbconnect());
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
    mysql_query("update can_bo set ten_can_bo ='".$local['ten_can_bo']."',
    ngay_sinh = '".$local['ngay_sinh']."',
    ten_dang_nhap = '".$local['ten_dang_nhap']."',
    mat_khau = '".$local['mat_khau']."',
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
    cap_bac = '".$local['cap_bac']."'
    
    
    where can_bo_id = '".(int)$id."'", dbconnect());
}   
// xoa thu muc
 function delCanbo($id){
    mysql_query("delete from can_bo where can_bo_id= '".(int)$id."'", dbconnect());
}
    
?>