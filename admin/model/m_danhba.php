<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertdanhba($local){
    mysql_query("insert danh_ba set 
    ho_ten = '".$local['ho_ten']."',
    stt = '".$local['stt']."',
    email = '".$local['email']."',
    dien_thoai = '".$local['dien_thoai']."',
    chuc_vu = '".$local['chuc_vu']."',
    dia_chi = '".$local['dia_chi']."',
    to_chuc_id = '".$local['to_chuc_id']."',
    phong_ban = '".$local['phong_ban']."'",
    dbconnect());
}

function getListdanhba($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM danh_ba
LEFT JOIN danh_ba_dm ON danh_ba.to_chuc_id = danh_ba_dm.id
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListdm($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM danh_ba_dm
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    } 
    
//ham lay du lieu tu can bo
function getdanhba($id)
    {
    $pro = mysql_query("select * from danh_ba
    
     where id_danhba = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdanhba($id, $local)
{
    mysql_query("update danh_ba set 
	ho_ten ='".$local['ho_ten']."',
    email ='".$local['email']."',
    stt ='".$local['stt']."',
       chuc_vu = '".$local['chuc_vu']."',
    dia_chi = '".$local['dia_chi']."',
    to_chuc_id = '".$local['to_chuc_id']."',
    dien_thoai = '".$local['dien_thoai']."'
    where id_danhba = '".(int)$id."'", 
    dbconnect());
}     
// xoa thu muc
 function deldanhba($id){
    mysql_query("delete from danh_ba where id_danhba= '".(int)$id."'", dbconnect());
}
// phan trang
 function totaldanhba(){
   $result = mysql_query("select * from danh_ba",dbconnect());
    return mysql_num_rows($result);
}   
?>