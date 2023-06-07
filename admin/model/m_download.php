<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdownload($local){
    mysql_query("insert download set 
    tieu_de = '".$local['tieu_de']."',
    mo_ta = '".$local['mo_ta']."',
    file = '".$local['file']."',
    hinh_anh = '".$local['hinh_anh']."',
    luot_xem = '".$local['luot_xem']."',
    luot_tai = '".$local['luot_tai']."',
    danh_muc = '".$local['danh_muc']."',
	ten_tap_tin = '".$local['ten_tap_tin']."',
	dung_luong = '".$local['dung_luong']."',
	loai_tep_tin = '".$local['loai_tep_tin']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListdownload($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM download
    LEFT JOIN dm_download ON download.danh_muc = dm_download.id_dmdownload
    order by
    id_download desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
     function getListdmdownload($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_download 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getdownload($id)
    {
    $pro = mysql_query("select * from download where id_download = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdownload($id, $local)
{
    mysql_query("update download set 
    tieu_de = '".$local['tieu_de']."',
    mo_ta = '".$local['mo_ta']."',
    file = '".$local['file']."',
    luot_xem = '".$local['luot_xem']."',
    hinh_anh = '".$local['hinh_anh']."',
    luot_tai = '".$local['luot_tai']."',
		ten_tap_tin = '".$local['ten_tap_tin']."',
	dung_luong = '".$local['dung_luong']."',
	loai_tep_tin = '".$local['loai_tep_tin']."',
    danh_muc = '".$local['danh_muc']."',
     noi_dung = '".$local['noi_dung']."',
    time = NOW()
    where id_download = '".(int)$id."'", 
    dbconnect());
} 


// phan trang
 function totaldownload(){
   $result = mysql_query("select * from download",dbconnect());
    return mysql_num_rows($result);
}
// xoa thu muc
 function deldownload($id){
    mysql_query("delete from download where id_download= '".(int)$id."'", dbconnect());
}   
?>