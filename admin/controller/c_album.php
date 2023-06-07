<?php

/**
 * @author honestphan
 * @copyright 2012
 */
if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_album.php');
include('controller/c_block.php');
$page = $_GET['act'];
switch ($page) {
    case 'list':
        //Get language
        require('language/album/list_album.php');
        $heading_title = heading_title;
        $button_add = button_add;
        $button_edit = button_edit;
        $button_delete = button_delete;

        $tieu_de = tieu_de;
        $hinh_anh = hinh_anh;
        $chu_de = chu_de;
        $thoi_gian = thoi_gian;
        $cot_thao_tac = cot_thao_tac;
        $link_add = 'index.php?module=album&act=add';


        if ($_REQUEST['page'] == "") {
            $page = 1;
            $start = 1;

        } else {

            $page = $_REQUEST['page'];

        }
        //get input for class page
        $limit = 10;
        $start = ($page - 1) * $limit;


        $list_tenalbum = getListtenalbum($start, $limit);

        $total = totaltenalbum();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=album&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



        require('view/template/album/list_album.tpl');
        break;

    //case them can bo
    case 'add':
        require('language/album/add_album.php');

        $heading_title = heading_title;
        $tieu_de = tieu_de;
        $hinh_anh = hinh_anh;
        $chu_de = chu_de;
        $noi_dung = noi_dung;
        $thoi_gian = thoi_gian;

        $link_list = 'index.php?module=album&act=list';

        $_SESSION['tieude'] = $_POST['tieu_de'];
        if ($_POST['tieu_de'] == "") {
            $err['exist'] = 'Nhâp tiêu đề cho bài viết';
            $error_tieude = $err['exist'];
        }
        $_SESSION['pic'] = $_POST['hinh_anh'];

        if ($_POST['hinh_anh'] == "") {
            $err['exist'] = 'Chọn ảnh đại diện';
            $error_pic = $err['exist'];
        }

        $_SESSION['chude'] = $_POST['chu_de'];
        if ($_POST['chu_de'] == "false") {
            $err['exist'] = 'Lựa chọn danh mục chủ để';
            $error_chude = $err['exist'];
        }

        if (!$err) {
            $valid = true;
        } else {
            $valid = false;
        }

        if (($_SERVER['REQUEST_METHOD'] == 'POST') && $valid) {
            inserttenalbum($_POST);
            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }


        require('view/template/album/add_album.tpl');
        break;
    //case edit gioi thieu
    case 'edit':
        require('language/album/edit_album.php');
        $heading_title = heading_title;
        $tieu_de = tieu_de;
        $hinh_anh = hinh_anh;
        $noi_dung = noi_dung;
        $chu_de = chu_de;
        $thoi_gian = thoi_gian;
        $link_list = 'index.php?module=album&act=list';
        $id = $_REQUEST['id'];
        $tenalbum = gettenalbum($id);


        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            edittenalbum($id, $_POST);
            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }


        require('view/template/album/edit_album.tpl');
        break;

    case 'del':
        get_file('language/album/del_album.php');
        $link_list = 'index.php?module=album&act=list';
        $id = $_REQUEST['id'];
        deltenalbum($id);
        $_SESSION['success'] = del_success;
        //chuyen huong ve list
        header('LOCATION: ' . $link_list);
        exit();

        break;


    case 'upanh':
        require('language/album/add_album.php');

        $heading_title = heading_title;
        $tieu_de = tieu_de;
        $hinh_anh = hinh_anh;
        $chu_de = chu_de;
        $noi_dung = noi_dung;
        $thoi_gian = thoi_gian;
        $up_anh = up_anh;


        $_SESSION['quaylai'] = $ref = "http://" . eregi_replace("/$", "", (getenv(HTTP_HOST) ? getenv(HTTP_HOST) : $_SERVER['HTTP_HOST']) . (getenv(REQUEST_URI) ? getenv(REQUEST_URI) : $_SERVER['REQUEST_URI']));


        if ($_POST['hinh_anh'] == "") {
            $err['exist'] = 'Lựa chọn anh';
            $error_anh = $err['exist'];
        }

        if (!$err) {
            $valid = true;
        } else {
            $valid = false;
        }

        if (($_SERVER['REQUEST_METHOD'] == 'POST') && $valid) {

            $_POST['ma_album'] = $_REQUEST['id'];
            inserthinhanh($_POST);
            $_SESSION['success'] = 'Thêm ảnh vào album thành công';
            //chuyen huong ve list

        }

        //get list anh album
        $id = $_REQUEST['id'];
        $start = 0;
        $limit = 200;

        $list_hinhanh = getListhinhanh($id, $start, $limit);

        require('view/template/album/add_anh.tpl');
        break;

    case 'xem':
        require('language/album/xem_album.php');
        $heading_title = heading_title;
        $button_add = button_add;
        $button_edit = button_edit;
        $button_delete = button_delete;

        $tieu_de = tieu_de;
        $hinh_anh = hinh_anh;
        $chu_de = chu_de;
        $thoi_gian = thoi_gian;
        $cot_thao_tac = cot_thao_tac;
        $link_add = 'index.php?module=album&act=add';
        $_SESSION['quaylai'] = $ref = "http://" . eregi_replace("/$", "", (getenv(HTTP_HOST) ? getenv(HTTP_HOST) : $_SERVER['HTTP_HOST']) . (getenv(REQUEST_URI) ? getenv(REQUEST_URI) : $_SERVER['REQUEST_URI']));

        if ($_REQUEST['page'] == "") {
            $page = 1;
            $start = 1;

        } else {

            $page = $_REQUEST['page'];

        }
        //get input for class page
        $limit = 50;
        $start = ($page - 1) * $limit;
        $id = $_REQUEST['id'];
        //$hinhanh = gethinhanh($id);
        $list_hinhanh = getListhinhanh($id, $start, $limit);

        //$total = totaltenalbum();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=album&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

        require('view/template/album/xem_album.tpl');
        break;

    //cese edit hinh anh


    case 'editanh':
        require('language/album/edit_album.php');
        $heading_title = heading_title;
        $tieu_de = tieu_de;
        $hinh_anh = hinh_anh;
        $noi_dung = noi_dung;
        $chu_de = chu_de;
        $thoi_gian = thoi_gian;
        $link_list = 'index.php?module=album&act=upanh';
        $id = $_REQUEST['id'];
        $list_hinhanh = getListhinhanh($id, $start, $limit);
        $hinhanh = gethinhanh($id);


        $back = $_SESSION['quaylai'];
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            edithinhanh($id, $_POST);
            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $back);

        }


        require('view/template/album/edit_anh.tpl');
        break;
    //cham xoa hinh anh
    case 'xoaanh':
        // get_file('language/tenalbum/del_anh.php');
        $link_list = 'index.php?module=album&act=list';
        $back = $_SESSION['quaylai'];
        $id = $_REQUEST['id'];
        delhinhanh($id);
        $_SESSION['success'] = del_success;
        //chuyen huong ve list
        header('LOCATION: ' . $back);
        exit();

        break;


}


?>