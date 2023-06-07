<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdmtieuchi($local){
    mysql_query("insert dm_tieuchi set 
    ten_dm = '".$local['ten_dm']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListdmtieuchi()
    {
    $local_list = mysql_query("SELECT * FROM dm_tieuchi ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getdmtieuchi($id)
    {
    $pro = mysql_query("select * from dm_tieuchi where id_dmtieuchi = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdmtieuchi($id, $local)
{
    mysql_query("update dm_tieuchi set 
    ten_dm ='".$local['ten_dm']."',
    thu_tu = '".$local['thu_tu']."'
    where id_dmtieuchi = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deldmtieuchi($id){
    mysql_query("delete from dm_tieuchi where id_dmtieuchi= '".(int)$id."'", dbconnect());
}

 function totaldmtieuchi(){
   $result = mysql_query("select * from dm_tieuchi",dbconnect());
    return mysql_num_rows($result);
}   
?>
