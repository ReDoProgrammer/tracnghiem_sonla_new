<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertkhuyenhoc($local){
    mysql_query("insert khuyen_hoc set 
    tieu_de = '".clean($local['tieu_de'])."',
    
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
	luot_xem = '".$local['luot_xem']."',
    file = '".$local['file']."',
    time = NOW()
    ",
    dbconnect());
}

function getListkhuyenhoc($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM khuyen_hoc order by
    id_khuyenhoc desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getkhuyenhoc($id)
    {
    $pro = mysql_query("select * from khuyen_hoc where id_khuyenhoc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editkhuyenhoc($id, $local)
{
    mysql_query("update khuyen_hoc
    set tieu_de ='".clean($local['tieu_de'])."',

    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
	luot_xem = '".$local['luot_xem']."',
    file = '".$local['file']."',
    time = NOW()
    where id_khuyenhoc = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delkhuyenhoc($id){
    mysql_query("delete from khuyen_hoc where id_khuyenhoc= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalkhuyenhoc(){
   $result = mysql_query("select * from khuyen_hoc",dbconnect());
    return mysql_num_rows($result);
}   
?>