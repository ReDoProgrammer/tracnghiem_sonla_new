<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function inserthoctap($local){
    mysql_query("insert hoc_tap set 
    tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    danh_muc_id = '".$local['danh_muc_id']."',
    mo_ta = '".$local['mo_ta']."',
    video = '".$local['video']."',
    user_id = '".$_SESSION['user_id']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListhoctap($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM hoc_tap order by
    id_hoc_tap desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function gethoctap($id)
    {
    $pro = mysql_query("select * from hoc_tap where id_hoc_tap = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function edithoctap($id, $local)
{
    mysql_query("update hoc_tap 
    set tieu_de ='".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    danh_muc_id = '".$local['danh_muc_id']."',
    noi_dung = '".$local['noi_dung']."',
    video = '".$local['video']."',
    user_id = '".$_SESSION['user_id']."',
    time = NOW()
    where id_hoc_tap = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delhoctap($id){
    mysql_query("delete from hoc_tap where id_hoc_tap= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalhoctap(){
   $result = mysql_query("select * from hoc_tap",dbconnect());
    return mysql_num_rows($result);
}   
?>