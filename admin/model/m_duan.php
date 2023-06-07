<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertduan($local){
    mysql_query("insert du_an set 
    tieu_de = '".$local['tieu_de']."',
    mo_ta = '".$local['mo_ta']."',  
    hinh_anh = '".$local['hinh_anh']."',
    thong_tin = '".$local['thong_tin']."',	
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListduan($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM du_an
 
    order by
    id_duan desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
 // phan trang
 function totalduan(){
   $result = mysql_query("select * from du_an",dbconnect());
    return mysql_num_rows($result);
} 
    
//ham lay du lieu tu can bo
function getduan($id)
    {
    $pro = mysql_query("select * from du_an where id_duan = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editduan($id, $local)
{
    mysql_query("update du_an set 
    tieu_de = '".$local['tieu_de']."',
    mo_ta = '".$local['mo_ta']."',
    hinh_anh = '".$local['hinh_anh']."',  
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    where id_duan = '".(int)$id."'", 
    dbconnect());
} 

// xoa thu muc
 function delduan($id){
    mysql_query("delete from du_an where id_duan= '".(int)$id."'", dbconnect());
}   
?>