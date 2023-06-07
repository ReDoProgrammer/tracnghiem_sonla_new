<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertntm($local){
    mysql_query("insert ntm set 
    tieu_de = '".$local['tieu_de']."',
    bao_cao = '".$local['bao_cao']."',
    de_an = '".$local['de_an']."',
   quyet_dinh = '".$local['quyet_dinh']."',
	dm_id = '".$local['dm_id']."',

  time = NOW()
    ",
    dbconnect());
}

function getListntm($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM ntm
    LEFT JOIN dm_ntm ON ntm.dm_id = dm_ntm.id_dmntm 	
    
     order by
    id_ntm desc
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
    $local_list = mysql_query("SELECT * FROM dm_ntm 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    } 
    
//ham lay du lieu tu can bo
function getntm($id)
    {
    $pro = mysql_query("select * from ntm where id_ntm = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editntm($id, $local)
{
    mysql_query("update ntm set 
	tieu_de = '".$local['tieu_de']."',
    bao_cao = '".$local['bao_cao']."',
    de_an = '".$local['de_an']."',
   quyet_dinh = '".$local['quyet_dinh']."',
	dm_id = '".$local['dm_id']."',
    time = NOW()
    where id_ntm = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delntm($id){
    mysql_query("delete from ntm where id_ntm= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalntm(){
   $result = mysql_query("select * from ntm",dbconnect());
    return mysql_num_rows($result);
}   


// tinh trang kiem duyet
function set_status($id,$status){
    mysql_query("update ntm set 
    dang_tin = '".$status."'
    where id_ntm ='".$id."'", dbconnect());
}
?>