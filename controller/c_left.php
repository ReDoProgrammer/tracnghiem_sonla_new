<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

//defined('DSVH') or die('Restricted access');
include('model/m_left.php');


if($_REQUEST['module']=='news'){
    
    $locksnews = 1;
} else {
    $locksnews = false;
}

//lấy danh sach bang tin

$quayphim_view = get1Video1();
if(!$quayphim_view){
    header('LOCATION: index.php?module=home');
    exit();
}

// Get ID Video Youtube
parse_str(parse_url($quayphim_view['video'], PHP_URL_QUERY), $MyArray);
$idVideo = $MyArray["v"];


//quang cao

$list_dm_cha4  = get_list_dm_cha(61);
$list_dm_cha5  = get_list_dm_cha(62);
$list_dm_cha8  = get_list_dm_cha(36);
$list_noibanhanh1 = getlistnoibanhanh1(0,30);


$list_dm_cha  = get_list_dm_cha();
$list_dm_cha1  = get_list_dm_cha1();
$list_dmcon = get_list_dmcon_theo_cha($dmcha['id']);
$list_dmsp = getListdm(0,30);
$list_dmntm1 = getListntm1(0,30);
//$list_advcentertop = getListcentertren(0,1);

$list_album1 = getListalbum1(0,2);

$list_slide = getListslide(0,12);

$list_tinchaytren = getListtinchaytren(0,12);

$list_centertren = getListcentertren(0,1);

$list_video1 = getListvideo1(0,1);
$list_video2 = getListvideo1(1,3);
$list_video3 = getListvideo2(0,15);

$list_tinnoibat = getListtinnoibat(0,10);
$list_tinnoibat0 = getListtinnoibat(0,1);
$list_tinnoibat15 = getListtinnoibat(1,4);
$list_tinnoibat2 = getListtinnoibat(2,3);
$list_tinnoibat3 = getListtinnoibat(3,4);
$list_tinnoibat4 = getListtinnoibat(4,5);
$list_tinnoibat5 = getListtinnoibat(5,6);

$list_tinnois1 = getListtinmois1(0,5);
$list_tinnois2 = getListtinmois1(1,2);

$list_tinnoiright = getListtinmois1(0,1);
$list_tinnoiright1 = getListtinmois1(1,4);

$list_vanban1 = getListvanban1(0,10);

$list_tinnoibat7 = getListtinnoibat(1,6);
$list_tinduan = getListtinduan(0,15);

$list_tinnoi1 = getListtinmoi1(0,4);

$list_thutuc1 = getListthutuc1(0,6);

$list_tinxemnhieu = getListtinxemnhieu(0,6);

$list_tinlanhdao = getListtinlanhdao1(0,20);

//thong tin hiep hoi

$list_dmtc = getListdmtc(0,8);

$list_thongtinhiephoi1 = getListthongtinhiephoi(2,0,10);

$getListbieumaumoi = getListbieumaumoi(0,10);

//$list_slidetop = getListslidetop(0,10);

$list_bantinmattran = getListbantin(59,0,6);


$id = $_REQUEST['id'];
$gioithieu_detail = getabout1($id);
$list_dmdownload = getListdmdownload(0,5);
$list_luotxemnhieu = getListdownloadxemnhieu(0,5);

$list_hotro = getListtinhotro(0,6);

$list_dmabout = getListdmabout(0,8);

$list_khuyenhoc1 = getListkhuyenhoc1(0,20);


//cau hinh website
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
$title = $hethong['ten'];
$tacgia = $hethong['author'];
$email12 = $hethong['email'];
$chuquan = $hethong['chu_quan'];
?>