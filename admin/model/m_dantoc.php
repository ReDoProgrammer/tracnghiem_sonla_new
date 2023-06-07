<?php

/**
 * @author nguyenbinh
 * @copyright 2012
 */
//add chuc danh
function insertDantoc($local){
    mysql_query("insert dan_toc set ten_dan_toc = '".$local['ten_dan_toc']."'", 
    dbconnect());
}
//list chuc danh
function getListDantoc()
    {
        $local_list = mysql_query("SELECT * FROM dan_toc", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//ham lay du lieu phong ban theo id
function getDantoc($id)
    {
    $pro = mysql_query("select * from dan_toc where dan_toc_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong muc sua
function editDantoc($id, $local)
{
    mysql_query("update dan_toc set ten_dan_toc ='".$local['ten_dan_toc']."'
    where dan_toc_id = '".(int)$id."'", dbconnect());
}
// xoa thu muc
function delChucdanh($id){
    mysql_query("DELETE from chuc_danh_can_bo where chuc_danh_id ='".(int)$id."'", dbconnect());
}

?>