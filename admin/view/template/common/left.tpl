 <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar" style="background: #222d32;">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar" style="background: #222d32;">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="assets/images/no-avatar.jpg" class="img-circle" alt="User Image">

                    </div>
                    <div class="pull-left info">
                        <p id="userId" data-user=""></p>
                        <a href="index.php?module=member&amp;act=logout"><i class="fa fa-sign-out"></i> Đăng Xuất</a>
                    </div>
                </div>
                <!-- search form -->
                <form action="index.php?module=news&amp;act=list" method="post" class="sidebar-form"
                    novalidate="novalidate">
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
                <ul class="sidebar-menu tree" data-widget="tree">
                    <li class="header">Hệ Thống Menu</li>
                    <li class="">
                        <a href="index.php?module=home">
                            <i class="fa fa-dashboard"></i> <span>Trang Chủ</span>

                        </a>

                    </li>
                    <li class="">
                        <a href="index.php?module=about&amp;act=list">
                            <i class="fa fa-th"></i> <span>Giới Thiệu</span>
                            <span class="pull-right-container">
                                <!--<small class="label pull-right bg-green">new</small>-->
                            </span>
                        </a>
                    </li>

                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-address-book" aria-hidden="true"></i> <span>Danh Bạ</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?module=danhba&amp;act=list"><i
                                        class="fa fa-chevron-right fa-fw"></i>Danh sách danh bạ</a></li>
                            <li><a href="index.php?module=workplace&amp;act=list"><i
                                        class="fa fa-chevron-right fa-fw"></i>Danh mục đơn vị công tác</a></li>
                             
                            <li><a href="index.php?module=dmphong&amp;act=list"><i
                                        class="fa fa-chevron-right fa-fw"></i>Danh mục phòng ban</a></li>

                        </ul>
                    </li>

                    <li class="">
                        <a href="index.php?module=thongbao&amp;act=list">
                            <i class="fa fa-bullhorn"></i> <span>Thông Báo</span>

                        </a>

                    </li>

                    <li class="">
                        <a href="index.php?module=khuyenhoc&amp;act=list">
                            <i class="fa fa-bullhorn"></i> <span>Khuyến học</span>

                        </a>

                    </li>

                    <li class="  treeview">
                        <a href="#">
                            <i class="fa fa-newspaper-o fa-fw"></i>
                            <span> Trắc nghiệm</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?module=exam&amp;act=list"><i
                                        class="fa fa-chevron-right fa-fw"></i>Quản lý cuộc thi</a></li>
                            <li><a href="index.php?module=topic&amp;act=list"><i
                                        class="fa fa-chevron-right fa-fw"></i>Quản lý chủ đề</a></li>
                            <li><a href="index.php?module=question&amp;act=view"><i
                                        class="fa fa-chevron-right fa-fw"></i>Quản lý câu hỏi</a></li>
                            <li><a href="index.php?module=exam&amp;act=report-statistic"><i
                                        class="fa fa-chevron-right fa-fw"></i>Báo cáo thống kê</a></li>
                            <li><a href="index.php?module=exam&amp;act=history"><i
                                        class="fa fa-chevron-right fa-fw"></i>Lịch sử thi</a></li>
                        </ul>
                    </li>

                    <li class="  treeview">
                        <a href="#">
                            <i class="fa fa-newspaper-o fa-fw"></i>
                            <span> Tin Tức</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?module=news&amp;act=list"><i
                                        class="fa fa-chevron-right fa-fw"></i>Danh Sách Tin
                                    Tức</a></li>
                            <li><a href="index.php?module=dmnews&amp;act=list"><i
                                        class="fa fa-chevron-right fa-fw"></i>Quản lý danh mục</a></li>
                            <li><a href="index.php?module=dmnho&amp;act=list"><i
                                        class="fa fa-chevron-right fa-fw"></i>Quản lý danh mục nhỏ</a></li>
                        </ul>
                    </li>

                    <li class="">
                        <a href="index.php?module=bbt&amp;act=list">
                            <i class="fa fa-bullhorn"></i> <span>Ban biên tập</span>

                        </a>

                    </li>
 
                    <li class="treeview">
                        <a href="index.php?module=vanban&amp;act=list">
                            <i class="fa fa-file-word-o"></i> <span>Văn Bản</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?module=vanban&amp;act=list"><i class="fa fa-circle-o"></i> Danh Sách
                                    Văn Bản</a></li>
                            <li><a href="index.php?module=vanban&amp;act=loaivanban"><i class="fa fa-circle-o"></i> Loại
                                    Văn Bản</a></li>
                            <li><a href="index.php?module=vanban&amp;act=noibanhanh"><i class="fa fa-circle-o"></i> Cơ
                                    Quan Ban Hành</a></li>
                        </ul>
                    </li>


                    <li class="">
                        <a href="index.php?module=album&amp;act=list">
                            <i class="fa fa-camera-retro" aria-hidden="true"></i> <span>Album Ảnh</span>

                        </a>

                    </li>

                    <li class="">
                        <a href="index.php?module=media&amp;act=list">
                            <i class="fa fa-file-video-o"></i> <span>Video - Clips</span>

                        </a>

                    </li>

                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-laptop"></i>
                            <span> Hệ Thống</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="index.php?module=member&amp;act=list">
                                    <i class="fa fa-circle-o"></i> Danh Sách Thành Viên </a></li>
                             <li><a href="index.php?module=config&amp;act=member">
                                    <i class="fa fa-circle-o"></i> Cấu hình thông tin thành Viên </a></li>
                            <li><a href="index.php?module=adv&amp;act=list"><i class="fa fa-circle-o"></i> Quảng Cáo</a>
                            </li>
                            <li><a href="index.php?module=lienket&amp;act=list"><i class="fa fa-circle-o"></i> Liên Kết
                                    Website</a>
                            </li>

                            <li><a href="index.php?module=config&amp;act=site"><i class="fa fa-circle-o"></i> Cấu Hình
                                    Website</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="index.php?module=hoi&amp;act=list">
                            <i class="fa fa-question-circle"></i> <span>Hỏi Đáp</span>
                            <span class="pull-right-container">

                                <small class="label pull-right bg-red">1</small>

                                <small class="label pull-right bg-blue">0</small>

                            </span>
                        </a>
                    </li>
                    <li class="">
                        <a href="index.php?module=lienhe&amp;act=list">
                            <i class="fa fa-envelope"></i> <span>Liên Hệ</span>
                            <span class="pull-right-container">
                                <small class="label pull-right bg-yellow">117</small>
                            </span>
                        </a>
                    </li>
                </ul>
            </section>

            <!-- /.sidebar -->
        </aside>