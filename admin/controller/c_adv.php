<?php
ob_start();
/**
 * @author honestphan
 * @copyright 2012
 */
if((!$_SESSION['admin'])){
   header('LOCATION: index.php?module=member&act=login');  
   exit();
}
include('model/m_adv.php');
include('controller/c_block.php');


$list_action = get_list_action_module($_SESSION['user_id'], 'adv');

$tb_view = false;
$tb_add = false;
$tb_edit = false;
$tb_del = false;

foreach($list_action as $la){
       $action = $la['action'];
       if($action == 'view'){
        $tb_view = true;
       }
       if($action == 'add'){
          $tb_add = true;
       }
       if($action == 'edit'){
          $tb_edit = true;
       }
       if($action == 'del'){
          $tb_del = tre;
       }       
}


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
	$link_list = 'index.php?module=home';
	if($_SESSION['phan_quyen']=='2'){
	if(!$tb_view)
    {
      $_SESSION['warning'] = "Bạn không được quyền truy cập chức năng này";
      header('LOCATION: '.$link_list);  
      exit();
    }
}

	//$this_time = vntime_now();
   // write_logs("Truy cập khu vực quản lý quảng cáo ", $this_time);
	
	 $limit = 15;
      $start = 0;
    $list_adv = getListadv($start,$limit);

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
      // xoa
    case 'del':
    get_file('language/adv/del.php');
    $link_list = 'index.php?module=adv&act=list';
    $id = $_REQUEST['id'];
    deladv($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
	
	//vi tri
	    case 'up':
     $link_list = 'index?module=adv&act=list';
     $id = $_REQUEST['id'];
     
     $adv = getadv($id);
     $vt = $adv['vi_tri'] + 1;
     update_vitri($id,$vt);
     
     $_SESSION['success'] = up;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    break;
    
    case 'down':
    $link_list = 'index?module=adv&act=list';
    $id = $_REQUEST['id'];
     $adv = getadv($id);
     $vt = $adv['vi_tri'] - 1;
     update_vitri($id,$vt);
     $_SESSION['success'] = down;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    break;
    
 }

  
  ob_end_flush();   

?>