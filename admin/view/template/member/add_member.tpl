<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Danh Mục Download
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Danh Sách file</a></li>
        <li class="active">Danh sách</li>
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
                        <div class="form-group">
                            <label>Tên Tài Khoản <span class="style2">(*)</span></label>
                            <input name="tai_khoan" class="form-control" type="text" value="<?php echo $_SESSION['tai_khoan'];?>"/>
							 <?php if ($error_tk) { ?>
				<span class="error"><?php echo $error_tk; ?></span>
							<?php } ?>
                        </div>
						<!--
                        <div class="form-group">
                            <label>Nội dung họp <span class="style2">(*)</span></label>
                            <textarea name="" id="ctl00_phContent_txtNoidung" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
						
                        <div class="row">
						
						
						
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $mat_khau; ?><span class="style2">(*)</span></label>
                             
                                    <input name="password" class="form-control" type="password" value="" />
									 <?php if ($error_mk) { ?>
        <span class="error"><?php echo $error_mk; ?></span>
        <?php } ?>
                                </div>
                                    
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $xac_nhan_mat_khau; ?><span class="style2">(*)</span></label>
                 
                                    <input name="xac_nhan_mat_khau" class="form-control" type="password" value="" />
									 <?php if ($error_mk1) { ?>
        <span class="error"><?php echo $error_mk1; ?></span>
        <?php } ?>
									
                                </div>
                                    
                            </div>
							
							
                        </div>
						
						
						 <div class="row">
						
						
						
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $ho_va_ten; ?><span class="style2">(*)</span></label>
                             
                                    <input name="ho_ten" class="form-control" type="text" value="<?php echo $_SESSION['ten'];?>" />
									  <?php if ($error_name) { ?>
									<span class="error"><?php echo $error_name; ?></span>
									<?php } ?>
                                </div>
                                    
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $email; ?><span class="style2">(*)</span></label>
                 
                                    <input name="email" class="form-control" type="text" value="<?php echo $_SESSION['email'];?>" />
									  <?php if ($error_email2) { ?>
												<span class="error"><?php echo $error_email2; ?></span>
											<?php } ?>
                                </div>
                                    
                            </div>
							
							
                        </div>
						
						 <div class="row">
						   <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $avatar;?></label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn Ảnh Đại Diện</a>
                                    <input id="xFilePath" name="hinh_anh" class="form-control" type="text">
                                                  </div>
                                    
                            </div>
							</div>
							
							
							 <div class="row">
							 <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $mobile; ?><span class="style2">(*)</span></label>
                             
                                    <input name="mobile" class="form-control" type="text" value="<?php echo $_SESSION['mobile'];?>" />
									 <?php if ($error_mobile) { ?>
        <span class="error"><?php echo $error_mobile; ?></span>
        <?php } ?>
                                </div>
                                    
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo "Website"; ?><span class="style2">(*)</span></label>
                 
                                    <input name="web" class="form-control" type="text" value="<?php echo $_SESSION['web'];?>" />
									 
                                </div>
                                    
                            </div>
							
							
                        </div>
						
                      
					
						 
						
						
		 <div class="form-group">
                            <label><?php echo $dia_chi; ?><span class="style2">(*)</span></label>
                            <textarea name="dia_chi" class="form-control" style="height:70px; max-height:137px; max-width:100%"><?php echo $_SESSION['diachi'];?></textarea>
                        </div>  
						<!--
                        <div class="form-group">
                            <label>Ghi chú</label>
                            <textarea name="ctl00$phContent$txtGhiChu1" id="ctl00_phContent_txtGhiChu1" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
						
                        <div class="row">
           
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $phan_quyen; ?> <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="phan_quyen" class="form-control">
			<option>----------<?php echo "Thành viên"; ?>----------</option>
              
              <?php if($_SESSION['phanquyen']=='1'){ ?>
          <option value="1" selected="selected"><?php echo "Quản trị web"; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo "Quản trị web"; ?></option>
          <?php } ?>
          <?php if($_SESSION['phanquyen']=='2'){ ?>
          <option value="2" selected="selected"><?php echo "Phát triển website"; ?></option>
          <?php } else { ?>
          <option value="2"><?php echo "Phát triển website"; ?></option>
          <?php } ?> 

			</select>
                                        </div>
                                        
                                    </div>
                               
                                </div>
                            </div>
                        </div>
							 

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
