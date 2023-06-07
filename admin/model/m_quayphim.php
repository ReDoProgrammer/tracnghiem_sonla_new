<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertQuayphim($local){
    mysql_query("insert quay_phim set tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    noi_dung = '".$local['noi_dung']."',
    file = '".$local['file']."',
    noi_bat = '".$local['noi_bat']."',
    video = '".$local['video']."',
    
    thoi_gian = NOW()
    ",
    dbconnect());
}

function getListQuayphim($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM quay_phim order by
    ma_quay_phim desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getquayphim($id)
    {
    $pro = mysql_query("select * from quay_phim where ma_quay_phim = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editquayphim($id, $local)
{
    mysql_query("update quay_phim set tieu_de ='".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    noi_dung = '".$local['noi_dung']."',
    file = '".$local['file']."',
    video = '".$local['video']."',
    noi_bat = '".$local['noi_bat']."',
    thoi_gian = NOW()
    where ma_quay_phim = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delQuayphim($id){
    mysql_query("delete from quay_phim where ma_quay_phim= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalquayphim(){
   $result = mysql_query("select * from quay_phim",dbconnect());
    return mysql_num_rows($result);
} 

// tinh trang kho hang
function set_status($id,$status){
    mysql_query("update quay_phim set 
    dang_tin = '".$status."'
    where ma_quay_phim ='".$id."'", dbconnect());
}  
?>