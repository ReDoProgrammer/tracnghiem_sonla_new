<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdmdownload($local){
    mysql_query("insert dm_download set 
    ten_dm = '".$local['ten_dm']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListdmdownload()
    {
    $local_list = mysql_query("SELECT * FROM dm_download ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getdmdownload($id)
    {
    $pro = mysql_query("select * from dm_download where id_dmdownload = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdmdownload($id, $local)
{
    mysql_query("update dm_download set ten_dm ='".$local['ten_dm']."',
    thu_tu = '".$local['thu_tu']."'
    where id_dmdownload = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deldmdownload($id){
    mysql_query("delete from dm_download where id_dmdownload= '".(int)$id."'", dbconnect());
}

?>