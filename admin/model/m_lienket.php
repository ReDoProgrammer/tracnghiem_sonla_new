<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertlienket($local){
    mysql_query("insert lien_ket set 
    tieu_de = '".$local['tieu_de']."',
    link = '".$local['link']."'
    ",
    dbconnect());
}

function getListlienket($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM lien_ket order by
    id_lien_ket desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function getlienket($id)
    {
    $pro = mysql_query("select * from lien_ket where id_lien_ket = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editlienket($id, $local)
{
    mysql_query("update lien_ket 
    set tieu_de ='".$local['tieu_de']."',
    link = '".$local['link']."'
    where id_lien_ket = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function dellienket($id){
    mysql_query("delete from lien_ket where id_lien_ket= '".(int)$id."'", dbconnect());
}
// phan trang
 function totallienket(){
   $result = mysql_query("select * from lien_ket",dbconnect());
    return mysql_num_rows($result);
}   
?>