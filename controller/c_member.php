<?php

/**
 * @author honestphan
 * @copyright 2012
 */

$page = $_GET['act'];
switch ($page) {

    case 'logout':
        session_start();
        unset($_SESSION['profile']);
        $link_home = 'index.php?module=home';
        header('LOCATION: ' . $link_home);
        break;

    case 'login':
        require('view/member/login.tpl');      
        break;

    case 'register':
        require('view/member/register.tpl');   
        break;

    case 'profile':
        require('view/member/profile.tpl');  
        break;
    case 'change-profile':
            require('view/member/change-profile.tpl');  
            break;

    // case 'edit':
    //     $link_login = 'index.php?module=member&act=login';
    //     if (!$_SESSION['login']) {
    //         header('LOCATION: ' . $link_login);
    //         exit();
    //     }
    //     require('language/member/edit_member.php');
    //     $heading_title = heading_title;
    //     $ho_ten = ho_ten;
    //     $tai_khoan = tai_khoan;
    //     $may_ban = may_ban;
    //     $tai_khoan = tai_khoan;
    //     $di_dong = di_dong;
    //     $email = email;
    //     $ngay_sinh = ngay_sinh;

    //     $link_list = 'index.php?module=member&act=account';

    //     $id = $_REQUEST['id'];
    //     //$id = $_REQUEST['id'];
    //     $member = getmember($id);
    //     //vai loi. sao lai lay session, lay o $member


    //     if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    //         editmember($id, $_POST);
    //         $_SESSION['success'] = edit_success;
    //         $success = edit_success;
    //         //chuyen huong ve list
    //         //  echo "ok"; 
    //         header('LOCATION: ' . $link_list);
    //     }
    //     require('view/theme/default/template/home/header.tpl');
    //     require('view/theme/default/template/home/right.tpl');

    //     require('view/theme/default/template/member/edit.tpl');
    //     require('view/theme/default/template/home/footer.tpl');
    //     break;


    // case 'fpw':

    //     $heading_title = "Lấy mật khẩu mới";
    //     $button_continue = "Gửi đi";
    //     $captcha = 'system/captcha.php?type=string';




    //     require('view/theme/default/template/home/header.tpl');
    //     require('view/theme/default/template/home/right.tpl');
    //     require('view/theme/default/template/home/left.tpl');
    //     require('view/theme/default/template/member/fpw.tpl');
    //     require('view/theme/default/template/home/footer.tpl');
    //     break;

    // case 'account':
    //     $link_login = 'index.php?module=member&act=login';
    //     if (!$_SESSION['login']) {
    //         header('LOCATION: ' . $link_login);
    //         exit();
    //     }
    //     require('language/member/list_member.php');


    //     $heading_title = title;
    //     $title = title;

    //     // lay theo di chi id khi login 
    //     $member = getmember($_SESSION['member_id']);



    //     if ($_REQUEST['page'] == "") {
    //         $page = 1;
    //         $start = 1;
    //     } else {

    //         $page = $_REQUEST['page'];
    //     }
    //     //get input for class page
    //     $limit = 40;
    //     $start = ($page - 1) * $limit;

    //     $list_member = getListmember($start, $limit);

    //     $list_ctsonline = getListctsonline($_SESSION['member_id'], $start, $limit);
    //     $totalctsonline = totalctsonline($_SESSION['member_id']);

    //     require('view/theme/default/template/home/header.tpl');
    //     require('view/theme/default/template/member/tk.tpl');
    //     require('view/theme/default/template/home/right.tpl');

    //     require('view/theme/default/template/home/footer.tpl');
    //     break;




    // case 'view':
    //     $link_login = 'index.php?module=member&act=login';
    //     if (!$_SESSION['login']) {
    //         header('LOCATION: ' . $link_login);
    //         exit();
    //     }
    //     require('language/member/list_member.php');


    //     $heading_title = title;
    //     $title = title;

    //     // lay theo di chi id khi login 
    //     $id = $_REQUEST['id'];
    //     $cts = getctsol($id);
    //     if (!$cts) {
    //         header('LOCATION:' . $direction);
    //         exit();
    //     }



    //     require('view/theme/default/template/home/header.tpl');
    //     require('view/theme/default/template/member/view.tpl');
    //     require('view/theme/default/template/home/right.tpl');

    //     require('view/theme/default/template/home/footer.tpl');
    //     break;



    // case 'cpw':
    //     $link_login = 'index.php?module=member&act=login';
    //     if (!$_SESSION['login']) {
    //         header('LOCATION: ' . $link_login);
    //         exit();
    //     }
    //     require('language/member/cpw.php');
    //     $mat_khau_cu = mat_khau_cu;
    //     $mat_khau_moi = mat_khau_moi;
    //     $xac_nhan_mat_khau = xac_nhan_mat_khau;
    //     $heading_title = "Đổi mật khẩu mới";
    //     $button_continue = "Gửi đi";

    //     $link_list = 'index.php?module=member&act=account';
    //     $id = $_SESSION['member_id'];
    //     //$id = $_REQUEST['id'];
    //     $member = getmember($id);
    //     //vai loi. sao lai lay session, lay o $member

    //     //gio làm phan so sanh thi giong nhu kiem tra form dang ki thoi
    //     //so sanh 2 cá to day lam so sang bang java ban a chu chua lam so sanh php
    //     // bạn chu y de y ban chat mot chut
    //     // gio cung lam kieu valid form nhu hom qua thoi
    //     //so sánh 2 mạt khau xem trung nhau chua
    //     if (isset($_POST['submit'])) {

    //         if ($_POST['password'] == "") {
    //             $err['password'] = "Bạn phải nhập mật khẩu";
    //         }
    //         if (strlen($_POST['password']) < 4) {
    //             $err['password'] = "Độ dài phải lớn hơn or bằng 4 ký tự";
    //         }


    //         if ($_POST['password'] != $_POST['repass']) {
    //             $err['repass'] = "Mật khẩu xác nhận không đúng";
    //         }

    //         //  if($_POST['oldpass']==""){
    //         //neu mat khau cu de trong thi bao loi va dung tat ca moi viec
    //         //  $err['oldpass'] = "yeu cau cung cap  mat khau cu";

    //         //} else{
    //         //neu da nhap mat khau cu roi thi làm cac cong viec duoi day: so sanh mat khau cu vơi csdl cua thanh vien tuong ung
    //         //kiem tra mat khau cu// dung ma hoa md5 hay j md5
    //         //  $mkc = kiemtramatkhau(md5($_POST['oldpass']), $id);
    //         //neu mat khau nay dung so vơi trong csfl thi form valid
    //         //   if(!$mkc){
    //         //       $err['oldpass'] = "mat khau cu khong dung";
    //         // }
    //         // }

    //     }

    //     if (!$err) {
    //         $valid = true;
    //     } else {
    //         $valid = false;
    //     }

    //     if (($_SERVER['REQUEST_METHOD'] == 'POST') && $valid) {
    //         $_POST['password'] = md5($_POST['password']);
    //         editpass($id, $_POST);
    //         $_SESSION['success'] = "";
    //         $success = "Cập nhật mật khẩu thành công";
    //         //chuyen huong ve list
    //         //  echo "ok"; 
    //         header('LOCATION: ' . $link_list);
    //     }



    //     require('view/theme/default/template/home/header.tpl');
    //     require('view/theme/default/template/member/cpw.tpl');
    //     require('view/theme/default/template/home/right.tpl');


    //     require('view/theme/default/template/home/footer.tpl');
    //     break;

    // case 'note':


    //     $heading_title = title;
    //     $title = title;
    //     require('view/theme/default/template/home/header.tpl');
    //     require('view/theme/default/template/member/note.tpl');


    //     require('view/theme/default/template/home/footer.tpl');
    //     break;
}
