<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
 
//tin kiem van ban
//het tim kiem san pham 	 
	 
function getListtksanpham($local,$limit,$start){
     
        $sql = "select * from san_pham
     
        WHERE LCASE(tieu_de) like LCASE('%".$local['tieu_de']."%')";
 
              
		 
          if($local['muc_id']){
        $sql .= " AND muc_id = '".$local['muc_id']."'";
        }
        $sql .= " order by id_sp desc limit ".(int)$start.",".(int)$limit."";
        
        $local_list = mysql_query($sql, dbconnect());    
        
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result[] = $local;
      
      }
      
    return $result;
}

 function totaltt($local,$limit,$start){
     
     if($local){
        
      $sql = "select * from san_pham
        
        WHERE LCASE(tieu_de) like LCASE('%".($local['tieu_de'])."%')";
             
		 
        if($local['muc_id']){
        $sql .= " AND muc_id = '".$local['muc_id']."'";
        }
        
        
        
        $result = mysql_query($sql, dbconnect());    
       
      }
       return mysql_num_rows($result);

}
 
//add can bo
function insertsanpham($local){

    mysql_query("insert san_pham set
    tieu_de    = '".$local['tieu_de']."',
    hinh_anh   = '".$local['hinh_anh']."',
    anh1   = '".$local['anh1']."',
    anh2   = '".$local['anh2']."',
    anh3   = '".$local['anh3']."',
    anh4   = '".$local['anh4']."',
    video  = '".$local['video']."',
    gia  = '".$local['gia']."',
	khu_vuc  = '".$local['khu_vuc']."',
	web  = '".$local['web']."',
	phone  = '".$local['phone']."',
	
	don_vi  = '".$local['don_vi']."',
	xep_hang  = '".$local['xep_hang']."',
	ho_ten  = '".$local['ho_ten']."',
	
	mo_ta  = '".$local['mo_ta']."',
	
	dia_chi  = '".$local['dia_chi']."',
	email  = '".$local['email']."',
	fanpage  = '".$local['fanpage']."',
	
    tieu_bieu  = '".$local['tieu_bieu']."',
    noi_dung  = '".$local['noi_dung']."',
    dinh_dang = '".$local['dinh_dang']."',
    dung_luong  = '".$local['dung_luong']."',    
    muc_id  = '".$local['muc_id']."',
    so_luong   = '".$local['so_luong']."',
    time = NOW()
    ",
    dbconnect());
}

function getListsanpham($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM san_pham
    LEFT JOIN danh_muc_sp ON san_pham.muc_id = danh_muc_sp.id_danh_muc
    order by
    id_sp desc
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
    $local_list = mysql_query("SELECT * FROM danh_muc_sp
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }   
    
//ham lay du lieu tu can bo
function getsanpham($id)
    {
    $pro = mysql_query("select * from san_pham where id_sp = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editsanpham($id, $local)
{
    mysql_query("update san_pham set 
    tieu_de    = '".$local['tieu_de']."',
    hinh_anh   = '".$local['hinh_anh']."',
    anh1   = '".$local['anh1']."',
    anh2   = '".$local['anh2']."',
    anh3   = '".$local['anh3']."',
    anh4   = '".$local['anh4']."',
    gia  = '".$local['gia']."',
    don_vi  = '".$local['don_vi']."',
	xep_hang  = '".$local['xep_hang']."',
	ho_ten  = '".$local['ho_ten']."',
	
	mo_ta  = '".$local['mo_ta']."',
	
	web  = '".$local['web']."',
	phone  = '".$local['phone']."',
	dia_chi  = '".$local['dia_chi']."',
	email  = '".$local['email']."',
	fanpage  = '".$local['fanpage']."',
	khu_vuc  = '".$local['khu_vuc']."',
    video  = '".$local['video']."',
    tieu_bieu  = '".$local['tieu_bieu']."',
    noi_dung  = '".$local['noi_dung']."',
    dinh_dang = '".$local['dinh_dang']."',
    dung_luong  = '".$local['dung_luong']."',    
    muc_id  = '".$local['muc_id']."',
    so_luong   = '".$local['so_luong']."',
    time = NOW()
    where id_sp = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delsanpham($id){
    mysql_query("delete from san_pham where id_sp= '".(int)$id."'", dbconnect());
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
 function totalsanpham(){
   $result = mysql_query("select * from san_pham",dbconnect());
    return mysql_num_rows($result);
}
// tinh trang kho hang
function set_status($id,$status){
    mysql_query("update san_pham set 
    kho_hang = '".$status."'
    where id_sp ='".$id."'", dbconnect());
}       
?>