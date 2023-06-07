
    <div id="whole-page">
        <div id="page-header"></div>
        <div id="page-content">
            <div id="module10" class="ModuleWrapper">
                <div class="content-frame">
                    <div class="columns-widget columns9-3 container">
                        <div class="row">
                            <div class="col-left col-xs-12 col-md-9 col-sm-8">
                                <div id="module11" class="ModuleWrapper">
                                    <div class="pathway-category">
                                        <ol class="breadcrumb clearfix" itemprop="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
                                            <li class="first-item" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="index.php?module=home" title="Trang chủ" itemprop="item">Trang chủ</a> </li>
                                            <li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="danh sách sản phảm" itemprop="item">Danh sách sản phẩm theo vùng</a>
                                                <meta itemprop="position" content="1" /> </li>
                                        </ol>
                                    </div>
                                </div>
								
								
								
								
                                <div class="ModuleWrapper" moduleRootId="1636191">
                                    <div class="listNewsType1 Article-News">
									
									

									  <div class="ModuleWrapper">
                                    <section class="section-table-administrativeprocedure Article-AdministrativeProcedure-Detail-tableType1">
   <form action="" method="post" enctype="multipart/form-data" id="form">
                                        <div class="filter-administrativeprocedure form-group mt-10 panel-primary panel-search-administrativeprocedure panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">Tìm kiếm sản phẩm | <?php echo $_SESSION['ten'];?></div>
                                            </div>
                                            <div class="panel-body">
                                                <div class="note mb-15">Nhập tên sản phẩm hoặc từ khóa liên quan đến sản phẩm vào cửa sổ tìm kiếm dưới đây</div>
                                                <div class="row">
                                                    <div class="normal-search clearfix mb-15">
                                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                                            <input  type="text" name="tieu_de" class="search_init text_filter form-control wp-100" placeholder="Nhập từ khóa cần tìm" value="<?php echo $_SESSION['ten'];?>" style="margin-bottom:0;">
                                                            <button type="submit" class="btn btn-danger">Tìm kiếm</button>
                                                        </div>
                                                      
                                                    </div>
                                                
                                                </div>
                                            </div>
                                        </div>
                                      
                              

                                    </section>

                                    <style>
                                        .section-table-administrativeprocedure .panel-search-administrativeprocedure {
                                            border-color: var(--brand-primary);
                                            border-radius: 0;
                                        }
                                        
                                        .section-table-administrativeprocedure .panel-search-administrativeprocedure > .panel-heading {
                                            background: var(--brand-primary);
                                            border-color: var(--brand-primary);
                                            border-radius: 0;
                                        }
                                        
                                        .section-table-administrativeprocedure .panel-search-administrativeprocedure > .panel-heading > .panel-title {
                                            text-transform: uppercase;
                                            font-size: 15px;
                                        }
                                        
                                        @media (min-width: 768px) {
                                            .section-table-administrativeprocedure .filter-administrativeprocedure .advanced-search .div-left {
                                                display: inline-block;
                                                width: 65px;
                                                vertical-align: top;
                                            }
                                        }
                                        
                                        @media (min-width: 768px) {
                                            .section-table-administrativeprocedure .filter-administrativeprocedure .advanced-search .div-right {
                                                display: inline-block;
                                                width: calc(100% - 65px);
                                                vertical-align: top;
                                            }
                                        }
                                        
                                        .section-table-administrativeprocedure .filter-administrativeprocedure .advanced-search .div-right label {
                                            width: auto;
                                            font-weight: normal;
                                            padding-right: 10px;
                                        }
                                        
                                        .section-table-administrativeprocedure .filter-administrativeprocedure .normal-search .form-control {
                                            width: calc(100% - 100px) !important;
                                            display: inline-block;
                                            vertical-align: middle;
                                        }
                                        
                                        .section-table-administrativeprocedure .filter-administrativeprocedure .normal-search .open-advanced-search {
                                            padding: 7px 0;
                                            display: inline-block;
                                        }
                                        
                                        .section-table-administrativeprocedure .list-items table th {
                                            background: #f5f5f5;
                                            vertical-align: top;
                                        }
                                    </style>
									</div>
									
									
	
					<?php foreach ($list_theodanhmucsp as $sanpham) { ?>
					 <div class="col-lg-4 col-md-4 col-sm-8 col-xs-12">
                        <div class="tour">
                                                                        <!--<div class="deal_stick">Khuyến mãi</div>-->
                                                <a title="Tour Bà Nà - Hoàng hôn trên Cầu Vàng" href="index.php?module=sanpham&act=view&id=<?php echo $sanpham['id_sp'];?>">
                            <div class="tourpic">
                                                                <img class="img" alt="<?php echo $sanpham['tieu_de'];?>" src="<?php echo $sanpham['hinh_anh'];?>">
                                                                
                                <div class="stars">
                                                                        <div class="khoihanh"><i class="fa fa-map-marker"></i> <?php echo $sanpham['khu_vuc'];?></div>


                                                                   <?php if($sanpham['xep_hang']=='1') { ?>
   <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
   <?php if($sanpham['xep_hang']=='2') { ?>
  <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
    <?php if($sanpham['xep_hang']=='3') { ?>
  <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow;  margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
     <?php if($sanpham['xep_hang']=='4') { ?>
  <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
   
    <?php if($sanpham['xep_hang']=='5') { ?>
  <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
                                                                    </div>
                            </div>
                            <div class="infotour">
                                
                                <div class="title">
                               <b> <?php echo $sanpham['tieu_de'];?>   </b>                             </div>
                                
                                <!--<div class="lichtrinh"><i class="fa fa-car"></i> Đà Nẵng - Bà Nà Hills - Chùa Linh Ứng - Fantasy Park</div>-->
                            </div>
                            <div class="info1">
                        
                             Giá
                            </div>
                            <div class="info2">
                                <div class="price">
                               <?php if($sanpham['gia']) {?>
            <?php echo number_format($sanpham['gia'],0,',',','); ?><font size="2"> VNĐ</font>
            <?php } else{?>
            <?php echo "Liên hệ";?>
            <?php } ?><sup>đ</sup>                                </div>
                            </div>

                            <div class="info3">
                                Chi tiết
                            </div>
                            
                        </a>
                    </div>
                    </div>
								
<?php } ?>

							
 </form>  									
					    <div class="clearfix"></div>				
									   
									   
									   
									   
                                    </div>
                                    <style>
                                        .listNewsType1 {
                                            margin-bottom: 30px;
                                        }
                                        
                                        .listNewsType1 .listNewBig {
                                            border-top: 1px solid #eaeaea;
                                            padding-bottom: 22px;
                                            padding-top: 22px;
                                        }
                                        
                                        .listNewsType1 .listNewBig .post-title .entry-title {
                                            margin-top: 0;
                                            margin-bottom: 0;
                                        }
                                        
                                        .listNewsType1 .listNewBig .post-title .entry-title a {
                                            font-size: var(--font-size-base);
                                            font-weight: bold;
                                            text-transform: uppercase;
                                            color: #262626;
                                        }
                                        
                                        .listNewsType1 .listNewBig .date {
                                            font-size: 12px;
                                            color: #999999;
                                        }
                                        
                                        .listNewsType1 .listNewBig .post-content {
                                            font-size: var(--font-size-base);
                                            color: #626262;
                                            padding-top: 10px;
                                        }
                                        
                                        .listNewsType1 .listNewBig .hasViewMore {
                                            color: #262626;
                                            text-decoration: none;
                                            font-size: 12px;
                                            margin-top: 15px;
                                            font-weight: bold;
                                            padding-right: 15px;
                                            position: relative;
                                            display: inline-block;
                                        }
                                        
                                        .listNewsType1 .listNewBig .hasViewMore:hover {
                                            text-decoration: none;
                                        }
                                        
                                        .listNewsType1 .listNewBig .hasViewMore:after {
                                            content: "";
                                            position: absolute;
                                            top: 4px;
                                            right: 0;
                                            width: 8px;
                                            height: 8px;
                                            background: url("/App/Corporate/images/News/viewmorearrow.png") top left no-repeat;
                                        }
                                        
                                        .listNewsType1 .listNewSmall {
                                            border-top: 1px solid #eaeaea;
                                            padding-bottom: 22px;
                                            padding-top: 22px;
                                        }
                                        
                                        .listNewsType1 .listNewSmall .post-title .entry-title {
                                            margin-top: 0;
                                            margin-bottom: 0;
                                        }
                                        
                                        .listNewsType1 .listNewSmall .post-title .entry-title a {
                                            font-size: var(--font-size-base);
                                            font-weight: bold;
                                            color: #262626;
                                        }
                                        
                                        .listNewsType1 .listNewSmall .date {
                                            font-size: ceil(var(--font-size-base) * 0.85);
                                            color: #999999;
                                        }
                                        
                                        .listNewsType1 .listNewSmall .post-content {
                                            font-size: var(--font-size-base);
                                            color: #626262;
                                            padding-top: 10px;
                                        }
                                    </style>
                                </div>
                            </div>
                         
					