<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertlct($local){
    mysql_query("insert lich_cong_tac set 
    tieu_de = '".$local['tieu_de']."',
    luot_xem ='".$local['luot_xem']."',
    noi_dung = '".$local['noi_dung']."',
    file = '".$local['file']."',
    time = NOW()
    ",
    dbconnect());
}

function getListlct($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM lich_cong_tac order by
    id_lich desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getlct($id)
    {
    $pro = mysql_query("select * from lich_cong_tac where id_lich = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editlct($id, $local)
{
    mysql_query("update lich_cong_tac
    set tieu_de ='".$local['tieu_de']."',
    luot_xem ='".$local['luot_xem']."',
    noi_dung = '".$local['noi_dung']."',
    file = '".$local['file']."',
    time = NOW()
    where id_lich = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function dellct($id){
    mysql_query("delete from lich_cong_tac where id_lich= '".(int)$id."'", dbconnect());
}
// phan trang
 function totallct(){
   $result = mysql_query("select * from lich_cong_tac",dbconnect());
    return mysql_num_rows($result);
}   
?>