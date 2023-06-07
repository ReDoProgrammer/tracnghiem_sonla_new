<?php

/**
 * @author ReDo
 * @copyright 2023
 */
if((!$_SESSION['admin'])){
  header('LOCATION: index.php?module=member&act=login');  
  exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_question.php');
$page = $_GET['act'];
switch ($page) {
  case 'list':
    break;
  case 'view':
    require('view/template/question/view.tpl');
    break;


  //case add

  case 'add':
    session_start();
    require('language/about/add_about.php');

    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $theo_danh_muc = theo_danh_muc;
    $hinh_anh = hinh_anh;
    $link_anh = link_anh;
    $link_tai = link_tai;
    $kieu_file = kieu_file;
    $mediafire = mediafire;
    $fshare = fshare;
    $mb = mb;
    $mo_ta = mo_ta;
    $pass = pass;

    $link_list = 'index.php?module=about&act=list';


    $list_danhmuc = getListdmabout(0, 50);



    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      insertabout($_POST);
      $_SESSION['success'] = edit_success;
      //chuyen huong ve list
      header('LOCATION: ' . $link_list);
    }


    require('view/template/about/add_about.tpl');
    break;



  //case edit gioi thieu
  case 'edit':
    require('language/about/edit_about.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $noi_dung = noi_dung;

    $link_list = 'index.php?module=about&act=list';

    $id = $_REQUEST['id'];
    $about = getabout($id);

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      editabout($id, $_POST);
      $_SESSION['success'] = edit_success;
      //chuyen huong ve list
      header('LOCATION: ' . $link_list);
    }
    require('view/template/about/edit_about.tpl');
    break;
}
?>