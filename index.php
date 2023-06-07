<?php
ob_start();
/**
 * @author honestphan
 * @copyright 2012
 * Creat 27/02/2012
 */
define( 'DSVH', 1 );

session_start();
$_SESSION['folder'] = time();

//ket noi csdl
include('model/m_db.php');
//load in system
include('system/pagination.php');
include('system/alias.php');
include('system/utility.php');
//include('system/session.php');
include('system/config/setting.php');
include('system/thumb.php');


if($_REQUEST['module']==""){
   include('controller/c_home.php');
} else {
	
    $get = $_REQUEST['module'];
    $file ='controller/c_'.$get.'.php';
    if (file_exists($file)) {
    get_file($file);
    }
	
}
	
    
     $act = clean_input($_REQUEST['act']);
	 if($get != '') {
		if(
			($act == 'list') || ($act == 'add') || ($act == 'view')
		 ){
			//khong lam gi
		//} else {
		//	header('LOCATION: ../404.html'); 
		//    exit; 
		}
    }  
    
ob_end_flush(); 
?>