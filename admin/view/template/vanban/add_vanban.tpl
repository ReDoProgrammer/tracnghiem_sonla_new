<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thêm Mới Văn Bản Tài Liệu
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Danh Sách Văn Bản</a></li>
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
                        <div class="form-group">
                            <label>Tên Văn Bản - Tài Liệu <span class="style2">(*)</span></label>
                            <input name="ten" class="form-control" type="text" value="<?php echo $_SESSION['ten'];?>">
							 <?php if ($error_tieude) { ?>
            <span class="error"><?php echo $error_tieude; ?></span>
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
                                    <label>File Đính Kèm</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn tài liệu</a>
                                    <input id="xFilePath" name="file" class="form-control" type="text" value="<?php echo $_SESSION['file'];?>">
                                                  </div>
												  
												  	<div class="form-group">
                            <label>Link Đính Kèm</label>
                            <input name="link" class="form-control" type="text" value="<?php echo $_SESSION['link'];?>" >
                        </div>
                                    
                            </div>
							</div>
                        <div class="row">
										
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Số Hiệu<span class="style2">(*)</span></label>
                             
                                    <input name="so_hieu" class="form-control" type="text" value="<?php echo $_SESSION['sohieu'];?>" />
                                </div>
                                    
                            </div>
                            <div class="col-md-6">
							
								 <div class="form-group">
										<label>Ngày Ban Hành<span class="style2">(*)</span></label>

										<div class="input-group date">
											<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
													<input id="datepicker" name="ngay_ban_hanh" class="form-control pull-right" type="text" value="<?php $_SESSION['ngaybanhanh'];?>">
								</div>
									
                             </div>
                              
                                    
                            </div>

 <div class="col-md-6">
							
								 <div class="form-group">
										<label>Phạm vi<span class="style2">(*)</span></label>

										<div class="input-group date">
											<div class="input-group-addon"><i class="fa fa-calendar"></i></div>
													<input  name="pham_vi" class="form-control pull-right" type="text" value="">
								</div>
									
                             </div>
                              
                                    
                            </div>
							
							 <div class="col-md-6">
                                 <div class="form-group">
                                    <label>Ngày Hiệu Lục<span class="style2">(*)</span></label>
                 
                                    <input id="datepicker1" name="hieu_luc" class="form-control" type="text" value="<?php echo $_SESSION['hieuluc'];?>" />
                                </div>
                                    
                            </div>
							
							
								 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Người Ký Văn Bản<span class="style2">(*)</span></label>
                 
                                    <input name="nguoi_ky" class="form-control" type="text" value="<?php echo $_SESSION['nguoiky'];?>" />
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
                                    <label>Loại Văn Bản <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <select name="loai_van_ban_id" class="form-control">
						<option value="1"><?php echo "Lựa chọn"; ?></option>
						
						    <?php if($list_loaivanban) {?>
                   <?php foreach ($list_loaivanban as $loaivanban) {?>
                   <?php if ($_SESSION['loaivanbanid'] == $loaivanban['loai_van_ban_id']) {?>
                    <option value ="<?php echo $loaivanban['loai_van_ban_id']; ?>" selected="selected"> <?php echo $loaivanban['ten_loai_van_ban']; ?>  </option>
                   <?php } else {?>
                   <option value ="<?php echo $loaivanban['loai_van_ban_id']; ?>"> <?php echo $loaivanban['ten_loai_van_ban']; ?>  </option>
                   <?php }} ?>
                   <?php }?>
										</select>
										
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Nơi Ban Hành <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="noi_ban_hanh_id" class="form-control">
			<option>----------<?php echo "Lựa chọn"; ?>----------</option>
              
            <?php if($list_noibanhanh) {?>
                   <?php foreach ($list_noibanhanh as $noibanhanh) {?>
                   <?php if ($_SESSION['noibanhanhid'] == $noibanhanh['noi_ban_hanh_id']) {?>
                    <option value="<?php echo $noibanhanh['noi_ban_hanh_id']; ?>" selected="selected"> <?php echo $noibanhanh['ten_noi_ban_hanh']; ?>  </option>
                   <?php } else {?>
                   <option value ="<?php echo $noibanhanh['noi_ban_hanh_id']; ?>"> <?php echo $noibanhanh['ten_noi_ban_hanh']; ?>  </option>
                   <?php } ?>
                   <?php } ?>
                   <?php }?>

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
											
						
                     
                        <div class="form-group">
                            <label><?php echo $motachitiet;?></label>
                            <textarea name="mo_ta" id="test1" rows="10" cols="80"/>
							
							 <?php echo $_SESSION['mota'];?>
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
