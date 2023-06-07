<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertthongbao($local){
    mysql_query("insert thong_bao set 
    tieu_de = '".clean($local['tieu_de'])."',
    thoi_gian = '".$local['thoi_gian']."',
    link = '".$local['link']."',
    noi_dung = '".$local['noi_dung']."',
    file = '".$local['file']."',
    time = NOW()
    ",
    dbconnect());
}

function getListthongbao($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM thong_bao order by
    id_thongbao desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getthongbao($id)
    {
    $pro = mysql_query("select * from thong_bao where id_thongbao = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editthongbao($id, $local)
{
    mysql_query("update thong_bao
    set tieu_de ='".clean($local['tieu_de'])."',
    thoi_gian = '".$local['thoi_gian']."',
    link = '".$local['link']."',
    noi_dung = '".$local['noi_dung']."',
    file = '".$local['file']."',
    time = NOW()
    where id_thongbao = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delthongbao($id){
    mysql_query("delete from thong_bao where id_thongbao= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalthongbao(){
   $result = mysql_query("select * from thong_bao",dbconnect());
    return mysql_num_rows($result);
}   
?>