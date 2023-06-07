<?php

/**
 * @author liempv
 * @copyright 2012
 * @editor ReDo
 * @copyright 2023
 */
 
 function del_module_permision($id){
    mysql_query("delete from phan_quyen where id = '".(int)$id."'", dbconnect());
}

function add_quyen_module($uid, $uname, $this_time, $local){
    mysql_query("insert phan_quyen set
	module_name = '".$local['module_name']."',
	mo_ta = '".$local['mo_ta']."',
	add_date = '".$this_time."',
	user_name = '".$uname."',
	action = '".$local['action']."',
    	user_id = '".$uid."' ",
    dbconnect());
}


function get_list_modules($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM module
    LIMIT ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
	
	
function get_list_quyen_modul($user_id, $start, $limit)
    {
    $local_list = mysql_query("SELECT *, (select module_name from module where module.gia_tri = phan_quyen.module_name) as mo_ta FROM phan_quyen
    where user_id = '".$user_id."'  order by phan_quyen.module_name
    LIMIT ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
 function del_quyen_chuyen_muc($qcm_id){
    mysql_query("delete from quyen_chuyen_muc where qcm_id= '".(int)$qcm_id."'", dbconnect());
}
 
 function add_quyen_chuyen_muc($uid, $local){
    mysql_query("insert quyen_chuyen_muc set cm_id = '".$local['id']."',
    user_id = '".$uid."' ",
    dbconnect());
}

 
   function get_list_cha()
    {
        $local_list = mysql_query("SELECT * FROM dm_news
       
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
 
 function total_quyen_chuyen_muc($uid){
   $result = mysql_query("select * from quyen_chuyen_muc where user_id = '".$uid."'",dbconnect());
    return mysql_num_rows($result);
}

 
 function getCanbo($id)
    {
    $pro = mysql_query("select * from regedit where id_regedit = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
 
function get_list_quyen_chuyen_muc($user_id, $start, $limit)
    {
    $local_list = mysql_query("SELECT *, (select role_name from roles where role_id = regedit.role_id) as role_name FROM quyen_chuyen_muc
    left join regedit ON regedit.id_regedit = quyen_chuyen_muc.user_id
    left join dm_news ON dm_news.id = quyen_chuyen_muc.cm_id 
    where user_id = '".$user_id."' 
    LIMIT ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function get_list_roles($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM roles
    order by role_order asc
    LIMIT ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

     //ham tim kiem su dung m?nh de where va like
    function getListtkmember($taikhoan, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM regedit 
    where tai_khoan like '%".$taikhoan."%'

    order by

    id_regedit desc

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

//add can bo
function insertmember($local){
  mysql_query("insert regedit set 
    tai_khoan = '".$local['tai_khoan']."',
    ngay_sinh = '".$local['ngay_sinh']."',
    ho_ten = '".$local['ho_ten']."',
    password = '".$local['password']."',
    mobile = '".$local['mobile']."',
    avatar = '".$local['avatar']."',
     hinh_anh = '".$local['hinh_anh']."',
    email = '".$local['email']."',

    yahoo = '".$local['yahoo']."',
    dia_chi = '".$local['dia_chi']."',
    web = '".$local['web']."',
    phan_quyen = '".$local['phan_quyen']."',
    ngay_tham_gia = NOW()
    ",

    dbconnect());
}

function getListmember($start, $limit)
    {
    $local_list = mysql_query("SELECT *, m.id
    FROM members m
    left join roles ON m.role_id = roles.role_id
    order by m.id asc
    LIMIT ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getmember($id)
    {
    $pro = mysql_query("select * from members where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
	
	function getmember2($id)
    {
    $pro = mysql_query("select * from regedit where id_regedit = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editmember($id, $local)
{
    $sql = "UPDATE members 
    SET 
        birthdate = '".$local['ngay_sinh']."',
        fullname = '".$local['ho_ten']."', 
        province_code = '".$local['province_code']."',   
        district_code = '".$local['district_code']."',   
        ward_code = '".$local['ward_code']."',   
        address = '".$local['dia_chi']."',
        phone = '".$local['mobile']."',
        role_id = '".$local['role_id']."',
        web = '".$local['web']."',
        gender = '".$local['gioi_tinh']."',
        avatar = '".$local['avatar']."',
        role_id = '".$local['phan_quyen']."',
        email = '".$local['email']."',
    WHERE id = '".(int)$id."'";
   
    mysql_query($sql, dbconnect());
} 

function editmember1($id, $local)
{
    $sql = "UPDATE members 
    SET  
        fullname = '".$local['ho_ten']."',    

    WHERE id = '".(int)$id."'";
   
    mysql_query($sql, dbconnect());
}   
// xoa thu muc
 function delmember($id){
    mysql_query("delete from members where id= '".(int)$id."'", dbconnect());
}

function total(){
   $result = mysql_query("select * from members",dbconnect());
    return mysql_num_rows($result);
}


    
// kiem tra da ton tai
 function check_exist_local($name){
    $sql = "SELECT * FROM members where username = '".$name."'";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}

// kiem tra da ton tai
 function check_dn($dn){
    $sql = "SELECT * FROM members where username = '".$dn."'";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}
// kiem tra da ton tai
 function check_email($m){
    $sql = "SELECT * FROM members where email = '".$m."' limit 1 ";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}

function getAdmin($u,$pwd){
    $sql = "SELECT * FROM members
     left join roles on roles.role_id = members.role_id
     where username = '".escape($u)."' and password = '".escape($pwd)."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_fetch_array($result);
} 

function login($u,$pwd){
    $sql = "SELECT * FROM members where username = '".escape($u)."' and password = '".escape($pwd)."' limit 0,1";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
} 

function check_login($u,$pwd){
    $sql = "SELECT * FROM members where username = '".$u."' and password = '".$pwd."' ";
    $result = mysql_query($sql, dbconnect());
    return mysql_num_rows($result);
} 



//cap nhat trong thu muc sua
function editmember123($id, $local)
{
    $sql = "update regedit set ten_can_bo ='".$local['ten_can_bo']."',
    ngay_sinh = '".$local['ngay_sinh']."',
    ten_dang_nhap = '".$local['ten_dang_nhap']."',";
    if(!empty($local['mat_khau'])){
     $sql .=" mat_khau = '".hash('sha256',$local['mat_khau'])."',";
    }
    $sql .="
    chuc_danh_id = '".$local['chuc_danh_id']."',
    phong_ban_id = '".$local['phong_ban_id']."',
    dia_chi = '".$local['dia_chi']."',
    dien_thoai_noi_bo = '".$local['dien_thoai_noi_bo']."',
    dien_thoai_co_quan = '".$local['dien_thoai_co_quan']."',
    dien_thoai_nha_rieng = '".$local['dien_thoai_nha_rieng']."',
    di_dong = '".$local['di_dong']."',
    fax = '".$local['fax']."',
    email = '".$local['email']."',
    status = '".$local['status']."',
    dan_toc_id = '".$local['dan_toc_id']."'
    where id_regedit = '".(int)$id."'";
   
    mysql_query($sql, dbconnect());
}  

function editpass($id, $local)
{
    mysql_query("update regedit set    
    password = '".$local['password']."'
    where id_regedit = '".(int)$id."'", 
    dbconnect());

}    
//cai ham check mail dau ban//
//cai nay can kiem tra them l� nguoi dang dang nhap, neu so sanh moi mat khau khong thi se khong chinh x�c khi m� trong csdl c� 2 maatk kh?u v� t�nh gioongd nhau
 function kiemtramatkhau($pwd, $uid){
   $result = mysql_query("select * from regedit where password ='".$pwd."' and id_regedit = '".$uid."' limit 1 ",dbconnect());
   return mysql_num_rows($result);
   
} 

// lay dia chi ip va thoi gian dang lan dang nhap cuoi
function ip_time($id, $ip){
    mysql_query("update regedit set 
          add_ip = '".$ip."',
          time_login = NOW()
          where id_regedit = '".(int)$id."'", dbconnect());
    }

?>