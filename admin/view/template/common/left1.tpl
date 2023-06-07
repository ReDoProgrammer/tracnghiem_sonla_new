<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar" style="background: #222d32;">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="background: #222d32;">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <?php if($_SESSION['logo']){?>
                <img src="view/image/no-avatar.jpg" class="img-circle" alt="User Image">
                <?php } else { ?>
                <img width="160" src="view/image/no-avatar.jpg" class="img-circle" alt="User Image" />
                <?php } ?>

            </div>
            <div class="pull-left info">
                <p id="userId" data-user="<?php echo $_SESSION['user_id']?>">
                    <?php echo $_SESSION['hoten1']; ?>
                </p>
                <a href="index.php?module=member&act=logout"><i class="fa fa-sign-out"></i> Đăng Xuất</a>
            </div>
        </div>
        <!-- search form -->
        <form action="index.php?module=news&act=list" method="post" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="tieu_de" class="form-control" placeholder="Tìm kiếm...">
                <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i
                            class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <?php if ($_SESSION['loged']) { ?>
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">Hệ Thống Menu</li>
            <?php
                $mDL = $_GET['module'];
                ?>
            <li class="">
                <a href="index.php?module=home">
                    <i class="fa fa-dashboard"></i> <span>Trang Chủ</span>

                </a>

            </li>
            <?php if ($_SESSION['phan_quyen']=='1') { ?>
            <li class="">
                <a href="index.php?module=about&act=list">
                    <i class="fa fa-th"></i> <span>Giới Thiệu</span>
                    <span class="pull-right-container">
                        <!--<small class="label pull-right bg-green">new</small>-->
                    </span>
                </a>
            </li>



            <li class="<?php if($mDL == 'danhba' || $mDL == 'dmphong'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>">
                <a href="#">
                    <i class="fa fa-address-book" aria-hidden="true"></i> <span>Danh Bạ</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=danhba&act=list"><i class="fa fa-chevron-right fa-fw"></i>Danh sách
                            danh bạ</a></li>
                    <li><a href="index.php?module=dmphong&act=list"><i class="fa fa-chevron-right fa-fw"></i>Danh mục
                            phòng ban</a></li>

                </ul>
            </li>

            <li class="">
                <a href="index.php?module=thongbao&act=list">
                    <i class="fa fa-bullhorn"></i> <span>Thông Báo</span>

                </a>

            </li>

            <li class="">
                <a href="index.php?module=khuyenhoc&act=list">
                    <i class="fa fa-bullhorn"></i> <span>Khuyến học</span>

                </a>

            </li>

            <li class="treeview">
                <a href="#">
                    Menu Item 3
                    <i class="glyphicon glyphicon-chevron-right pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#">Submenu Item 1</a></li>
                    <li><a href="#">Submenu Item 2</a></li>
                    <li><a href="#">Submenu Item 3</a></li>
                </ul>
            </li>

            <li class="  <?php
                if($mDL == 'tracnghiem' || $mDL == 'tracnghiem'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>">
                <a href="#">
                    <i class="fa fa-newspaper-o fa-fw"></i>
                    <span> Trắc nghiệm</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=exam&act=list"><i class="fa fa-chevron-right fa-fw"></i>Quản lý cuộc
                            thi</a></li>
                    <li><a href="index.php?module=topic&act=list"><i class="fa fa-chevron-right fa-fw"></i>Quản lý chủ
                            đề</a></li>
                    <li><a href="index.php?module=question&act=view"><i class="fa fa-chevron-right fa-fw"></i>Quản lý
                            câu hỏi</a></li>
                </ul>
            </li>


            <li class="  <?php
                if($mDL == 'news' || $mDL == 'dmnews'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>">
                <a href="#">
                    <i class="fa fa-newspaper-o fa-fw"></i>
                    <span> Tin Tức</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=news&act=list"><i class="fa fa-chevron-right fa-fw"></i>Danh Sách Tin
                            Tức</a></li>
                    <li><a href="index.php?module=dmnews&act=list"><i class="fa fa-chevron-right fa-fw"></i>Quản lý danh
                            mục</a></li>
                    <li><a href="index.php?module=dmnho&act=list"><i class="fa fa-chevron-right fa-fw"></i>Quản lý danh
                            mục nhỏ</a></li>
                </ul>
            </li>

            <li class="">
                <a href="index.php?module=bbt&act=list">
                    <i class="fa fa-bullhorn"></i> <span>Ban biên tập</span>

                </a>

            </li>
            <!--
            <li class="
            <?php
                if($mDL == 'danhmuc' || $mDL == 'cts' || $mDL == 'baocao'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>
            ">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>CTS Online</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
			   <span class="pull-right-container">
             <!-- <small class="label pull-right bg-red">5</small>-->
            <!--  <small class="label pull-right bg-blue"><?php echo $ctsview;?></small>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=cts&act=list"><i class="fa fa-circle-o"></i> Danh Sách CTS Online										
					</a>
                    </li>
					
					 <li><a href="index.php?module=cts&act=active"><i class="fa fa-circle-o"></i> Danh Sách Đã Đăng Ký
					
					
					</a>
                    </li>
                    <li><a href="index.php?module=cts&act=listbydm&cha=1"><i class="fa fa-chevron-right fa-fw"></i>Danh Sách CTS Cá Nhân</a></li>
					<li><a href="index.php?module=cts&act=listbydm&cha=2"><i class="fa fa-chevron-right fa-fw"></i>Danh Sách CTS Tổ Chức</a></li>
                   
                    <li><a href="index.php?module=baocao&act=tongquan"><i class="fa fa-chevron-right fa-fw"></i>Báo Cáo Thống Kê</a></li>
                </ul>
            </li>-->

            <!--
			 <li class="<?php
                if($mDL == 'ntm' || $mDL == 'dmntm'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>">
                <a href="#">
                    <i class="fa fa-cloud-download"></i> <span>Dữ Liệu NTM</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=ntm&act=list"><i class="fa fa-circle-o"></i> Danh sách xã NTM</a></li>
                    <li><a href="index.php?module=dmntm&act=list"><i class="fa fa-circle-o"></i> Danh mục NMT</a></li>
                    
                </ul>
            </li>


			
		      <li class="<?php if($mDL == 'tieuchi' || $mDL == 'dmtieuchi'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
            ?>
			">
                <a href="#">
                   <i class="fa fa-line-chart" aria-hidden="true"></i> <span>Bộ tiêu chí</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=tieuchi&act=list"><i class="fa fa-circle-o"></i> Danh sách tiêu chí</a></li>
                    <li><a href="index.php?module=dmtieuchi&act=list"><i class="fa fa-circle-o"></i> Danh mục tiêu chí</a></li>
                    
                </ul>

            </li>-->


            <li class="<?php if($mDL == 'vanban' || $mDL == 'loaivanban' || $mDL == 'noibanhanh'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
            ?>">
                <a href="index.php?module=vanban&act=list">
                    <i class="fa fa-file-word-o"></i> <span>Văn Bản</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=vanban&act=list"><i class="fa fa-circle-o"></i> Danh Sách Văn Bản</a>
                    </li>
                    <li><a href="index.php?module=vanban&act=loaivanban"><i class="fa fa-circle-o"></i> Loại Văn Bản</a>
                    </li>
                    <li><a href="index.php?module=vanban&act=noibanhanh"><i class="fa fa-circle-o"></i> Cơ Quan Ban
                            Hành</a></li>
                </ul>
            </li>

            <!--
            <li class="<?php echo ($mDL == 'sanpham' ? 'active treeview':'treeview')?>">
                <a href="index.php?module=sanpham&act=list">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> <span>Sản phẩm OCOP</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=sanpham&act=list"><i class="fa fa-circle-o"></i> Danh Sách Sản Phẩm</a></li>
                    <li><a href="index.php?module=dm&act=list"><i class="fa fa-circle-o"></i> Danh mục sản phẩm</a></li>
                    
                </ul>
            </li>-->



            <li class="">
                <a href="index.php?module=album&act=list">
                    <i class="fa fa-camera-retro" aria-hidden="true"></i> <span>Album Ảnh</span>

                </a>

            </li>

            <li class="">
                <a href="index.php?module=media&act=list">
                    <i class="fa fa-file-video-o"></i> <span>Video - Clips</span>

                </a>

            </li>




            <!-- <li class="treeview">
                <a href="#">
                    <i class="fa fa-table"></i> <span>Tables</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                    <li><a href="pages/tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
                </ul>
            </li>-->
            <li class="<?php
                if($mDL == 'lienket' || $mDL == 'adv' || $mDL == 'hethong' || $mDL == 'member'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
            ?>
			
			
			">
                <a href="#">
                    <i class="fa fa-laptop"></i>
                    <span> Hệ Thống</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=member&act=list">
                            <i class="fa fa-circle-o"></i> Danh Sách Thành Viên </a></li>

                    <li><a href="index.php?module=adv&act=list"><i class="fa fa-circle-o"></i> Quảng Cáo</a></li>
                    <li><a href="index.php?module=lienket&act=list"><i class="fa fa-circle-o"></i> Liên Kết Website</a>
                    </li>

                    <li><a href="index.php?module=hethong&act=edit"><i class="fa fa-circle-o"></i> Cấu Hình Website</a>
                    </li>
                </ul>
            </li>
            <li class="">
                <a href="index.php?module=hoi&act=list">
                    <i class="fa fa-question-circle"></i> <span>Hỏi Đáp</span>
                    <span class="pull-right-container">

                        <small class="label pull-right bg-red">
                            <?php echo $hoidap2;?>
                        </small>

                        <small class="label pull-right bg-blue">
                            <?php echo $hoidap1;?>
                        </small>

                    </span>
                </a>
            </li>
            <li class="">
                <a href="index.php?module=lienhe&act=list">
                    <i class="fa fa-envelope"></i> <span>Liên Hệ</span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-yellow">
                            <?php echo $lhview;?>
                        </small>


                    </span>
                </a>
            </li>



            <!--<li class="treeview">
                <a href="#">
                    <i class="fa fa-share"></i> <span>Multilevel</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                    <li class="treeview">
                        <a href="#"><i class="fa fa-circle-o"></i> Level One
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li class="treeview">
                                <a href="#"><i class="fa fa-circle-o"></i> Level Two
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
               
                </ul>
            </li>-->
            <?php } else { ?>
            <?php if(($_SESSION['phan_quyen']=='2')) {?>
            <li class="">
                <a href="index.php?module=about&act=list">
                    <i class="fa fa-th"></i> <span>Giới Thiệu</span>
                    <span class="pull-right-container">
                        <!--<small class="label pull-right bg-green">new</small>-->
                    </span>
                </a>
            </li>



            <li class="<?php if($mDL == 'danhba' || $mDL == 'dmphong'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>">
                <a href="#">
                    <i class="fa fa-address-book" aria-hidden="true"></i> <span>Danh Bạ</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=danhba&act=list"><i class="fa fa-chevron-right fa-fw"></i>Danh sách
                            danh bạ</a></li>
                    <li><a href="index.php?module=dmphong&act=list"><i class="fa fa-chevron-right fa-fw"></i>Danh mục
                            phòng ban</a></li>

                </ul>
            </li>
            <?php if($m_thong_bao) { ?>
            <li class="">
                <a href="index.php?module=thongbao&act=list">
                    <i class="fa fa-bullhorn"></i> <span>Thông Báo</span>

                </a>

            </li>
            <?php } ?>

            <li class="  <?php
                if($mDL == 'news' || $mDL == 'dmnews'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>">
                <a href="#">
                    <i class="fa fa-newspaper-o fa-fw"></i>
                    <span> Tin Tức</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=news&act=list"><i class="fa fa-chevron-right fa-fw"></i>Danh Sách Tin
                            Tức</a></li>
                    <li><a href="index.php?module=dmnews&act=list"><i class="fa fa-chevron-right fa-fw"></i>Quản lý danh
                            mục</a></li>

                </ul>
            </li>

            <li class="  <?php
            if($mDL == 'news' || $mDL == 'dmnews'){
                echo 'active treeview';
            }else{
                echo 'treeview';
            }
       ?>">
                <a href="#">
                    <i class="fa fa-newspaper-o fa-fw"></i>
                    <span> Trac Nghiem Online</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=tracnghiem&act=list"><i class="fa fa-chevron-right fa-fw"></i>trac
                            nghiem</a></li>
                    <li><a href="index.php?module=dmnews&act=list"><i class="fa fa-chevron-right fa-fw"></i>Quản lý danh
                            mục</a></li>

                </ul>
            </li>
            <!--
            <li class="
            <?php
                if($mDL == 'danhmuc' || $mDL == 'cts' || $mDL == 'baocao'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>
            ">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span>CTS Online</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
			   <span class="pull-right-container">
             <!-- <small class="label pull-right bg-red">5</small>-->
            <!--  <small class="label pull-right bg-blue"><?php echo $ctsview;?></small>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=cts&act=list"><i class="fa fa-circle-o"></i> Danh Sách CTS Online										
					</a>
                    </li>
					
					 <li><a href="index.php?module=cts&act=active"><i class="fa fa-circle-o"></i> Danh Sách Đã Đăng Ký
					
					
					</a>
                    </li>
                    <li><a href="index.php?module=cts&act=listbydm&cha=1"><i class="fa fa-chevron-right fa-fw"></i>Danh Sách CTS Cá Nhân</a></li>
					<li><a href="index.php?module=cts&act=listbydm&cha=2"><i class="fa fa-chevron-right fa-fw"></i>Danh Sách CTS Tổ Chức</a></li>
                   
                    <li><a href="index.php?module=baocao&act=tongquan"><i class="fa fa-chevron-right fa-fw"></i>Báo Cáo Thống Kê</a></li>
                </ul>
            </li>-->


            <li class="<?php
                if($mDL == 'ntm' || $mDL == 'dmntm'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
           ?>">
                <a href="#">
                    <i class="fa fa-cloud-download"></i> <span>Dữ Liệu NTM</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=ntm&act=list"><i class="fa fa-circle-o"></i> Danh sách xã NTM</a></li>
                    <li><a href="index.php?module=dmntm&act=list"><i class="fa fa-circle-o"></i> Danh mục NMT</a></li>

                </ul>
            </li>



            <li class="  <?php if($mDL == 'tieuchi' || $mDL == 'dmtieuchi'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
            ?>
			">
                <a href="#">
                    <i class="fa fa-line-chart" aria-hidden="true"></i> <span>Bộ tiêu chí</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=tieuchi&act=list"><i class="fa fa-circle-o"></i> Danh sách tiêu
                            chí</a></li>
                    <li><a href="index.php?module=dmtieuchi&act=list"><i class="fa fa-circle-o"></i> Danh mục tiêu
                            chí</a></li>

                </ul>

            </li>


            <li class="  <?php if($mDL == 'vanban' || $mDL == 'loaivanban' || $mDL == 'noibanhanh'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
            ?>
			">
                <a href="index.php?module=vanban&act=list">
                    <i class="fa fa-file-word-o"></i> <span>Văn Bản</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=vanban&act=list"><i class="fa fa-circle-o"></i> Danh Sách Văn Bản</a>
                    </li>
                    <li><a href="index.php?module=vanban&act=loaivanban"><i class="fa fa-circle-o"></i> Loại Văn Bản</a>
                    </li>
                    <li><a href="index.php?module=vanban&act=noibanhanh"><i class="fa fa-circle-o"></i> Cở Quan Ban
                            Hành</a></li>
                </ul>
            </li>


            <li class="<?php echo ($mDL == 'sanpham' ? 'active treeview':'treeview')?>">
                <a href="index.php?module=sanpham&act=list">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i> <span>Sản phẩm OCOP</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=sanpham&act=list"><i class="fa fa-circle-o"></i> Danh Sách Sản
                            Phẩm</a></li>
                    <li><a href="index.php?module=dm&act=list"><i class="fa fa-circle-o"></i> Danh mục sản phẩm</a></li>

                </ul>
            </li>



            <li class="">
                <a href="index.php?module=album&act=list">
                    <i class="fa fa-camera-retro" aria-hidden="true"></i> <span>Album Ảnh</span>

                </a>

            </li>

            <li class="">
                <a href="index.php?module=media&act=list">
                    <i class="fa fa-file-video-o"></i> <span>Video - Clips</span>

                </a>

            </li>
            <!-- <li class="treeview">
                <a href="#">
                    <i class="fa fa-table"></i> <span>Tables</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                    <li><a href="pages/tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
                </ul>
            </li>-->
            <li class="
			  <?php
                if($mDL == 'lienket' || $mDL == 'adv' || $mDL == 'member'){
                    echo 'active treeview';
                }else{
                    echo 'treeview';
                }
            ?>
			
			
			">
                <a href="#">
                    <i class="fa fa-laptop"></i>
                    <span> Hệ Thống</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?module=member&act=list">
                            <i class="fa fa-circle-o"></i> Danh Sách Thành Viên </a></li>

                    <li><a href="index.php?module=adv&act=list"><i class="fa fa-circle-o"></i> Quảng Cáo</a></li>
                    <li><a href="index.php?module=lienket&act=list"><i class="fa fa-circle-o"></i> Liên Kết Website</a>
                    </li>

                </ul>
            </li>
            <li class="">
                <a href="index.php?module=hoi&act=list">
                    <i class="fa fa-question-circle"></i> <span>Hỏi Đáp</span>
                    <span class="pull-right-container">

                        <small class="label pull-right bg-red">
                            <?php echo $hoidap2;?>
                        </small>

                        <small class="label pull-right bg-blue">
                            <?php echo $hoidap1;?>
                        </small>

                    </span>
                </a>
            </li>
            <li class="">
                <a href="index.php?module=lienhe&act=list">
                    <i class="fa fa-envelope"></i> <span>Liên Hệ</span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-yellow">
                            <?php echo $lhview;?>
                        </small>


                    </span>
                </a>
            </li>



            <!--<li class="treeview">
                <a href="#">
                    <i class="fa fa-share"></i> <span>Multilevel</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                    <li class="treeview">
                        <a href="#"><i class="fa fa-circle-o"></i> Level One
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li class="treeview">
                                <a href="#"><i class="fa fa-circle-o"></i> Level Two
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
               
                </ul>
            </li>-->
            <?php }} ?>
        </ul>
        <?php } ?>
    </section>

    <!-- /.sidebar -->
</aside>