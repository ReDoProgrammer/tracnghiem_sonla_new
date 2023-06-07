<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
 
    function getListtktentieuchi($sp, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM tieu_chi 

    where tieu_de like '%".$sp."%'

    order by

    id_tieuchi desc

    limit ".(int)$start.",".(int)$limit."

        ", dbconnect());

        $result = array();

        while ($local = mysql_fetch_array($local_list)){

            $result []= $local;

        }

        return $result;

    }

    function totaltktentieuchi($phantrang){
    $result = mysql_query("select * from tieu_chi where tieu_de like '%".$phantrang."%'",dbconnect());
    return mysql_num_rows($result);

    }  
//het tim kiem san pham
 
//add can bo
function inserttieuchi($local){

    mysql_query("insert tieu_chi set
    tieu_de    = '".$local['tieu_de']."',
    mo_ta   = '".$local['mo_ta']."',
    noi_dung  = '".$local['noi_dung']."',
	files  = '".$local['files']."',
	dmtieuchi_id  = '".$local['dmtieuchi_id']."',
	luot_xem  = '".$local['luot_xem']."',
    time = NOW()
    ",
    dbconnect());
}

function getListtieuchi($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM tieu_chi
    LEFT JOIN dm_tieuchi ON tieu_chi.dmtieuchi_id = dm_tieuchi.id_dmtieuchi
    order by
    id_tieuchi desc
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
    $local_list = mysql_query("SELECT * FROM dm_tieuchi
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }   
    
//ham lay du lieu tu can bo
function gettieuchi($id)
    {
    $pro = mysql_query("select * from tieu_chi where id_tieuchi = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function edittieuchi($id, $local)
{
    mysql_query("update tieu_chi set 
       tieu_de    = '".$local['tieu_de']."',
    mo_ta   = '".$local['mo_ta']."',
    noi_dung  = '".$local['noi_dung']."',
	files  = '".$local['files']."',
	dmtieuchi_id  = '".$local['dmtieuchi_id']."',
	luot_xem  = '".$local['luot_xem']."',
    time = NOW()
    where id_tieuchi = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deltieuchi($id){
    mysql_query("delete from tieu_chi where id_tieuchi= '".(int)$id."'", dbconnect());
}
  function getListDanhmuccha()
    {
    $local_list = mysql_query("SELECT * FROM loai_tieu_chi where danh_muc_cha = 0", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    } 
// phan trang
 function totaltieuchi(){
   $result = mysql_query("select * from tieu_chi",dbconnect());
    return mysql_num_rows($result);
}
// tinh trang kho hang
function set_status($id,$status){
    mysql_query("update tieu_chi set 
    kho_hang = '".$status."'
    where id_tieuchi ='".$id."'", dbconnect());
}       
?>