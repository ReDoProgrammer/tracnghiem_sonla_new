<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertsukien($local){
    mysql_query("insert su_kien set 
    tieu_de = '".$local['tieu_de']."',
    mo_ta = '".$local['mo_ta']."',
  
    hinh_anh = '".$local['hinh_anh']."',
   
 
   
	
	
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListsukien($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM su_kien
 
    order by
    id_sukien desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
  
    
//ham lay du lieu tu can bo
function getsukien($id)
    {
    $pro = mysql_query("select * from su_kien where id_sukien = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editsukien($id, $local)
{
    mysql_query("update su_kien set 
    tieu_de = '".$local['tieu_de']."',
    mo_ta = '".$local['mo_ta']."',
    hinh_anh = '".$local['hinh_anh']."',  
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    where id_sukien = '".(int)$id."'", 
    dbconnect());
} 

// xoa thu muc
 function delsukien($id){
    mysql_query("delete from su_kien where id_sukien= '".(int)$id."'", dbconnect());
}   
?>