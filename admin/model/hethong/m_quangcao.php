<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */

function getListQuangcao()
    {
    $local_list = mysql_query("SELECT * FROM quang_cao", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu 
function getquangcao($id)
    {
    $pro = mysql_query("select * from bao_hanh where ma_quang_cao = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editBaohanh($id, $local)
{
    mysql_query("update bao_hanh set tieu_de ='".$local['tieu_de']."',
    noi_dung = '".$local['noi_dung']."',
    thoi_gian = NOW()
    where bao_hanh_id = '".(int)$id."'", 
    dbconnect());
}   
    
?>