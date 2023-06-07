<?php

/**
 * @author nbinh88@gmail.com
 * @copyright 2013
 */
session_start();
if((!$_SESSION['admin'])){
  header('LOCATION: index.php?module=member&act=login');  
  exit();
}
	


//include ('model/m_block.php');
include('model/m_lienhe.php');
include ('model/m_home.php');
include('controller/c_block.php');

$tieu_de = tieu_de;
$hinh_anh = hinh_anh;
$ho_ten = ho_ten;
$phone = phone;
$dia_chi = dia_chi;
$email = email;
$thanh_toan = thanh_toan;
$gia_san_pham = gia_san_pham;
$time = time;
$cot_thao_tac = cot_thao_tac;




$list_lienhe = getListLienhe();

$news1 = totalnews1();

//$cts1 = totalcts1();


$member1 = totalmember1();

$hoi1 = totalhoi1();

//$tl1 = totaltraloi12();


//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
require('view/template/home/index.tpl');  
  


?>