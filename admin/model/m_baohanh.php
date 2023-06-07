<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */

function getListbaohanh()
    {
    $local_list = mysql_query("SELECT * FROM bao_hanh", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getbaohanh($id)
    {
    $pro = mysql_query("select * from bao_hanh where bao_hanh_id = '".(int)$id."'", dbconnect());
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