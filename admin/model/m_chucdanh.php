<?php

/**
 * @author nguyenbinh
 * @copyright 2012
 */
//add chuc danh
function insertChucdanh($local){
    mysql_query("insert chuc_danh_can_bo set ten_chuc_danh = '".$local['ten_chuc_danh']."'", 
    dbconnect());
}
//list chuc danh
function getListChucdanh()
    {
        $local_list = mysql_query("SELECT * FROM chuc_danh_can_bo", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//ham lay du lieu phong ban theo id
function getChucdanh($id)
    {
    $pro = mysql_query("select * from chuc_danh_can_bo where chuc_danh_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong muc sua
function editChucdanh($id, $local)
{
    mysql_query("update chuc_danh_can_bo set ten_chuc_danh ='".$local['ten_chuc_danh']."'
    where chuc_danh_id = '".(int)$id."'", dbconnect());
}
// xoa thu muc
function delChucdanh($id){
    mysql_query("DELETE from chuc_danh_can_bo where chuc_danh_id ='".(int)$id."'", dbconnect());
}

?>