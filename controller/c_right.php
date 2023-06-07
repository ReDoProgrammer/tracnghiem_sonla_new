<?php

/**
 * @author 
 * @copyright 2013
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

//defined('DSVH') or die('Restricted access');

include('model/m_right.php');

//an module
if($_REQUEST['module']=='categories'){
    
    $anchude = 1;
} else {
    $anchude = false;
}
$list_quangba = getListquangba(0,15);

$list_center = getListcenter1(0,1);

$list_news = getListnews1(0,6);
$list_advright = getListadvright(0,10);
$list_advrighttop = getListadvrighttop(0,10);

$list_lienket = getListlienket(0,30);

//list chu de
$list_chude = getListchude(0,50);

$list_thongbao1 = getListthongbao1(0,5);

$list_advtop = getListadvtop(0,10);

?>