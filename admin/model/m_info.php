<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertinfo($local){
    mysql_query("insert info set 
    tieu_de = '".$local['tieu_de']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListinfo($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM info order by
    id_info desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getinfo($id)
    {
    $pro = mysql_query("select * from info where id_info = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editinfo($id, $local)
{
    mysql_query("update info 
    set tieu_de ='".$local['tieu_de']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    where id_info = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delinfo($id){
    mysql_query("delete from info where id_info= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalinfo(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
    return mysql_num_rows($result);
}   
?>