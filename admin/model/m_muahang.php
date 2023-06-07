<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo

function getListMuahang()
    {
    $local_list = mysql_query("SELECT * FROM mua_hang", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getMuahang($id)
    {
    $pro = mysql_query("select * from mua_hang where ma_mua_hang = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editMuahang($id, $local)
{
    mysql_query("update mua_hang set tieu_de ='".$local['tieu_de']."',
    noi_dung = '".$local['noi_dung']."',
    thoi_gian = NOW()
    where ma_mua_hang = '".(int)$id."'", 
    dbconnect());
}   
    
?>