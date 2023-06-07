<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
if((!$_SESSION['loged'])||($_SESSION['phan_quyen']=='0')){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
    }

include('model/m_adv.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/adv/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $chon_ben = chon_ben;
    $lien_ket = lien_ket;
    $thoi_gian = thoi_gian;
    $cot_thao_tac = cot_thao_tac;
    $link_add ='index.php?module=adv&act=add';

    $list_adv = getListadv();

    require('view/template/adv/list_adv.tpl');  
    break;
//case add
 case 'add':
    require ('language/adv/add.php');
    
     $heading_title = heading_title;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $lien_ket = lien_ket;
     $chon_ben = chon_ben;

     
         $link_list = 'index.php?module=adv&act=list';
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertadv($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/adv/add_adv.tpl');
    break;    
    

    //case edit
    case 'edit':
    require('language/adv/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $lien_ket = lien_ket;
    $hinh_anh = hinh_anh;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=adv&act=list';
    $id = $_REQUEST['id'];
    $adv = getadv($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editadv($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/adv/edit_adv.tpl');
    break; 
    
    case 'del':
    get_file('language/adv/del.php');
    $link_list = 'index?module=adv&act=list';
    $id = $_REQUEST['id'];
    deladv($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
 }
    // xoa
    

?>