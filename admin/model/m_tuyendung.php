<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertTuyendung($local){
    mysql_query("insert tuyen_dung set tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    thoi_gian = NOW()
    ",
    dbconnect());
}

function getListTuyendung($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM tuyen_dung order by
    ma_tuyen_dung desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getTuyendung($id)
    {
    $pro = mysql_query("select * from tuyen_dung where ma_tuyen_dung = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editTuyendung($id, $local)
{
    mysql_query("update tuyen_dung set tieu_de ='".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    thoi_gian = NOW()
    where ma_tuyen_dung = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delTuyendung($id){
    mysql_query("delete from tuyen_dung where ma_tuyen_dung= '".(int)$id."'", dbconnect());
}
    
?>