<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function inserttenalbum($local){
    mysql_query("insert ten_album set tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    noi_dung = '".$local['noi_dung']."',
    chu_de = '".$local['chu_de']."',
    thoi_gian = NOW()
    ",
    dbconnect());
}

function getListtenalbum($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM ten_album order by
    ma_ten_album desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function gettenalbum($id)
    {
    $pro = mysql_query("select * from ten_album where ma_ten_album = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function edittenalbum($id, $local)
{
    mysql_query("update ten_album set tieu_de ='".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    noi_dung = '".$local['noi_dung']."',
    chu_de = '".$local['chu_de']."',
    thoi_gian = NOW()
    where ma_ten_album = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deltenalbum($id){
    mysql_query("delete from ten_album where ma_ten_album= '".(int)$id."'", dbconnect());
}
// phan trang
 function totaltenalbum(){
   $result = mysql_query("select * from ten_album",dbconnect());
    return mysql_num_rows($result);
}  

function inserthinhanh($local){
    mysql_query("insert hinh_anh set hinh_anh = '".$local['hinh_anh']."',
    ma_album = '".$local['ma_album']."'
    ",
    dbconnect());
}
function getListhinhanh($id, $start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM hinh_anh where ma_album = '".$id."' order by
    ma_anh desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
 function gethinhanh($id)
    {
    $pro = mysql_query("select * from hinh_anh where ma_anh = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
//su anh
function edithinhanh($id, $local)
{
    mysql_query("update hinh_anh set hinh_anh = '".$local['hinh_anh']."'
    where ma_anh = '".(int)$id."'", 
    dbconnect());
}    
    
    
// xoa thu muc
 function delhinhanh($id){
    mysql_query("delete from hinh_anh where ma_anh= '".(int)$id."'", dbconnect());
}
?>