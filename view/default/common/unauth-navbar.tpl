<header class="header">
    <div class="scroll_site" style="top: 0px;">
        <div class="wraper">
            <div class="container">
                <div class="menu-bar hidden-md hidden-lg">
                    <i class="fa fa-bars" aria-hidden="true" style="font-size:24px;" onClick="ShowSideBar()"></i>
                </div>
                <div class="header-main">
                    <div class="row">
                        <div class="col-sm-24 col-lg-4 col-md-4">
                            <div class="logo">
                                <a class="logo-wrapper" title="TỈNH ĐOÀN SƠN LA - THI TRỰC TUYẾN" href="/vi/"><img
                                        src="assets/images/logo-tinhdoan.png" alt="TỈNH ĐOÀN SƠN LA - THI TRỰC TUYẾN"></a>
                            </div>
                        </div>
                        <div class="col-sm-24 col-lg-20 col-md-20">
                            <nav class="hidden-sm hidden-xs">
                                <ul id="nav" class="nav">
                                    <li class="nav-item nav-items  class=" active>
                                        <a href="/index.php" class="nav-link">Trang chủ</a>
                                    </li>
                                    <li class="nav-item nav-items ">
                                        <a href="/vi/page/" class="nav-link">Thể Lệ</a>
                                    </li>
                                    <li class="nav-item nav-items ">
                                        <a href="/vi/download/" class="nav-link">Thư viện tài nguyên</a>
                                    </li>
                                    <li class="nav-item nav-items ">
                                        <a href="/vi/onlinetest/" class="nav-link">Vào thi</a>
                                    </li>
                                    <li class="nav-item nav-items ">
                                        <a href="/vi/onlinetest/history/" class="nav-link">Lịch sử thi</a>
                                    </li>
                                    <li class="nav-item nav-items ">
                                        <a href="/vi/users/register/" class="nav-link" data-toggle="modal" data-target="#modalRegister">Đăng ký</a>
                                    </li>
                                    <li class="nav-item nav-items ">
                                        <a href="/vi/users/login/" class="nav-link" data-toggle="modal" data-target="#modalLogin">Đăng nhập</a>
                                    </li>
                                </ul>
                            </nav>

                            <div class="searchboxlager headerSearch">
                                <div class="searchfromtop">
                                    <input type="text" class="form-control" maxlength="60" placeholder="Tìm kiếm ...">
                                </div>
                            </div>
                            <div class="search-cart header-nav">
                                <div class="searchsmall"> <a class="showsearchfromtop"><i class="fa fa-search"></i></a>
                                </div>
                                <div class="top-cart-contain f-right">
                                    <div class="mini-cart text-xs-center">
                                    </div>
                                </div>
                            </div>
                            <div id="tip" data-content="">
                                <div class="bg"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


<div id="mySidenav" class="sidenav menu_mobile hidden-md hidden-lg">
    <span class="close_menu" style="background-image: url(assets/images/logo-tinhdoan.png);"></span>
    <div class="content_memu_mb">
        <div class="link_list_mobile">
            <ul class="ct-mobile">
                <li class="level0 level-top parent">
                    <a title="Trang chủ" href="/index.php">Trang chủ</a>
                </li>
                <li class="level0 level-top parent">
                    <a title="Thể Lệ" href="/vi/page/">Thể Lệ</a>
                </li>
                <li class="level0 level-top parent">
                    <a title="Thư viện tài nguyên" href="/vi/download/">Thư viện tài nguyên</a>
                </li>
                <li class="level0 level-top parent">
                    <a title="Vào thi" href="/vi/onlinetest/">Vào thi</a>
                </li>
                <li class="level0 level-top parent">
                    <a title="Lịch sử thi" href="/vi/onlinetest/history/">Lịch sử thi</a>
                </li>
                <li class="level0 level-top parent">
                    <a title="Đăng ký" href="/vi/users/register/">Đăng ký</a>
                </li>
                <li class="level0 level-top parent">
                    <a title="Đăng nhập" href="/vi/users/login/">Đăng nhập</a>
                </li>
            </ul>
        </div>
    </div>
</div>

           
<?php 
    include('modalRegister.tpl');
    include('modalLogin.tpl');
?>

<script>
    function ShowSideBar(){
       $('#mySidenav').addClass('open_sidebar_menu');
    }
</script>

<script type="text/javascript" src="assets/js/member/js_login.js"></script>