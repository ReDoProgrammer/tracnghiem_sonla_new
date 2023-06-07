<?php

/**
 * @author liempv
 * @copyright 9/9/2021
 */
 
  function get_localtion($id)
    {
    $pro = mysql_query("select * from localtion where localtion_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
 
 
 
 
  function get_list_nhat_ky($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM nhat_ky
	left join regedit ON regedit.id_regedit = nhat_ky.user_id 
    order by
    id desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
 
  function total_nhat_ky(){
   $result = mysql_query("SELECT * FROM nhat_ky ",dbconnect());
    return mysql_num_rows($result);
}
 
 
 
 function get_list_huyen($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM localtion where parent_id ='0' 
    order by
    localtion_id asc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
 
 
 function get_list_tien_do_xu_ly($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM tien_do_xu_ly  
	left join regedit ON regedit.id_regedit = tien_do_xu_ly.uid 
	left join thong_tin on thong_tin.id_thongtin = tien_do_xu_ly.tin_id 
    order by
    tdxl_id desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
 
  function total_tdxl(){
   $result = mysql_query("SELECT * FROM tien_do_xu_ly ",dbconnect());
    return mysql_num_rows($result);
}
 
 
 function get_list_hs_by_data($local,$start,$limit){
     
        $sql = "select * from thong_tin 
		left join dia_phuong ON dia_phuong.dia_phuong_id = thong_tin.khu_vuc 
		where ho_ten like '%".$local['ho_ten']."%'  "; 
		
		if($local['tu'] && $local['den']){
			
		$sql .= " and id_thongtin BETWEEN '".$local['tu']."' AND '".$local['den']."'";
		
		}
		
		if($local['trang_thai']) {
			 
		 $sql .= " and tinh_trang = '".($local['trang_thai'])."'";
		 
		}
		
		if($local['huyen']) {
			 
		 $sql .= " and huyen = '".($local['huyen'])."'";
		 
		}
		 
		if($local['khu_vuc']) {
			 
		 $sql .= " and thong_tin.khu_vuc = '".($local['khu_vuc'])."'";
		 
		}
		
         
        $sql .= " order by id_thongtin desc limit ".(int)$start.",".(int)$limit."";
        
        $local_list = mysql_query($sql, dbconnect());    
        
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result[] = $local;
      
      }
      
    return $result;
}

 
 
  function get_list_hs_by_data2($local,$start,$limit){
     
        $sql = "select * from thong_tin 
		left join dia_phuong ON dia_phuong.dia_phuong_id = thong_tin.khu_vuc 
		where ho_ten like '%".$local['ho_ten']."%'  "; 
		
		if($local['tu_ngay'] && $local['den_ngay']){
			
	     $sql .= " AND (ngay_duyet BETWEEN CAST('".$local['tu_ngay']."' AS DATE) AND CAST('".$local['den_ngay']."' AS DATE)) ";
		
		}
		
		if($local['trang_thai']) {
			 
		 $sql .= " and tinh_trang = '".($local['trang_thai'])."'";
		 
		}
		
		if($local['huyen']) {
			 
		 $sql .= " and huyen = '".($local['huyen'])."'";
		 
		}
		 
		if($local['khu_vuc']) {
			 
		 $sql .= " and thong_tin.khu_vuc = '".($local['khu_vuc'])."'";
		 
		}
		
         
        $sql .= " order by id_thongtin desc limit ".(int)$start.",".(int)$limit."";
        
        $local_list = mysql_query($sql, dbconnect());    
        
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result[] = $local;
      
      }
      
    return $result;
}

 
 
 function totaltt2($local){
     
       $sql = "select * from thong_tin where ho_ten like '%".$local['ho_ten']."%'  "; 
		
		
		if($local['tu_ngay'] && $local['den_ngay']){
			
	     $sql .= " AND (ngay_duyet BETWEEN CAST('".$local['tu_ngay']."' AS DATE) AND CAST('".$local['den_ngay']."' AS DATE)) ";
		
		}
		
		if($local['trang_thai']) {
			 
		 $sql .= " and tinh_trang = '".($local['trang_thai'])."'";
		 
		}
		
		if($local['huyen']) {
			 
		 $sql .= " and huyen = '".($local['huyen'])."'";
		 
		}
		 
		if($local['khu_vuc']) {
			 
		 $sql .= " and khu_vuc = '".($local['khu_vuc'])."'";
		 
		}
		
         
        $sql .= "  ";
	   
	    $result = mysql_query($sql, dbconnect());  
		
	    return mysql_num_rows($result);

}
 
 
 
 
  function get_list_dia_phuong()
    {
    $local_list = mysql_query("SELECT * FROM dia_phuong  
   
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }  
 
 
     //get list danh muc   
    function get_list_trang_thai()
    {
    $local_list = mysql_query("SELECT * FROM trang_thai  
   
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }    
    
 
 
 function get_trang_thai($id)
    {
    $pro = mysql_query("select * from trang_thai where trang_thai_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
 
 
 
 //cap nhat trang thai ho so
function update_trang_thai($id, $local)
{
    mysql_query("update thong_tin set 
    tinh_trang = '".$local['tinh_trang']."', 
	but_phe = '".$local['but_phe']."' 
    where id_thongtin = '".(int)$id."'", 
    dbconnect());
}  
 
 
 // kiem tra da ton tai
 function check_email($m){
    $sql = "SELECT * FROM thongtin where email = '".$m."' limit 1 ";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}
 

     //ham tim kiem su dung m?nh de where va like
    function getListthongtinVoiThamSoNangCao1($hoten, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM thongtin 
    where ho_ten like '%".$hoten."%'

    order by

    id_thongtin desc

    limit ".(int)$start.",".(int)$limit."

        ", dbconnect());

        $result = array();

        while ($local = mysql_fetch_array($local_list)){

            $result []= $local;

        }

        return $result;

    }

    function totaltkmember($phantrang){
    $result = mysql_query("select * from regedit where tai_khoan like '%".$phantrang."%'",dbconnect());
    return mysql_num_rows($result);

    }  
//het tim kiem san pham 	 
	 
function getListtkthongtin($local,$limit,$start){
     
        $sql = "select * from thong_tin
     
        WHERE LCASE(ho_ten) like LCASE('%".$local['ho_ten']."%')";
 
        
         if($local['so_cmt']!=""){
            
            $sql .= "and lcase(cmt) like lcase('%".$local['so_cmt']."%')";
        }
		 
		 if($local['trang_thai']) {
		 $sql .= " and tinh_trang = '".($local['trang_thai'])."'";
		 }
         
        $sql .= " order by id_thongtin desc limit ".(int)$start.",".(int)$limit."";
        
        $local_list = mysql_query($sql, dbconnect());    
        
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result[] = $local;
      
      }
      
    return $result;
}






function totaltt($local){
     
       $sql = "select * from thong_tin where ho_ten like '%".$local['ho_ten']."%'  "; 
		
		if($local['tu'] && $local['den']){
			
		$sql .= " and id_thongtin BETWEEN '".$local['tu']."' AND '".$local['den']."'";
		
		}
		
		if($local['trang_thai']) {
			 
		 $sql .= " and tinh_trang = '".($local['trang_thai'])."'";
		 
		}
		
		if($local['huyen']) {
			 
		 $sql .= " and huyen = '".($local['huyen'])."'";
		 
		}
		 
		if($local['khu_vuc']) {
			 
		 $sql .= " and khu_vuc = '".($local['khu_vuc'])."'";
		 
		}
		
         
        $sql .= "  ";
	   
	    $result = mysql_query($sql, dbconnect());  
		
	    return mysql_num_rows($result);

}


function tt($local,$limit,$start){
     
     if($local){
        
      $sql = "select * from tin_tuc
       
        WHERE LCASE(tieu_de) like LCASE('%".$local['tieu_de']."%')";
        
        if($local['id_dm_nho']!=""){
            
            $sql .= "and id_dm_nho = '".$local['id_dm_nho']."'";
        }
        
        if($local['dm_id']!=""){
            
            $sql .= "dm_id = '".$local['dm_id']."'";
        }
        if($local['ky_hop_id']!=""){
            
            $sql .= "ky_hop_id = '".$local['ky_hop_id']."'";
        }
        if($local['tac_gia']!=""){
            
            $sql .= "and lcase(tac_gia) like lcase('%".$local['tac_gia']."%')";
        }
        
        if($local['startday'] && $local['endday']){
            
             $sql.=" and publish_date BETWEEN '".$local['starttime']."' AND '".$local['endtime']."' ";
        }
        
        $result = mysql_query($sql, dbconnect());    
         
      }
    return mysql_num_rows($result);

}
 


//add can bo
function insertthongtin($local){
    mysql_query("insert thongtin set 
	stt = '".$local['stt']."',
    ho_ten = '".$local['ho_ten']."',
	ngay_sinh = '".$local['ngay_sinh']."',
	so_cmt = '".$local['so_cmt']."',
	ngay_cap = '".$local['ngay_cap']."',
	noi_cap = '".$local['noi_cap']."',
	ten_co_quan = '".$local['ten_co_quan']."',
	tinh_thanh = '".$local['tinh_thanh']."',
	tochuc_canhan_id = '".$local['tochuc_canhan_id']."',
	chuc_vu = '".$local['chuc_vu']."',
	dia_chi = '".$local['dia_chi']."',
	chuc_danh = '".$local['chuc_danh']."',
	chung_thu_cu = '".$local['chung_thu_cu']."',
	ghi_chu = '".$local['ghi_chu']."',
	email1 = '".$local['email1']."',
	ma_chung_thu = '".$local['ma_chung_thu']."',
	ngay_bat_dau = '".$local['ngay_bat_dau']."',
	ngay_ket_thuc = '".$local['ngay_ket_thuc']."',
	tinh_trang = '".$local['tinh_trang']."',
	actives = '".$local['actives']."',
	xem = '".$local['xem']."',
	may_ban = '".$local['may_ban']."',
	add_date = '".$local['add_date']."',
	publish_date = '".$local['publish_date']."',
	goi_dang_ky = '".$local['goi_dang_ky']."',
	coquan_congtac = '".$local['coquan_congtac']."',
	dien_thoai = '".$local['dien_thoai']."',
    time = NOW(),
    email = '".$local['email']."'",
    dbconnect());
} 



function getListthongtin_theotrangthai($tt, $start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM thong_tin  where tinh_trang ='".$tt."'
    order by
    id_thongtin desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }


// phan trang
 function totalthongtin_theotrangthai($tt){
   $result = mysql_query("SELECT * FROM thong_tin WHERE tinh_trang = '".$tt."' ",dbconnect());
    return mysql_num_rows($result);
}


function getListthongtin($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM thong_tin  
    order by
    id_thongtin desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
	
	function getListthongtinactive($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM thongtin  where tinh_trang='1'
    order by
    id_thongtin desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
	
	
 //get list danh muc   
  
    function getListdmthongtin($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM thongtin
       
        where tochuc_canhan_id = '".$catid."'
        order by
        id_thongtin desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getdanhmucthongtin($id)
    {
    $pro = mysql_query("select * from thongtin
    where tochuc_canhan_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 

//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from thongtin where tochuc_canhan_id = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
  
} 	 
    //get list danh muc   
    function getListchude($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM chu_de 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }    
    
//ham lay du lieu
function getthongtin($id)
    {
    $pro = mysql_query("select * from thong_tin where id_thongtin = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editthongtin($id, $local)
{
    mysql_query("update thongtin set 
    stt = '".$local['stt']."',
    ho_ten = '".$local['ho_ten']."',
	ngay_sinh = '".$local['ngay_sinh']."',
	so_cmt = '".$local['so_cmt']."',
	ngay_cap = '".$local['ngay_cap']."',
	noi_cap = '".$local['noi_cap']."',
	ten_co_quan = '".$local['ten_co_quan']."',
	tinh_thanh = '".$local['tinh_thanh']."',
	tochuc_canhan_id = '".$local['tochuc_canhan_id']."',
	chuc_vu = '".$local['chuc_vu']."',
	ma_chung_thu = '".$local['ma_chung_thu']."',
	ngay_bat_dau = '".$local['ngay_bat_dau']."',
	ngay_ket_thuc = '".$local['ngay_ket_thuc']."',
	tinh_trang = '".$local['tinh_trang']."',
	dia_chi = '".$local['dia_chi']."',
	chuc_danh = '".$local['chuc_danh']."',
	chung_thu_cu = '".$local['chung_thu_cu']."',
	ghi_chu = '".$local['ghi_chu']."',
	email1 = '".$local['email1']."',
	actives = '".$local['actives']."',
	xem = '".$local['xem']."',
	add_date = '".$local['add_date']."',
	publish_date = '".$local['publish_date']."',
	may_ban = '".$local['may_ban']."',
	goi_dang_ky = '".$local['goi_dang_ky']."',
	coquan_congtac = '".$local['coquan_congtac']."',
	dien_thoai = '".$local['dien_thoai']."',
	email = '".$local['email']."',
	edit_time = NOW()
    where id_thongtin = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delthongtin($id){
    mysql_query("delete from thong_tin where id_thongtin= '".(int)$id."'", dbconnect());
}

// phan trang
 function totalthongtin(){
   $result = mysql_query("select * from thong_tin",dbconnect());
    return mysql_num_rows($result);
}

//getList bao cao vi pham

function getbaocao($id)
    {
    $pro = mysql_query("select * from bao_cao where id_bao_cao = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }

// xoa thu muc
 function delbaocao($id){
    mysql_query("delete from bao_cao where id_bao_cao= '".(int)$id."'", dbconnect());
}   
// phan trang
 function totalbaocao(){
   $result = mysql_query("select * from bao_cao",dbconnect());
    return mysql_num_rows($result);
} 

// tinh trang kiem duyet
function set_status($id,$status){
    mysql_query("update thongtin set 
    xem = '".$status."'
    where id_thongtin ='".$id."'", dbconnect());
}      

function insert_view_log($thongtin_id){
    mysql_query("insert view_log set 
	user_id = '".$_SESSION['user_id']."',
    thongtin_id = '".$thongtin_id."',
    t_view = NOW()",
    dbconnect());
}

function update_view($id,$view){
    mysql_query("update thongtin set 
    view = '".$view."'
    where id_thongtin ='".$id."'", dbconnect());
}    
 
?>