<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertctkh($local){
    mysql_query("insert ctkh set 
    tieu_de = '".$local['tieu_de']."',
	dm_id = '".$local['dm_id']."',
    link = '".$local['link']."',
    noi_dung = '".$local['noi_dung']."',
    file = '".$local['file']."',
    time = NOW()
    ",
    dbconnect());
}

function getListctkh($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM ctkh order by
    id_ctkh desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getctkh($id)
    {
    $pro = mysql_query("select * from ctkh where id_ctkh = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editctkh($id, $local)
{
    mysql_query("update ctkh
    set tieu_de ='".$local['tieu_de']."',
	dm_id = '".$local['dm_id']."',
    link = '".$local['link']."',
    noi_dung = '".$local['noi_dung']."',
    file = '".$local['file']."',
    time = NOW()
    where id_thongbao = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delctkh($id){
    mysql_query("delete from ctkh where id_ctkh= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalctkh(){
   $result = mysql_query("select * from ctkh",dbconnect());
    return mysql_num_rows($result);
}   
?>