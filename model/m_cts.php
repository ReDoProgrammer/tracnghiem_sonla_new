<?php

/**
 * @author nbinh88@gmail.com
 * @copyright 27/08/2013
 */
 
     function getcattin($id)
    {
    $pro = mysql_query("select * from cts where tochuc_canhan_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
 
 
 // kiem tra da ton tai
 function check_email($m){
    $sql = "SELECT * FROM cts where email = '".$m."' limit 1 ";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}
 

     //ham tim kiem su dung m?nh de where va like
    function getListctsVoiThamSoNangCao1($hoten, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM cts 
    where ho_ten like '%".$hoten."%'

    order by

    id_cts desc

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
	 
function getListtkcts($local,$limit,$start){
     
        $sql = "select * from cts
     
        WHERE LCASE(ho_ten) like LCASE('%".$local['ho_ten']."%')";
 
        
         if($local['so_cmt']!=""){
            
            $sql .= "and lcase(so_cmt) like lcase('%".$local['so_cmt']."%')";
        }
		 
          if($local['tochuc_canhan_id']){
        $sql .= " AND tochuc_canhan_id = '".$local['tochuc_canhan_id']."'";
        }
        $sql .= " order by id_cts desc limit ".(int)$start.",".(int)$limit."";
        
        $local_list = mysql_query($sql, dbconnect());    
        
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result[] = $local;
      
      }
      
    return $result;
}

 function totaltt($local,$limit,$start){
     
     if($local){
        
      $sql = "select * from cts
        
        WHERE LCASE(ho_ten) like LCASE('%".($local['ho_ten'])."%')";
             
        if($local['so_cmt']!=""){
            
            $sql .= "and so_cmt = '".($local['so_cmt'])."'";
        }
		 
        if($local['tochuc_canhan_id']){
        $sql .= " AND tochuc_canhan_id = '".$local['tochuc_canhan_id']."'";
        }
        
        
        
        $result = mysql_query($sql, dbconnect());    
       
      }
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
function insertcts($local){
    mysql_query("insert cts set 
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
	user_id  = '".$_SESSION['member_id']."',
	chuc_danh = '".$local['chuc_danh']."',
	chung_thu_cu = '".$local['chung_thu_cu']."',
	ghi_chu = '".$local['ghi_chu']."',
	email1 = '".$local['email1']."',
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

function getListcts($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM cts
    order by
    id_cts desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
 //get list danh muc   
  
    function getListdmcts($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM cts
       
        where tochuc_canhan_id = '".$catid."'
        order by
        id_cts desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getdanhmuccts($id)
    {
    $pro = mysql_query("select * from cts
    where tochuc_canhan_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 

//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from cts where tochuc_canhan_id = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
  
} 	 
    //get list danh muc   
   
//ham lay du lieu
function getcts($id)
    {
    $pro = mysql_query("select * from cts where id_cts = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editcts($id, $local)
{
    mysql_query("update cts set 
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
	user_id  = '".$_SESSION['member_id']."',
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
    where id_cts = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function delcts($id){
    mysql_query("delete from cts where id_cts= '".(int)$id."'", dbconnect());
}

// phan trang
 function totalcts(){
   $result = mysql_query("select * from cts",dbconnect());
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
    mysql_query("update cts set 
    xem = '".$status."'
    where id_cts ='".$id."'", dbconnect());
}      

function insert_view_log($cts_id){
    mysql_query("insert view_log set 
	user_id = '".$_SESSION['user_id']."',
    cts_id = '".$cts_id."',
    t_view = NOW()",
    dbconnect());
}

function update_view($id,$view){
    mysql_query("update cts set 
    view = '".$view."'
    where id_cts ='".$id."'", dbconnect());
}    
 
?>