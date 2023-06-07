<?php

/**
 * @author nguyenbinh
 * @copyright 2012
 */
//add phong ban
function insertPhongban($local){
    mysql_query("insert phong_ban set ten_phong_ban = '".$local['ten_phong_ban']."'",
    dbconnect());
}
//list phong ban
function getListPhongBan()
    {
    $local_list = mysql_query("SELECT * FROM phong_ban", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu phong ban theo id
function getPhongban($id)
{
    $pro = mysql_query("select * from phong_ban where phong_ban_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    
}

//cap nhat trong muc sua
function editPhongban($id, $local)
{
    mysql_query("update phong_ban set ten_phong_ban ='".$local['ten_phong_ban']."'
    where phong_ban_id = '".(int)$id."'", dbconnect());
}
    
//xoa thu muc
function delphongban($id){
    mysql_query("delete from phong_ban where phong_ban_id= '".(int)$id."'", dbconnect());
}




?>