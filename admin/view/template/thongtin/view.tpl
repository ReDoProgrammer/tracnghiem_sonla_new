<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thông Tin Đăng Ký
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=thongtin&act=list">Thông Tin</a></li>
        
    </ol>

            </section>
          
		
		   <!-- Main content -->
    
    <!-- /.content -->
		  
		  
		
		
				   <!-- Main content -->
    <section class="content">
        <!--
		<div class ="warning"><?php //echo $_SESSION['warning']; unset($_SESSION['warning']);?> </div>
		-->
	    <div class ="success">Trạng thái hồ sơ: <?php echo $tths['ten_trang_thai'];?>  <br/><?php echo $thongtin['but_phe']; ?> </div>

      <div class="row">
       
        <!-- /.col -->
        <div class="col-md-12">
          <div class="nav-tabs-custom">
          
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                
				   <div class="box-body"> 
				   
				    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onclick="return validate(this);">
					
                            <div class="row">
							
							<div class="legend-box">
<div class="legend-head">
<span class="txt">Thông tin người đăng ký</span>
</div>
<div class="legend-body" style="display: block;">
<div class="row">


                                <div class="col-md-6" id="pop1">
                                    
									

									
									
                                    
                                    <div class="form-group">
                                        <label>Họ Và Tên: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNgaysinh" class="text-center"><?php echo $thongtin['ho_ten']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày Sinh: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNoisinh" class="text-center"><?php echo $thongtin['ngay_sinh']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Số CMT/ Thẻ CCCC: &nbsp;</label>
                                        <span id="ctl00_phContent_lblGioitinh" class="text-center"><?php echo $thongtin['cmt']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày Cấp: &nbsp;</label>
                                        <span id="ctl00_phContent_lblQuequan" class="text-center"><?php echo $thongtin['ngay_cap']; ?></span>
										<label>Nơi Cấp: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDiachi" class="text-center"><?php echo $thongtin['noi_cap']; ?></span>
                                    </div>
                                 
									<!--
                                    <div class="form-group">
                                        <label>CQ / Đơn Vị: &nbsp;</label>
                                        <span id="ctl00_phContent_lblTongiao" class="text-center"><?php echo $thongtin['ten_co_quan']; ?></span>
                                    </div>
									-->
                                      <div class="form-group">
                                        <label>Điện thoại: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDienthoai" class="text-center"><?php echo $thongtin['dien_thoai']; ?></span>
                                    </div>
									
                                    <div class="form-group">
                                        <label>Email: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDidong" class="text-center"><?php echo $thongtin['email']; ?></span>
                                    </div>
                                   
                                </div>
								
								
								
                                <div class="col-md-6" id="pop2">
                                    
                                   
                                   <div class="form-group">
                                        <label>KV đang ở: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDantoc" class="text-center"><?php echo $thongtin['ten_dia_phuong']; ?></span>
                                    </div>
									
									 <div class="form-group">
                                        <label>Hộ khẩu: &nbsp;</label>
                                        <span id="ctl00_phContent_lblCMND" class="text-center"><?php echo $thongtin['thuong_tru']; ?></span>
                                    </div>
									
                                    <div class="form-group">
                                        <label>Nơi ở hiện tại: &nbsp;</label>
                                        <span id="ctl00_phContent_lblCMND" class="text-center"><?php echo $thongtin['noi_cu_tru']; ?></span>
                                    </div>
									
									
									   <div class="form-group">
                                        <label>Số lượng nhân khẩu: &nbsp;</label>
                                        <span id="ctl00_phContent_lblCMND" class="text-center"><?php echo $thongtin['nhan_khau']; ?></span>
                                    </div>
									
                                    <div class="form-group">
                                        <label>Thời gian đăng ký: &nbsp;</label>
                                        <span id="" class="text-center"><?php echo date_format(date_create($thongtin['time']),'H:i:s - d/m/Y'); ?></span>
                                    </div>
									
                                    <div class="form-group">
                                        <label> Ghi Chú: &nbsp;</label>
                                        <span id="ctl00_phContent_lblEmail" class="text-center"><?php echo $thongtin['ghi_chu']; ?></span>
                                    </div>
                                </div>
	
</div>
</div>
</div>

<div class="legend-box">
<div class="legend-head">
<span class="txt">Thông tin tài khoản ngân hàng</span>
</div>
<div class="legend-body" style="display: block;">
<div class="row">


                                <div class="col-md-4" id="pop1">
                          				
                                <div class="form-group">
                                        <label>Chủ TK: &nbsp;</label>
 				   <div class="form-group">
                                       <span id="ctl00_phContent_lblEmail" class="text-center"><?php echo $thongtin['chu_tk']; ?></span>
                                    </div>
 				 </div>
                                   
                                </div>

  <div class="col-md-4" id="pop1">
                          				
                                <div class="form-group">
                                        <label>Số tài khoản: &nbsp;</label>
 				   <div class="form-group">
                                       <span id="ctl00_phContent_lblEmail" class="text-center"><?php echo $thongtin['so_tk']; ?></span>
                                    </div>
 				 </div>
                                   
                                </div>

  <div class="col-md-4" id="pop1">
                          				
                                <div class="form-group">
                                        <label>CN Ngân hàng: &nbsp;</label>
 				   <div class="form-group">
                                       <span id="ctl00_phContent_lblEmail" class="text-center"><?php echo $thongtin['chi_nhanh']; ?></span>
                                    </div>
 				 </div>
                                   
                                </div>

								
								
								
                              
								
								
								


</div>
</div>
</div>


<div class="legend-box">
<div class="legend-head">
<span class="txt">Tài liệu xác minh</span>
</div>
<div class="legend-body" style="display: block;">
<div class="row">


                                               <div class="col-md-6" id="pop1">
                                 	 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="https://fengyuanchen.github.io/viewer/css/viewer.css">
	    <link rel="stylesheet" href="https://fengyuanchen.github.io/viewer/css/main.css">
<script type="text/javascript" src="https://fengyuanchen.github.io/viewer/js/viewer.js"></script>
<script type="text/javascript" src="https://fengyuanchen.github.io/viewer/js/main.js"></script>	   
									

								
                                <div class="form-group">
								    <div class="docs-galley mb-6">
									  <ul class="docs-pictures clearfix">	
									  <li>
		  
                                        <label>CMND/CCCD mặt trước: &nbsp;</label>
                                       <?php if($thongtin['anh_cmt1']) { ?>
										<img data-original="../<?php echo $thongtin['anh_cmt1']; ?>" src="../<?php echo $thongtin['anh_cmt1']; ?>" width="220" height="125" alt="" />
										<?php } else { ?> <img src="./data/images/no_image.jpg" width="120" height="75" alt="" /> <?php } ?>
											
											</li>
										</ul>
									</div> 
	 							</div>	


								
									
                                      <div class="form-group">
								    <div class="docs-galley mb-6">
									  <ul class="docs-pictures clearfix">	
									  <li>
		  
                                        <label>CMND/CCCD mặt sau: &nbsp;</label>
                                       <?php if($thongtin['anh_cmt2']) { ?>
										<img data-original="../<?php echo $thongtin['anh_cmt2']; ?>" src="../<?php echo $thongtin['anh_cmt2']; ?>" width="220" height="125" alt="" />
										<?php } else { ?> <img src="./data/images/no_image.jpg" width="120" height="75" alt="" /> <?php } ?>
											
											</li>
										</ul>
									</div> 
	 							</div>	
									
									
									
                                </div>
								
								
								
                                <div class="col-md-6" id="pop2">
                                    
                                   <div class="form-group">
								    <div class="docs-galley mb-6">
									  <ul class="docs-pictures clearfix">	
									  <li>
		  
                                        <label>Giấy xác nhận nơi cư trú: &nbsp;</label>
                                       <?php if($thongtin['anh_xac_nhan']) { ?>
										<img data-original="../<?php echo $thongtin['anh_xac_nhan']; ?>" src="../<?php echo $thongtin['anh_xac_nhan']; ?>" width="220" height="125" alt="" />
										<?php } else { ?> <img src="./data/images/no_image.jpg" width="120" height="75" alt="" /> <?php } ?>
											
											</li>
										</ul>
									</div> 
									
									 <div class="form-group">
								    <div class="docs-galley mb-6">
									  <ul class="docs-pictures clearfix">	
									  <li>
		  
                                        <label>Giấy tờ khác: &nbsp;</label>
                                       <?php if($thongtin['giay_to_khac']) { ?>
										<img data-original="../<?php echo $thongtin['giay_to_khac']; ?>" src="../<?php echo $thongtin['giay_to_khac']; ?>" width="220" height="125" alt="" />
										<?php } else { ?> <img src="./data/images/no_image.jpg" width="120" height="75" alt="" /> <?php } ?>
											
											</li>
										</ul>
									</div> 
									
							
                                  
                                </div>
								
								
								


</div>
</div>
</div>
				


<div class="legend-box">
<div class="legend-head"><span class="txt">Tiến độ xử lý</span></div>
<div class="legend-body" style="display: block;">
<div class="row">
 <div class="col-md-12" id="pop1">
                                    <?php if($list_nkxl) { ?>
			                        	 <table class="table table-bordered table-striped table-hover" >
												  <?php //$list_nkxl = get_list_nkxl($thongtin['id_thongtin'],0,100); ?>
												    <tr>
												  	 <th style="text-align: center; width:10%";>ID</th>
													 <th width="10%">Thời gian</th>
													 <th width="55%">Nội dung thông báo</th>
												     <th style="text-align: center; width:20%";>Thực hiện</th>
												  </tr>
												  <?php foreach($list_nkxl as $nkxl) { ?>
												
												  
												  
												  <tr>

											 
												  <td style="text-align: center;"><?php echo $nkxl['tdxl_id'];?></td>
												  <td><?php echo date_format(date_create($nkxl['ngay_gio']),'H:i:s - d/m/Y'); ?></td>
												  <td>
												   <span class="badge bg-<?php echo mau_sac($nkxl['trang_thai_id']);?> ng-scope">  <?php echo $nkxl['ten_trang_thai'];?></span>
												<?php if( $nkxl['hanh_dong']) { ?>  <?php echo $nkxl['hanh_dong'];?> <?php } ?>
												  
												  </td>
												  <th style="text-align: center; width:20%";><?php $cb = get_can_bo($nkxl['uid']); echo $cb['ho_ten'];?> (<?php echo $cb['tai_khoan'];?>)</th>
												  </tr>
												  <?php } ?>
												  </table>
									<?php } ?>
		

</div>
</div>
</div>
</div>




<div class="legend-box">
<div class="legend-head">
<span class="txt">Xác minh hồ sơ</span>
</div>
<div class="legend-body" style="display: block;">
<div class="row">


                                <div class="col-md-8" id="pop1">
                                    
									

									
								
                                   <div class="form-group">
								   
								   <?php foreach($list_trang_thai as $trang_thai) { ?>
								   <?php if($trang_thai['trang_thai_id']==$thongtin['tinh_trang']) { ?>
								     <span id="ctl00_phContent_lblNoicap" class="text-center"><input  id="thu_ly2" type ="radio" name="tinh_trang" value="<?php echo $trang_thai['trang_thai_id'];?>" checked/> <?php echo $trang_thai['ten_trang_thai'];?> &nbsp;&nbsp;</span>
								   <?php } else { ?>
								   <span id="ctl00_phContent_lblNoicap" class="text-center"><input  id="thu_ly2" type ="radio" name="tinh_trang" value="<?php echo $trang_thai['trang_thai_id'];?>"/> <?php echo $trang_thai['ten_trang_thai'];?> &nbsp;&nbsp;</span>
								   <?php }} ?>
                                        
                                     
										

								   </div>
									
									
									 <div class="form-group">
									  <label>Nội dung xử lý<span class="style2">(*)</span></label>
									  <textarea name="but_phe" class="form-control" style="height:70px; max-height:137px; max-width:100%"><?php //echo $thongtin['but_phe'];?></textarea>
								     </div>     
                                    
                                </div>
								</form>
								
								
								
								
								


</div>
</div>
</div>
									
           

<div class="box-footer text-center">

<button class="btn btn-sm btn-primary btn-flat" onclick="location = '<?php echo $_SESSION['back']; ?>';" style="margin-top:4px">
<i class="fa fa-check-square-o"></i>
Lưu lại
</button>
<a class="btn btn-sm btn-primary btn-flat" onclick="history.go(-1);" style="margin-top:4px">
<i class="fa fa-arrow-left"></i>
Hủy
</a>

<a class="btn btn-sm btn-primary btn-flat" href="index.php?module=thongtin&act=<?php echo "edit";?>&id=<?php echo $thongtin['id_thongtin']; ?>" style="margin-top:4px">
<i class="fa fa-pencil"></i>
Sửa hồ sơ
</a>
</div>	
					   
                          
                              
                            </div>
                            </div><!-- /.box-body -->      
							
				
				
                <!-- /.post -->

             

              </div>
          
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
		 
		  
		  
		  
		  
		  
        </div>
        



<?php include('view/template/common/footer.tpl'); ?>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
    <script>
  $( function() {
    $( "#datepicker1" ).datepicker();
  } );
  </script>
  
  <script>
      function quay_lai_trang_truoc(){
          history.back();
      }
  </script>
  