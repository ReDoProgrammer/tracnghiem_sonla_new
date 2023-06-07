<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertKhuyenmai($local){
    mysql_query("insert khuyen_mai set tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    thoi_gian = NOW()
    ",
    dbconnect());
}

function getListKhuyenmai($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM khuyen_mai order by
    ma_khuyen_mai desc
        limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getKhuyenmai($id)
    {
    $pro = mysql_query("select * from khuyen_mai where ma_khuyen_mai = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editKhuyenmai($id, $local)
{
    mysql_query("update khuyen_mai set tieu_de ='".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    thoi_gian = NOW()
    where ma_khuyen_mai = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delKhuyenmai($id){
    mysql_query("delete from khuyen_mai where ma_khuyen_mai= '".(int)$id."'", dbconnect());
}
 function totalkhuyenmai(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
    return mysql_num_rows($result);   
    } 
?>