<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertlinhvuc($local){
    mysql_query("insert dm_linhvuc set ten_linh_vuc = '".$local['ten_linh_vuc']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListlinhvuc()
    {
    $local_list = mysql_query("SELECT * FROM dm_linhvuc", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getlinhvuc($id)
    {
    $pro = mysql_query("select * from dm_linhvuc where id_dmlinhvuc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editlinhvuc($id, $local)
{
    mysql_query("update dm_linhvuc set ten_linh_vuc ='".$local['ten_linh_vuc']."',
    thu_tu = '".$local['thu_tu']."'
    where id_dmlinhvuc = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function dellinhvuc($id){
    mysql_query("delete from dm_linhvuc where id_dmlinhvuc= '".(int)$id."'", dbconnect());
}

?>