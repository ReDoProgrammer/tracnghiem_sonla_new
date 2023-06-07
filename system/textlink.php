
<?php
if(REWRITE =='0'){
$url_home = './?m=home'; 
$url_account='./?m=member&act=account';
$url_login='./?m=member&act=login';
$url_logout ='./?m=member&act=logout';
$url_add ='./?m=address&act=add';
$url_contact = './?m=info&act=contact';
$url_sitemap ='./?m=info&act=site_map';
$url_search_advanced ='./?m=address&act=search_advanced';
}else{
$url_home = './index.html';    
$url_account='./tai-khoan.html';
$url_login='./dang-nhap.html';
$url_logout ='./dang-xuat.html';
$url_add ='./them-dia-chi-moi.html';
$url_contact = './lien-he.html';
$url_sitemap ='./site-map.html';
$url_search_advanced ='tim-kiem-nang-cao.html';        
}
?>