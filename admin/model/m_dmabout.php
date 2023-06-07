<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdmabout($local){
    mysql_query("insert dm_about set tieu_de = '".$local['tieu_de']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListdmabout()
    {
    $local_list = mysql_query("SELECT * FROM dm_about", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getdmabout($id)
    {
    $pro = mysql_query("select * from dm_about where id_dmabout = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdmabout($id, $local)
{
    mysql_query("update dm_about set tieu_de ='".$local['tieu_de']."',
    thu_tu = '".$local['thu_tu']."'
    where id_dmabout = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deldmabout($id){
    mysql_query("delete from dm_about where id_dmabout= '".(int)$id."'", dbconnect());
}

?>