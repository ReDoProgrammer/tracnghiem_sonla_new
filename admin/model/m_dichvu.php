<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertnews($local){
    mysql_query("insert tin_tuc set 
    tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListnews($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM tin_tuc order by
    id_news desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getnews($id)
    {
    $pro = mysql_query("select * from tin_tuc where id_news = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editnews($id, $local)
{
    mysql_query("update tin_tuc 
    set tieu_de ='".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    where id_news = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delnews($id){
    mysql_query("delete from tin_tuc where id_news= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalnews(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
    return mysql_num_rows($result);
}   
?>