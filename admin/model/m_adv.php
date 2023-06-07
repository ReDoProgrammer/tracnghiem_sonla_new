<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
 //add
function insertadv($local){
    mysql_query("insert adv set 
    tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    lua_chon_id = '".$local['lua_chon_id']."',
	trang_moi = '".$local['trang_moi']."',
	view_id = '".$local['view_id']."',
   
   link = '".$local['link']."',
    time = NOW()
    ",

    dbconnect());
}
//list
function getListadv()
    {
    $local_list = mysql_query("SELECT * FROM adv 
    order by id_adv desc
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu 
function getadv($id)
    {
    $pro = mysql_query("select * from adv where id_adv = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editadv($id, $local)
{
    mysql_query("update adv set 
    tieu_de ='".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    lua_chon_id = '".$local['lua_chon_id']."',
	trang_moi = '".$local['trang_moi']."',
	view_id = '".$local['view_id']."',
    link = '".$local['link']."',
    time = NOW()
    where id_adv = '".(int)$id."'",
    dbconnect());
}   
 // xoa thu muc
 function deladv($id){
    mysql_query("delete from adv where id_adv= '".(int)$id."'", dbconnect());
}   
?>