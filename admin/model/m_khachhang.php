<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertkhachhang($local){
    mysql_query("insert khach_hang set 
    ten = '".$local['ten']."',
    dia_chi = '".$local['dia_chi']."',
    email = '".$local['email']."',
    dien_thoai = '".$local['dien_thoai']."',
    thu_tu = '".$local['thu_tu']."',
    ten_hang = '".$local['ten_hang']."',
    so_luong = '".$local['so_luong']."',
    thoi_gian = NOW()
    ",
    dbconnect());
}

function getListkhachhang($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM khach_hang order by
    id_khach_hang desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getkhachhang($id)
    {
    $pro = mysql_query("select * from khach_hang where id_khach_hang = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editkhachhang($id, $local)
{
    mysql_query("update khach_hang 
    set     ten = '".$local['ten']."',
    dia_chi = '".$local['dia_chi']."',
    email = '".$local['email']."',
    dien_thoai = '".$local['dien_thoai']."',
    thu_tu = '".$local['thu_tu']."',
    ten_hang = '".$local['ten_hang']."',
    so_luong = '".$local['so_luong']."',
    thoi_gian = NOW()
    where id_khach_hang = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delkhachhang($id){
    mysql_query("delete from khach_hang where id_khach_hang= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalkhachhang(){
   $result = mysql_query("select * from khach_hang",dbconnect());
    return mysql_num_rows($result);
}   
?>