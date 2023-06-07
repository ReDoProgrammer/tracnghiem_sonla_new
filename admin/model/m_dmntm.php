<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdmntm($local){
    mysql_query("insert dm_ntm set 
	ten_dm = '".$local['ten_dm']."',
	ten = '".$local['ten']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListdmntm()
    {
    $local_list = mysql_query("SELECT * FROM dm_ntm", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getdmntm($id)
    {
    $pro = mysql_query("select * from dm_ntm where id_dmntm = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdmntm($id, $local)
{
    mysql_query("update dm_ntm set 
	ten_dm = '".$local['ten_dm']."',
	ten = '".$local['ten']."',
     thu_tu = '".$local['thu_tu']."'
    where id_dmntm = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deldmntm($id){
    mysql_query("delete from dm_ntm where id_dmntm= '".(int)$id."'", dbconnect());
}


function update_vitri($id,$vt){
    mysql_query("update dm_ntm set 
    sap_xep = '".$vt."'
    where id_dmntm = '".(int)$id."'",
    dbconnect());
}

?>