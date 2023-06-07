
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
                                            <li class="first-item" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Trang chủ" itemprop="item">Trang chủ</a> </li>
                                            <li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Chi tiết sản phẩm" itemprop="item">Chi tiết sản phẩm</a>
                                                <meta itemprop="position" content="1" /> </li>
                                        </ol>
                                    </div>
                                </div>
                                <div class="ModuleWrapper" moduleRootId="1636191">
                                    <div class="listNewsType1 Article-News">
									
									

	  



                           
                            <div id="module20" class="ModuleWrapper" moduleRootId="1533501">
                                <section id="tour-detail-layout20" class="tour-detail-layout type-03">
                                    <div class="spec-info">
                                        <div class="row">
                                            <div class="col-md-6">
                                              <div class="post-image">
<a class="prettyphoto fancybox" title="<?php echo $view['tieu_de'];?>m" rel="gallery" href="<?php echo $view['hinh_anh'];?>">
<img class="relative-height" itemprop="image" alt="<?php echo $view['tieu_de'];?>" data-original="<?php echo $view['hinh_anh'];?>" src="<?php echo $view['hinh_anh'];?>" data-size-ratio="3:2" style="height: 273px;">
</a>
<div id="other-image19" class="other-image" style="opacity: 0;"> </div>
<br>
</div>
                                            </div>
											
                                            <div class="col-md-6">
                                            <div class="post-property">
                                                <div class="title-property">Thông tin chung</div>
                                                <div class="list-property">
                                                    <div class="property-overview">
                                                        <table class="table no-border table-property-realty">
                                                            <tr>
                                                                <td class="labal-property" style="width:40%;"><strong>Tên Sản Phẩm:</strong>
                                                                </td>
                                                                <td> <?php echo $view['tieu_de'];?></td>
                                                            </tr>
                                                            <tr>
                                                               
                                                            </tr>
                                                            <tr>
                                                                <td class="labal-property" style="vertical-align:middle;width:40%;"><strong>Giá tiền:</strong>
                                                                </td>
                                                                <td> <span class="btn btn-danger">  <?php if($sanpham['gia']) {?>
            <?php echo number_format($sanpham['gia'],0,',',','); ?><font size="2"> VNĐ</font>
            <?php } else{?>
            <?php echo "Liên hệ";?>
            <?php } ?> </span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labal-property"><strong>Đơn vị:</strong>
                                                                </td>
                                                                <td><?php echo $view['don_vi'];?></td>
                                                            </tr>
 <tr>
                                                                <td class="labal-property"><strong>Giám đốc:</strong>
                                                                </td>
                                                                <td><?php echo $view['ho_ten'];?></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labal-property"><strong>Email:</strong>
                                                                </td>
                                                                <td> <?php echo $view['email'];?> </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labal-property"><strong>Khu Vực:</strong>
                                                                </td>
                                                                <td> <?php echo $view['khu_vuc'];?> </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" class="labal-property"><strong>Địa chỉ:&nbsp;</strong><?php echo $view['dia_chi'];?></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labal-property"><strong>Xếp hạng:</strong>
                                                                </td>
                                                                <td>
                                                                   <?php if($view['xep_hang']=='1') { ?>
   <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
   <?php if($view['xep_hang']=='2') { ?>
  <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
    <?php if($view['xep_hang']=='3') { ?>
  <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow;  margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
     <?php if($view['xep_hang']=='4') { ?>
  <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>
   
    <?php if($view['xep_hang']=='5') { ?>
  <i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
<i class="fa fa-star" title="KhÃ¡ch sáº¡n 3 sao" style="color:yellow; margin:0 2px"></i>
   <?php } ?>


</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labal-property" style="vertical-align:middle"><strong>Điện thoại:</strong>
                                                                </td>
                                                                <td> <span class="btn btn-sm btn-success status-property"><?php echo $view['phone'];?></span> </td>
                                                            </tr>
                                                           
                                                           
                                                        </table>
                                                  
                                            </div>
                                        </div>
                                    </div>
                                    </div></div>
								
                                    <section class="main-cont">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="active" role="presentation"><a href="#tab-tourfeat-1" role="tab" data-toggle="tab">Chi tiết sản phẩm</a>
                                            </li>
                                           <!-- <li role="presentation"><a href="#tab-tour-images" role="tab" data-toggle="tab">Chi tiết Sản Phẩm</a>
                                            </li>-->
                                            <!--<li role="presentation"><a href="#tab-tour-price" role="tab" data-toggle="tab">Price table</a>
                                            </li>
                                            <li role="presentation"><a href="#tab-tourfeat-2" role="tab" data-toggle="tab">Chi tiết tour</a>
                                            </li>
                                            <li role="presentation"><a href="#tab-tour-contact" role="tab" data-toggle="tab">Liên Hệ</a>
                                            </li>-->
                                        </ul>
                                        <div class="tab-content">
                                            <div id="tab-tourfeat-1" class="tab-pane fade in active" role="tabpanel">
                                                <div id="accordion" class="panel-group" role="tablist" aria-multiselectable="true">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading" role="tab" id="headingOne">
                                                            <h4 class="panel-title">  <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
<div class="panel-body"><?php echo $view['mo_ta'];?>
																</div>  </a>  </h4> </div>
                                                        <div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                                            <div class="panel-body"><?php echo $view['noi_dung'];?>
																</div>
                                                        </div>
                                                    </div>
                                                   <!-- <div class="panel panel-default">
                                                        <div class="panel-heading" role="tab" id="headingOne">
                                                            <h4 class="panel-title">  <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" aria-controls="collapse2">
   Ngày  2: NGÀY 02: Hà Nội - Cát Bà - Tắm biển ( Ăn bữa: Trưa + Tối )  </a>  </h4> </div>
                                                        <div id="collapse2" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne">
                                                            <div class="panel-body"> Buổi sáng: Xe ôtô và Hướng dẫn viên của Công ty đón quý khách tại điểm hẹn khởi hành đi Bến Bính - Hải Phòng, trên đường đi đoàn tự do ngắm cảnh miền quê Bắc Bộ hoặc tham gia giao lưu trên xe do hướng dẫn viên tổ chức… Đến TP. Hải Dương, đoàn nghỉ dừng chân và dùng bữa sáng. Ôtô đưa đoàn đến bến Bính - Hải Phòng Quý khách lên tàu cao tốc đi Cát Bà. Đến Đảo Ngọc Cát Bà, đoàn bắt xe điện về Khách sạn, nhận phòng nghỉ ngơi... 11h30 Đoàn dùnhg bữa trưa tại nhà hàng với những đặc sản được khai thác từ biển Cát Bà và vùng phụ cận.
                                                                <br />
                                                                <br /> Buổi chiều: 15h00 Đoàn tập chung tại Bãi Cát Cò 2, tham gia giao lưu với những trò chơi vui nhộn do Hướng dẫn viên tổ chức cùng những phần quà thú vị Sau đó đoàn tự do hoà mình vào với làn nước trong xanh của biển Cát Bà.
                                                                <br />
                                                                <br /> 18h00 Đoàn về khách sạn nghỉ ngơi và dùng bữa tối tại nhà hàng với những sản vật của vùng biển Hạ Long – Cát Bà… Sau bữa tối, đoàn tự do dạo chơi hoặc có thể thuê xe đạp đôi dạo quanh thị Trấn ven Biển tuyệt đẹp này ( nghỉ đêm tại Khách sạn ở Cát Bà ) 
																</div>
                                                        </div>
                                                    </div>
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading" role="tab" id="headingOne">
                                                            <h4 class="panel-title">  <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" aria-controls="collapse3">
   Ngày  3: NGÀY 03: Hà Nội - Cát Bà - Tắm biển ( Ăn bữa: Trưa + Tối )  </a>  </h4> </div>
                                                        <div id="collapse3" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne">
                                                            <div class="panel-body"> Buổi sáng: Xe ôtô và Hướng dẫn viên của Công ty đón quý khách tại điểm hẹn khởi hành đi Bến Bính - Hải Phòng, trên đường đi đoàn tự do ngắm cảnh miền quê Bắc Bộ hoặc tham gia giao lưu trên xe do hướng dẫn viên tổ chức… Đến TP. Hải Dương, đoàn nghỉ dừng chân và dùng bữa sáng. Ôtô đưa đoàn đến bến Bính - Hải Phòng Quý khách lên tàu cao tốc đi Cát Bà. Đến Đảo Ngọc Cát Bà, đoàn bắt xe điện về Khách sạn, nhận phòng nghỉ ngơi... 11h30 Đoàn dùnhg bữa trưa tại nhà hàng với những đặc sản được khai thác từ biển Cát Bà và vùng phụ cận.
                                                                <br />
                                                                <br /> Buổi chiều: 15h00 Đoàn tập chung tại Bãi Cát Cò 2, tham gia giao lưu với những trò chơi vui nhộn do Hướng dẫn viên tổ chức cùng những phần quà thú vị Sau đó đoàn tự do hoà mình vào với làn nước trong xanh của biển Cát Bà.
                                                                <br />
                                                                <br /> 18h00 Đoàn về khách sạn nghỉ ngơi và dùng bữa tối tại nhà hàng với những sản vật của vùng biển Hạ Long – Cát Bà… Sau bữa tối, đoàn tự do dạo chơi hoặc có thể thuê xe đạp đôi dạo quanh thị Trấn ven Biển tuyệt đẹp này ( nghỉ đêm tại Khách sạn ở Cát Bà ) 
																</div>
                                                        </div>
                                                    </div>-->
                                                </div>
                                            </div>
                                            <!--<div id="tab-tour-images" class="tab-pane fade" role="tabpanel">
                                                <div class="tour-gall">
                                                    <div class="row">
                                                      <div class="panel-body"><?php echo $view['noi_dung'];?>
							</div>
                                                    </div>
                                                </div>
                                            </div>-->
                                            <div id="tab-tour-price" class="tab-pane fade" role="tabpanel"> </div>
                                            <div id="tab-tourfeat-2" class="tab-pane fade" role="tabpanel">
                                                <div class="cont-guid mgb-2">
                                                    <div class="block-core-a3 bg-info"><b>Tour Guide info</b>
                                                    </div>
                                                    <div class="block-core-a5">
                                                        <p><b>Tên:</b> </p>
                                                        <p><b>Điện thoại:</b> </p>
                                                    </div>
                                                </div>
                                                <div class="mgb-2">
                                                    <div class="block-core-a3 bg-info"><b>Lưu ý</b>
                                                    </div>
                                                    <div class="block-core-a5"> </div>
                                                </div>
                                            </div>
                                            <div id="tab-tour-contact" class="tab-pane fade" role="tabpanel"> </div>
                                        </div>
                                    </section>
                                </section>
                            </div>
                 
								


							
									
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
                         
					