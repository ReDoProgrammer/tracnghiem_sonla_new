<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertthutuc($local){
    mysql_query("insert thu_tuc set 
    tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    
    
    trinh_tu = '".$local['trinh_tu']."',
    thuc_hien = '".$local['thuc_hien']."',
    cach_thuc = '".$local['cach_thuc']."',
    phap_ly = '".$local['phap_ly']."',
    ho_so = '".$local['ho_so']."',
    thoi_gian = '".$local['thoi_gian']."',
    doi_tuong = '".$local['doi_tuong']."',
    ket_qua = '".$local['ket_qua']."',
    le_phi = '".$local['le_phi']."',
    yeu_cau = '".$local['yeu_cau']."',
    
    donvi_id = '".$local['donvi_id']."',
    linhvuc_id = '".$local['linhvuc_id']."',
    file = '".$local['file']."',    
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListthutuc($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM thu_tuc
    
    LEFT JOIN dm_donvi ON thu_tuc.donvi_id = dm_donvi.id_donvi
    LEFT JOIN dm_linhvuc ON thu_tuc.linhvuc_id = dm_linhvuc.id_dmlinhvuc
    
     order by
    id_thutuc desc
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
    $local_list = mysql_query("SELECT * FROM dm_news 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    } 
    
//ham lay du lieu tu can bo
function getthutuc($id)
    {
    $pro = mysql_query("select * from thu_tuc where id_thutuc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editthutuc($id, $local)
{
    mysql_query("update thu_tuc 
    set tieu_de ='".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    file = '".$local['file']."',
    mo_ta = '".$local['mo_ta']."',
    
     trinh_tu = '".$local['trinh_tu']."',
    thuc_hien = '".$local['thuc_hien']."',
    cach_thuc = '".$local['cach_thuc']."',
    phap_ly = '".$local['phap_ly']."',
    ho_so = '".$local['ho_so']."',
    thoi_gian = '".$local['thoi_gian']."',
    doi_tuong = '".$local['doi_tuong']."',
    ket_qua = '".$local['ket_qua']."',
    le_phi = '".$local['le_phi']."',
    yeu_cau = '".$local['yeu_cau']."',
    
    donvi_id = '".$local['donvi_id']."',
    linhvuc_id = '".$local['linhvuc_id']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    where id_thutuc = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delthutuc($id){
    mysql_query("delete from thu_tuc where id_thutuc= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalthutuc(){
   $result = mysql_query("select * from thu_tuc",dbconnect());
    return mysql_num_rows($result);
}   


// tinh trang kho hang
function set_status($id,$status){
    mysql_query("update thu_tuc set 
    dang_tin = '".$status."'
    where id_thutuc ='".$id."'", dbconnect());
}


//get list danh muc   
    function getListdonvi($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_donvi 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
    //get list danh muc   
    function getListlinhvuc($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_linhvuc 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }    
?>