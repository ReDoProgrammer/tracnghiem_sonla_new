<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertMaytinh($local){
    mysql_query("insert may_tinh set
    ma_san_pham = '".$local['ma_san_pham']."',
    ten_san_pham = '".$local['ten_san_pham']."',
    hinh_anh = '".$local['hinh_anh']."',
    anh1 = '".$local['anh1']."',
    anh2 = '".$local['anh2']."',
    anh3 = '".$local['anh3']."',
    anh4 = '".$local['anh4']."',
    gia_san_pham = '".$local['gia_san_pham']."',
    bao_hanh = '".$local['bao_hanh']."',
    hang_san_xuat = '".$local['hang_san_xuat']."',
    kho_hang = '".$local['kho_hang']."',
    khuyen_mai = '".$local['khuyen_mai']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    danh_muc_cha_id = '".$local['ma_loai']."',
    danh_muc_con_id = '".$local['con_id']."',
    thoi_gian = NOW()
    ",
    dbconnect());
}

function getListMaytinh($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM may_tinh order by
    ma_may_tinh desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getMaytinh($id)
    {
    $pro = mysql_query("select * from may_tinh where ma_may_tinh = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editmaytinh($id, $local)
{
    mysql_query("update may_tinh set ma_san_pham ='".$local['ma_san_pham']."',
    ten_san_pham = '".$local['ten_san_pham']."',
    hinh_anh = '".$local['hinh_anh']."',
    gia_san_pham = '".$local['gia_san_pham']."',
    hang_san_xuat = '".$local['hang_san_xuat']."',
    kho_hang = '".$local['kho_hang']."',
    bao_hanh = '".$local['bao_hanh']."',
    khuyen_mai = '".$local['khuyen_mai']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    danh_muc_cha_id = '".$local['ma_loai']."',
    danh_muc_con_id = '".$local['con_id']."',
    thoi_gian = NOW()
    where ma_may_tinh = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delMaytinh($id){
    mysql_query("delete from may_tinh where ma_may_tinh= '".(int)$id."'", dbconnect());
}
  function getListDanhmuccha()
    {
    $local_list = mysql_query("SELECT * FROM loai_san_pham where danh_muc_cha = 0", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    } 
// phan trang
 function totalmaytinh(){
   $result = mysql_query("select * from may_tinh",dbconnect());
    return mysql_num_rows($result);
}       
?>