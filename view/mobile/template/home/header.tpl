<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="vi" xml:lang="vi">
<head>
<title><?php echo $title; ?> - Mobile </title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="<?php echo $meta; ?>" />
<link href="view/theme/mobile/favicon.ico" rel="icon" />
<link rel="stylesheet" type="text/css" href="view/theme/mobile/stylesheet/stylesheet.css" />
<!-- book mark -->
<script type="text/javascript"><!--
    function bookmark(url, title) {
    	if (window.sidebar) { // firefox
        window.sidebar.addPanel(title, url, "");
    	} else if(window.opera && window.print) { // opera
    		var elem = document.createElement('a');
    		elem.setAttribute('href',url);
    		elem.setAttribute('title',title);
    		elem.setAttribute('rel','sidebar');
    		elem.click();
    	} else if(document.all) {// ie
       		window.external.AddFavorite(url, title);
    	}
    }
//--></script>

<!-- google analytics -->
<script type="text/javascript">
var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '<?php echo GOOGLE_ANALYTICS; ?>']);
  _gaq.push(['_trackPageview']);
 (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</head>
<body>
<div id="main"><!-- begin main-->
<div id="container"><!-- begin container-->
<div id="header"><!-- begin header-->
<div class="title">Danh bạ địa chỉ trực tuyến Sơn La</div>
<div class="div2"><!-- begin div2-->
<a href="<?php echo $url_home; ?>" title="Son La Address Book Online"><img src="images/site/<?php echo $logo;?>" height="40" title=""  alt="Son La Address Book Online" /></a>
</div><!-- begin div2-->
 <div id ="tk">  
<a href="<?php echo $url_home;?>">Trang chủ |</a>
   <a href="<?php echo $url_add;?>">Đăng địa chỉ mới |</a>
   <a href="<?php echo $url_account;?>">Tài khoản</a>
   <?php if($_SESSION['name']) { ?>
    <?php echo $_SESSION['name'];?>  <a href="<?php echo $url_logout;?>">thoát</a>
   <?php } else{?>
    <a href="<?php echo $url_login;?>">Đăng nhập</a>
  <?php } ?>
<br>
Tìm kiếm:<br>
<form action="<?php echo $url_search_normal; ?>" method="POST" enctype="multipart/form-data" >
<input type="text" value="Từ khóa" size="40"name="search_keyword" id="search_keyword"  onclick="this.value = '';" onkeydown="this.style.color = '#000000'" style="color: #999;" />
<br>
<input type="submit" id ="search" value="Tim kiếm"/></br>
</form>
</div><!-- end search -->
</div> <!-- end header -->