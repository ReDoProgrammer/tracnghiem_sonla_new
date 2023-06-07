<?php
ob_start();
/**
 * @author honest
 * @copyright 2012
 */

define('DSVH', 1);

session_start();

if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
include('controller/c_block.php');
include('model/m_vanban.php');
$page = $_GET['act'];
switch ($page) {
    case 'list':
        //Get language
        require('language/vanban/list_vanban.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $button_add = button_add;
        $button_edit = button_edit;
        $button_delete = button_delete;

        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $thao_tac = thao_tac;
        $link_add = 'index.php?module=vanban&act=add';

        $timkiem = tim_kiem;
        $sohieu = so_hieu;

        //lấy danh sach bang tin
        //assign input data from form to the SESSION
        $_SESSION['ten'] = $_POST['ten'];
        $_SESSION['so_hieu'] = $_POST['so_hieu'];
        $_SESSION['ngay_ban_hanh'] = $_POST['ngay_ban_hanh'];
        $_SESSION['noi_ban_hanh_id'] = $_POST['noi_ban_hanh_id'];
        $_SESSION['loai_van_ban_id'] = $_POST['loai_van_ban_id'];

        if ($_REQUEST['page'] == "") {
            $page = 1;
        } else {

            $page = (int) $_REQUEST['page'];

        }
        //get input for class page
        $limit = 40;
        $start = ($page - 1) * $limit;

        $list_loaivanban = getlistloaivanban(0, 100);
        $list_noibanhanh = getlistnoibanhanh(0, 100);


        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $list_vanban = getListVanBanVoiThamSoNangCao($_POST, $limit, $start);
            $total = tt($_POST, $limit, $start);

        } else {

            if (isset($_REQUEST['nbh'])) {
                $data['noi_ban_hanh_id'] = (int) $_REQUEST['nbh'];
                $_SESSION['noi_ban_hanh_id'] = (int) $_REQUEST['nbh'];
                $list_vanban = getListVanBanVoiThamSoNangCao($data, $limit, $start);
                //$total = tt($data,$limit,$start);
            } else {
                $list_vanban = getListvanban($start, $limit);
                $total = totalvanban();
            }
        }


        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=vanban&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
        $heading_title = heading_title . " (" . $total . " văn bản)";

        require('view/template/vanban/list_vanban.tpl');
        break;

    //case them chuc danh
    case 'add':
        require('language/vanban/add_vanban.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $motachitiet = mo_ta_chi_tiet;
        $motachung = mo_ta_chung;
        $hinhdaidien = hinh_dai_dien;

        $link_list = 'index.php?module=vanban&act=list';
        $list_loaivanban = listloaivanban();
        $list_noibanhanh = listnoibanhanh();


        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            insertvanban($_POST);
            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }
        require('view/template/vanban/add_vanban.tpl');
        break;

    //case sua dan toc
    case 'edit':
        require('language/vanban/edit_vanban.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $motachitiet = mo_ta_chi_tiet;
        $motachung = mo_ta_chung;
        $hinhdaidien = hinh_dai_dien;

        $link_list = 'index.php?module=vanban&act=list';
        $id = $_REQUEST['id'];
        $vanban = getvanban($id);

        $list_loaivanban = listloaivanban();
        $list_noibanhanh = listnoibanhanh();

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            editvanban($id, $_POST);

            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }


        require('view/template/vanban/edit_vanban.tpl');
        break;

    case 'del':
        get_file('language/vanban/del_vanban.php');
        $link_list = 'index.php?module=vanban&act=list';
        $id = $_REQUEST['id'];
        $vanbann = getvanban($id);
        if ($vanbann['avatar']) {
            unlink('./data/image/vanban/' . $vanban['avatar']);
        }
        delvanban($id);
        $_SESSION['success'] = del_success;
        //chuyen huong ve list
        header('LOCATION: ' . $link_list);
        exit();

        break;

    case 'loaivanban':
        //Get language
        require('language/vanban/list_loaivanban.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $button_add = button_add;
        $button_edit = button_edit;
        $button_delete = button_delete;

        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $thao_tac = thao_tac;
        $link_add = 'index.php?module=vanban&act=add_loaivanban';

        $this_time = vntime_now();
        $action = "Truy cập khu vực văn bản";
        $action_name = "vew_tdxl";
        $agent = $_SERVER['HTTP_USER_AGENT'];
        $aip = $_SERVER['REMOTE_ADDR'];
        write_logs($action, $action_name, $agent, $aip, $this_time);

        if ($_POST['selected'] == "") {
            $err['exist'] = chua_chon;
            $error_name = $err['exist'];
        }
        if (!$err) {
            $valid = true;
        } else {
            $valid = false;
        }

        if ($_REQUEST['page'] == "") {
            $page = 1;
        } else {
            $page = $_REQUEST['page'];
        }
        //get input for class page
        $limit = 10;
        $start = ($page - 1) * $limit;

        //kiem tra du lieu cua from
        if (($_SERVER['REQUEST_METHOD'] == 'POST') && $valid) {
            foreach ($_POST['selected'] as $id) {

                delloaivanban($id);

            }
            $_SESSION['success'] = del_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }

        $list_loaivanban = getlistloaivanban($start, $limit);
        $total = totalloaivanban();

        $heading_title = heading_title . " (" . $total . " loại văn bản)";

        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=loaivanban&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();


        require('view/template/vanban/list_loaivanban.tpl');
        break;

    case 'edit_loaivanban':
        require('language/vanban/edit_loaivanban.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $motachitiet = mo_ta_chi_tiet;
        $motachung = mo_ta_chung;
        $hinhdaidien = hinh_dai_dien;

        $link_list = 'index.php?module=vanban&act=loaivanban';
        $id = $_REQUEST['id'];
        $loaivanban = getloaivanban($id);

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            editloaivanban($id, $_POST);
            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }

        require('view/template/vanban/edit_loaivanban.tpl');
        break;

    case 'del_loaivanban':

        $link_list = 'index.php?module=vanban&act=loaivanban';
        $id = $_REQUEST['id'];
        delloaivanban($id);
        $_SESSION['success'] = del_success;
        //chuyen huong ve list
        header('LOCATION: ' . $link_list);
        exit();


        break;


    case 'add_loaivanban':
        require('language/vanban/add_loaivanban.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $motachitiet = mo_ta_chi_tiet;
        $motachung = mo_ta_chung;
        $hinhdaidien = hinh_dai_dien;

        $link_list = 'index.php?module=vanban&act=loaivanban';


        if ($_POST['ten_loai_van_ban'] == "") {
            $err['exist'] = chua_nhap_ten;
            $error_name = $err['exist'];
        }
        if (!$err) {
            $valid = true;
        } else {
            $valid = false;
        }
        if (($_SERVER['REQUEST_METHOD'] == 'POST') && $valid) {

            insertloaivanban($_POST);

            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }
        require('view/template/vanban/edit_loaivanban.tpl');
        break;


    //noi ban hanh
    case 'noibanhanh':
        //Get language
        require('language/vanban/list_noibanhanh.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $button_add = button_add;
        $button_edit = button_edit;
        $button_delete = button_delete;

        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $thao_tac = thao_tac;
        $link_add = 'index.php?module=vanban&act=add_noibanhanh';

        if ($_POST['selected'] == "") {
            $err['exist'] = chua_chon;
            $error_name = $err['exist'];
        }
        if (!$err) {
            $valid = true;
        } else {
            $valid = false;
        }

        if ($_REQUEST['page'] == "") {
            $page = 1;
        } else {
            $page = $_REQUEST['page'];
        }
        //get input for class page
        $limit = 10;
        $start = ($page - 1) * $limit;

        //kiem tra du lieu cua from
        if (($_SERVER['REQUEST_METHOD'] == 'POST') && $valid) {
            foreach ($_POST['selected'] as $id) {

                delnoibanhanh($id);

            }
            $_SESSION['success'] = del_success;

            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }

        $list_noibanhanh = getlistnoibanhanh($start, $limit);
        $total = totalnoibanhanh();
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=noibanhanh&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
        $heading_title = heading_title;

        require('view/template/vanban/list_noibanhanh.tpl');
        break;

    case 'edit_noibanhanh':
        require('language/vanban/edit_noibanhanh.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $motachitiet = mo_ta_chi_tiet;
        $motachung = mo_ta_chung;
        $hinhdaidien = hinh_dai_dien;

        $link_list = 'index.php?module=vanban&act=noibanhanh';
        $id = $_REQUEST['id'];
        $noibanhanh = getnoibanhanh($id);

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            editnoibanhanh($id, $_POST);
            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }

        require('view/template/vanban/edit_noibanhanh.tpl');
        break;


    case 'add_noibanhanh':
        require('language/vanban/add_noibanhanh.php');
        $heading_title = heading_title;
        $title = $heading_title;
        $ma_van_ban = ma_van_ban;
        $ten_van_ban = ten_van_ban;
        $motachitiet = mo_ta_chi_tiet;
        $motachung = mo_ta_chung;
        $hinhdaidien = hinh_dai_dien;

        $link_list = 'index.php?module=vanban&act=noibanhanh';


        if ($_POST['ten_noi_ban_hanh'] == "") {
            $err['exist'] = chua_nhap_ten;
            $error_name = $err['exist'];
        }
        if (!$err) {
            $valid = true;
        } else {
            $valid = false;
        }
        if (($_SERVER['REQUEST_METHOD'] == 'POST') && $valid) {

            insertnoibanhanh($_POST);

            $_SESSION['success'] = edit_success;
            //chuyen huong ve list
            header('LOCATION: ' . $link_list);
        }
        require('view/template/vanban/edit_noibanhanh.tpl');
        break;

    case 'del_noibanhanh':

        $link_list = 'index.php?module=vanban&act=noibanhanh';
        $id = $_REQUEST['id'];
        delnoibanhanh($id);
        $_SESSION['success'] = del_success;
        //chuyen huong ve list
        header('LOCATION: ' . $link_list);
        exit();


        break;

}

ob_end_flush();
?>