<?php
session_start();
/**
 * @author nbinh88@gmail.com
 * @copyright 2013
 */
if((!$_SESSION['admin'])){
	header('LOCATION: index.php?module=member&act=login');  
	exit();
}


include ('model/m_block.php');
include('../model/counter.php');
$id = $_REQUEST['id'];
$member4 = getmember4($id);
$list_ctsview = getListctsview(0,15);
$ctsview = totalctsview();

$list_bbt1 = getListbbt1(0,10);

$list_lienhe3 = getListlienhe3(0,10);
$list_lienhe1 = getListlienhe1(0,10);
$lhview = totallhview();


$tinbai = totaltinbai();
$vanban1 = totalvanban1();
$quayphim1 = totalvideo1();
$abum1 = totalalbum1();

$lienhe1 = totallienhe1();

$list_nkht = getListnkht(0,15);

//$list_ctshome = getListcts123(0,9);

$list_hoidap1 = getListhoidap1(0,10);

$hoi2 = totalhoi2();
$traloi2 = totaltraloi2();

$hoidap1 = totalhoidap1();
$hoidap2 = totalhoidap2();
$cts1 = totalcts1();
$cts2 = totalcts2();
$cts3 = totalcts3();

$about2 = totalabout2();
$thongbao2 = totalthongbao2();
$bbt2 = totalbbt2();
$news2 = totalnews2();

$dmnews2 = totaldmnews2();

$adv2 = totaladv2();


$list_member4 = getListmember4(0,8);


$member4 = totalmember4();
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

$hethong = gethethong();

$tag = $hethong['keywords'];
$keyword = $hethong['keywords'];

$description = $hethong['description'];
$hddk1 = $hethong['hddk'];
$giayphep = $hethong['giay_phep'];
$map = $hethong['map'];
$facebook = $hethong['facebook'];
$url = $hethong['url'];
$diachi = $hethong['dia_chi'];
$toasoan = $hethong['toa_soan'];
$mayban = $hethong['may_ban'];
$didong = $hethong['di_dong'];
$fax = $hethong['fax'];
$tensite = $hethong['title_name'];
$tacgia = $hethong['author'];
$email1 = $hethong['email'];


	
    //$list_logs = get_list_logs(0,10);
	
	//$canbo_list = listAdmin();
if(isset($_SESSION['user_id'])){ 
$list_user_modules = get_list_user_modules($_SESSION['user_id'], 0, 100); 

  $u_modules = array();
  foreach($list_user_modules as $u_module){
     $u_modules[] = array(
     'module_name' => $u_module['module_name'],
     'action' => $u_module['action']
    );
  }
  
 foreach($u_modules as $mod) {
	  if($mod['module_name']=='about') { $m_about =1;}  
	 if($mod['module_name']=='thong_bao') { $m_thong_bao =1;}  
	  if($mod['module_name']=='content')   { $m_content =1;}    
	   if($mod['module_name']=='hoi_dap')   { $m_hoi_dap =1;}   
	    if($mod['module_name']=='van_ban')   { $m_van_ban =1;}   
	     if($mod['module_name']=='tthc')      { $m_tthc =1;} 
		  if($mod['module_name']=='audio')      { $m_audio =1;} 
		   if($mod['module_name']=='video')      { $m_video =1;} 
			if($mod['module_name']=='album')      { $m_album =1;} 
			 if($mod['module_name']=='user')      { $m_user =1;} 
			  if($mod['module_name']=='config')      { $m_config =1;} 
			   if($mod['module_name']=='top_menu')      { $m_top_menu =1;} 
				if($mod['module_name']=='bot_menu')      { $m_bot_menu =1;} 
				 if($mod['module_name']=='chuyen_muc')      { $m_chuyen_muc =1;} 
				  if($mod['module_name']=='mo_rong')      { $m_mo_rong =1;} 
				   if($mod['module_name']=='banner')      { $m_banner =1;} 
				    if($mod['module_name']=='web_link')      { $m_web_link =1;} 
					 if($mod['module_name']=='noi_ban_hanh')      { $m_noi_ban_hanh =1;} 
					  if($mod['module_name']=='loai_van_ban')      { $m_loai_van_ban =1;} 
			           if($mod['module_name']=='media')      { $m_media =1;} 
					     if($mod['module_name']=='pqcm')      { $m_pqcm =1;} 
						   if($mod['module_name']=='module_permision')      { $m_module_permision =1;} 
						   
	 $u_action = $mod['module_name']."_".$mod['action'];
	
 }
}

?>