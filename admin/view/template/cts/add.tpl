<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thêm Mới Người Dùng Chữ Ký Số Online
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Thêm Mới Người Dùng Chữ Ký Số Online</a></li>
        <li class="active">Thêm Mới</li>
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        



<div class="box box-warning">

<div class="box-header with-border">
<h3 class="box-title">Thông tin chính </h3>
<div class="pull-right">
<span style="font-style:italic">
(
<strong style="color:red">*</strong>
) Là thông tin bắt buộc
</span>
</div>
</div>

       <div class="box-body" id="boxBody">
	    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onclick="return validate(this);">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                      
						<!--
                        <div class="form-group">
                            <label>Nội dung họp <span class="style2">(*)</span></label>
                            <textarea name="" id="ctl00_phContent_txtNoidung" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
						
						
						 <div class="legend-box">
							<div class="legend-head">
								<span class="txt">Địa chỉ Email </span>
							</div>
<div class="legend-body" style="display: block;">
<div class="row">
<div class="col-sm-6 col-xs-12">
<div class="input-group">
<span class="input-group-addon">@</span>
<input class="form-control" name="email" type="text" placeholder="@sonla.gov.vn" value="<?php echo $_SESSION['email'];?>" />
										
</div>
	
											 <?php if ($error_email2) { ?>
            <span class="error">
			<?php echo $error_email2; ?></span>
          <?php } ?>  
</div>

<div class="col-sm-5 col-xs-12">
	<label class="label-warning oep-label-red">Email sẽ đươc sử dụng làm tài khoản </label>					
</div>

</div>
</div>
</div>


   <div class="row">
										
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Họ Và Tên<span class="style2">(*)</span></label>
                             
                                    <input name="ho_ten" class="form-control" type="text" value="<?php echo $_SESSION['hoten'];?>" />
									
											 <?php if ($error_hoten) { ?>
            <span class="error">
			<?php echo $error_hoten; ?></span>
          <?php } ?>  
                                </div>
                                    
                            </div>
							
                            <div class="col-md-6">
							
							 <div class="form-group">
                                    <label>Ngày Sinh<span class="style2">(*)</span></label>
                 
                                    <input name="ngay_sinh" class="form-control" id="datepicker1" type="text" value="<?php echo $_SESSION['ngaysinh'];?>" />
									 <?php if ($error_ns) { ?>
            <span class="error">
			<?php echo $error_ns; ?></span>
          <?php } ?>  
                                </div>
                              
                                    
                            </div>										
    	
						 
						 
						
							</div>
							
					<div class="row">
<div class="col-xs-3">
 <div class="form-group">
  <label>Số CMT<span class="style2">(*)</span></label>
<input class="form-control" name="so_cmt" type="text" placeholder="Số CMT" value="<?php echo $_SESSION['cmt'];?>" />
 <?php if ($error_cmt) { ?>
            <span class="error">
			<?php echo $error_cmt; ?></span>
          <?php } ?>  
</div></div>
<div class="col-xs-4">
 <div class="form-group">
  <label>Ngày Cấp<span class="style2">(*)</span></label>
<input class="form-control" name="ngay_cap" type="text" id="datepicker" placeholder="Ngày cấp" value="<?php echo $_SESSION['ngaycap'];?>" />
 <?php if ($error_ngaycap) { ?>
            <span class="error">
			<?php echo $error_ngaycap; ?></span>
          <?php } ?> 
</div></div>
<div class="col-xs-5">
 <div class="form-group">
  <label>Nơi Cấp<span class="style2">(*)</span></label>
<input class="form-control" name="noi_cap" type="text" placeholder="Nơi Cấp" value="<?php echo $_SESSION['noicap'];?>" />
 <?php if ($error_noicap) { ?>
            <span class="error">
			<?php echo $error_noicap; ?></span>
          <?php } ?> 
</div>
</div>
</div>
	
							
                        <div class="row">
										
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label>Tên Cơ quan - Đơn Vị<span class="style2">(*)</span></label>
                             
                                    <input name="ten_co_quan" class="form-control" type="text" value="<?php echo $_SESSION['tencq'];?>" />
									 <?php if ($error_tencq) { ?>
            <span class="error">
			<?php echo $error_tencq; ?></span>
          <?php } ?> 
                                </div>
                                    
                            </div>
							
                            <div class="col-md-5">
							
							 <div class="form-group">
                                    <label>Tỉnh - Thành Phố<span class="style2">(*)</span></label>
                 
                                    <input name="tinh_thanh" class="form-control" type="text" value="<?php echo $_SESSION['tinhthanh'];?>" />
									 <?php if ($error_tinhthanh) { ?>
            <span class="error">
			<?php echo $error_tinhthanh; ?></span>
          <?php } ?> 
                                </div>
                              
                                    
                            </div>
							
							 <div class="col-md-6">
                                 <div class="form-group">
                                    <label>Chức Vụ<span class="style2">(*)</span></label>
                 
                                    <input name="chuc_vu" class="form-control" type="text" value="<?php echo $_SESSION['chucvu'];?>" />
			   <?php if ($error_chucvu) { ?>
            <span class="error">
			<?php echo $error_chucvu; ?></span>
          <?php } ?> 
                                </div>
        
                            </div>
							
							
								 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Chức danh thẩm quyền<span class="style2">(*)</span></label>
                 
                                    <input name="chuc_danh" class="form-control" type="text" value="<?php echo $_SESSION['chucdanh'];?>" />
									   <?php if ($error_chucdanh) { ?>
            <span class="error">
			<?php echo $error_chucdanh; ?></span>
          <?php } ?> 
                                </div>
                                    
                            </div>
							
							 <div class="col-md-6">
                                 <div class="form-group">
                                    <label>Địa Chỉ<span class="style2">(*)</span></label>
                 
                                    <input name="dia_chi" class="form-control" type="text" value="<?php echo $_SESSION['diachi'];?>" />
									<?php if ($error_diachi) { ?>
            <span class="error">
			<?php echo $error_diachi; ?></span>
          <?php } ?> 
                                </div>
                                    
                            </div>
							
							
								 <div class="col-md-3">
                                <div class="form-group">
                                    <label>Di Dộng<span class="style2">(*)</span></label>
                 
                                    <input name="dien_thoai" class="form-control" type="text" value="<?php echo $_SESSION['didong'];?>" />
									<?php if ($error_didong) { ?>
            <span class="error">
			<?php echo $error_didong; ?></span>
          <?php } ?> 
                                </div>
                                    
                            </div>
							 <div class="col-md-3">
                                <div class="form-group">
                                    <label>Máy Bàn</label>
                 
                                    <input name="may_ban" class="form-control" type="text" value="" />
                                </div>
                                    
                            </div>
							
                        </div>
                       
						
                        <div class="row">
						<!--
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tài liệu cuộc họp</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="document.getElementById('popUpDinhKem').style.display = 'block';"><i class="fa fa-paperclip"></i> Chọn tài liệu</a>
                                    <input name="ctl00$phContent$txtFileVB" id="ctl00_phContent_txtFileVB" class="form-control" disabled="disabled" type="text">
                                    <input name="ctl00$phContent$txt_hideCongvan" id="ctl00_phContent_txt_hideCongvan" class="form-control" style="display:none" type="text">
                                </div>
                                    
                            </div>-->
							
							
							
							
							      <div class="col-md-6">
                                <div class="form-group">
                                    <label>Cá Nhân - Tổ Chức <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <select name="tochuc_canhan_id" class="form-control">
										
						<option value="false"><?php echo "Lựa chọn"; ?></option>
						
						      <?php if($_SESSION['canhantochuc']=='1'){ ?>
          <option value="1" selected="selected"><?php echo "Cá Nhân"; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo "Cá Nhân"; ?></option>
          <?php } ?>
          <?php if($_SESSION['canhantochuc']=='2'){ ?>
          <option value="2" selected="selected"><?php echo "Tổ Chức"; ?></option>
          <?php } else { ?>
          <option value="2"><?php echo "Tổ Chức"; ?></option>
          <?php } ?> 
							
										</select>
				  <?php if ($error_tochuccanhan) { ?>
            <span class="error"><?php echo $error_tochuccanhan; ?></span>
          <?php } ?>  						
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Gói cước đăng ký</label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="goi_dang_ky" class="form-control">
			<option>----------<?php echo "Lựa chọn"; ?>----------</option>
							
							 <?php if($_SESSION['goidangky']=='1'){ ?>
          <option value="1" selected="selected"><?php echo "Đăng Ký Mới"; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo "Đăng Ký Mới"; ?></option>
          <?php } ?>
          <?php if($_SESSION['goidangky']=='2'){ ?>
          <option value="2" selected="selected"><?php echo "Gia Hạn Đăng Ký"; ?></option>
          <?php } else { ?>
          <option value="2"><?php echo "Gia Hạn Đăng Ký"; ?></option>
          <?php } ?> 

			</select>
                                        </div>
                                        
                                    </div>
                               
                                </div>
                            </div>
							
							
							
							
                            <!--<div class="col-md-6">
                                <div class="form-group">
                                    <label>Văn bản liên quan</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="document.getElementById('popUpLienQuan').style.display = 'block';"><i class="fa fa-paperclip"></i> Chọn văn bản</a>
                                    <input name="ctl00$phContent$txtVBLQ" id="ctl00_phContent_txtVBLQ" class="form-control" disabled="disabled" type="text">
                                    <input name="ctl00$phContent$txt_hideLienket" id="ctl00_phContent_txt_hideLienket" class="form-control" style="display:none" type="text">
                                </div>
                                    
                            </div>-->
                        </div>
											
					
												
						 <div class="legend-box">
							<div class="legend-head">
								<span class="txt">Mẫu Tổ Chức - Thông Tin Quản Lý Chứng Thư Số</span>
							</div>
<div class="legend-body" style="display: block;">
<div class="row">
 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Địa chỉ thư điện tử:</label>
                 
                                    <input name="email1" class="form-control" type="text" value="" />
                                </div>
                                    
                            </div>
 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Cơ quan, tổ chức công tác</label>
                 
                                    <input name="coquan_congtac" class="form-control" type="text" value="" />
                                </div>
                                    
                            </div>
							
								 <div class="col-md-12">
                                <div class="form-group">
                                    <label>Số chứng thư số cũ</label>
                 
                                    <input name="chuc_thu_cu" class="form-control" type="text" value="" />
                                </div>
                                    
                            </div>

</div>
</div>
</div>
						
                        <div class="form-group">
                            <label><?php echo $motachitiet;?></label>
                            <textarea name="ghi_chu" id="test1" rows="10" cols="80">
							
							
							</textarea>
                        </div>
					
						
                    <!--
							  <div class="form-group">
                            <label><?php echo "Từ khóa"; ?></label>
                            <input name="tu_khoa" class="form-control" type="text" value="<?php echo $_SESSION['tukhoa'];?>" />
                        </div>-->
					

			</form>
			
			
		<div class="box-footer text-center">

<button class="btn btn-sm btn-primary btn-flat" onclick="location = '<?php echo $link_list; ?>';" style="margin-top:4px">
<i class="fa fa-check-square-o"></i>
Thêm Mới
</button>
<a class="btn btn-sm btn-primary btn-flat" onclick="history.go(-1);" style="margin-top:4px">
<i class="fa fa-arrow-left"></i>
Hủy
</a>
</div>	
			
			
			
			
			
			
			
			</div>



			
			
			
                    </div>
                </div>
            </section>
        </div>
        
 <script type="text/javascript">
function confirmDelete(delUrl) {
   if (confirm("Ban co chac chan la muon xoa bai viet nay")) {
     document.location = delUrl;
}
}
</script>



<?php include('view/template/common/footer.tpl'); ?>
