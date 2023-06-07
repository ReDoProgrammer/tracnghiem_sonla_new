<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertabout($local){
    mysql_query("insert about set 
    tieu_de = '".$local['tieu_de']."',
    dm_about = '".$local['dm_about']."',
    noi_dung = '".$local['noi_dung']."'
    ",
    dbconnect());
}

function getListabout()
    {
    $local_list = mysql_query("SELECT * FROM about
    
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
     function getListdmabout($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_about 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getabout($id)
    {
    $pro = mysql_query("select * from about where id_about = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editabout($id, $local)
{
    mysql_query("update about set 
	tieu_de ='".$local['tieu_de']."',
    noi_dung = '".$local['noi_dung']."'
    where id_about = '".(int)$id."'", 
    dbconnect());
} 

// xoa thu muc
 function delabout($id){
    mysql_query("delete from about where id_about= '".(int)$id."'", dbconnect());
}
   
?>