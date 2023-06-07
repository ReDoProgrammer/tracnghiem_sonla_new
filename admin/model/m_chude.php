<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertchude($local){
    mysql_query("insert chu_de set ten_chu_de = '".$local['ten_chu_de']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListchude()
    {
    $local_list = mysql_query("SELECT * FROM chu_de", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getchude($id)
    {
    $pro = mysql_query("select * from chu_de where id_chu_de = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editchude($id, $local)
{
    mysql_query("update chu_de set ten_chu_de ='".$local['ten_chu_de']."',
    thu_tu = '".$local['thu_tu']."'
    where id_chu_de = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delchude($id){
    mysql_query("delete from chu_de where id_chu_de= '".(int)$id."'", dbconnect());
}

?>