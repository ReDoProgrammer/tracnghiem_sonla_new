<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thêm Mới Sản Phẩm - OCOP
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Danh Sách Sản Phẩm</a></li>
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
                            <label>Tên sản phẩm <span class="style2">(*)</span></label>
                            <input name="tieu_de" class="form-control" type="text" value="<?php echo $_SESSION['tieude'];?>">
							
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
                                    <label>Hình Ảnh</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn hình ảnh</a>
                                    <input id="xFilePath" name="hinh_anh" class="form-control" type="text">
                                                  </div>
						
                            </div>
										
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Khu Vực<span class="style2">(*)</span></label>
                             
                                    <input name="khu_vuc" class="form-control" type="text" value="<?php echo $sanpham['khu_vuc'];?>" />
                                </div>
                                    
                            </div>
							</div>
                        <div class="row">
										
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Điện thoại<span class="style2">(*)</span></label>
                             
                                    <input name="phone" class="form-control" type="text" value="<?php echo $sanpham['phone'];?>" />
                                </div>
                                    
                            </div>
                            <div class="col-md-6">
							
							 <div class="form-group">
                                    <label>Địa chỉ<span class="style2">(*)</span></label>
                 
                                    <input name="dia_chi" class="form-control" type="text" value="<?php echo $sanpham['dia_chi'];?>" />
                                </div>
                              
                                    
                            </div>
							
							 <div class="col-md-6">
                                 <div class="form-group">
                                    <label>Email<span class="style2">(*)</span></label>
                 
                                    <input name="email" class="form-control" type="text" value="<?php echo $sanpham['email'];?>" />
                                </div>
                                    
                            </div>
							
							
								 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Website<span class="style2">(*)</span></label>
                 
                                    <input name="web" class="form-control" type="text" value="<?php echo $sanpham['web'];?>" />
                                </div>
                                    
                            </div>
							
                        </div>
                       
						
                        <div class="row">
						
							
							
							
							  <div class="col-md-6">
                                <div class="form-group">
                                    <label>Họ tên giám đốc<span class="style2">(*)</span></label>
                 
                                    <input name="ho_ten" class="form-control" type="text" value="" />
                                </div>
                                    
                            </div>
							
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Xếp hạng <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="xep_hang" class="form-control">
			<option>----------<?php echo "Lựa chọn"; ?>----------</option>
              
           
              <option value="1"><?php echo "1 sao"; ?></option>
              <option value="2"><?php echo "2 sao"; ?></option>
              <option value="3"><?php echo "3 sao"; ?></option>
              <option value="4"><?php echo "4 sao"; ?></option>
              <option value="5"><?php echo "5 sao"; ?></option>
            

			</select>
                                        </div>
                                        
                                    </div>
                               
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
                                    <label>Đơn vị<span class="style2">(*)</span></label>
                 
                                    <input name="don_vi" class="form-control" type="text" value="" />
                                </div>
                                    
                            </div>
							
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Nơi Ban Hành <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="muc_id" class="form-control">
			<option>----------<?php echo "Lựa chọn"; ?>----------</option>
              
            <?php if($list_dm) {?>
                   <?php foreach ($list_dm as $sanpham) {?>
                   <?php if ($_SESSION['dmid'] == $sanpham['id_danh_muc']) {?>
                    <option value="<?php echo $sanpham['id_danh_muc']; ?>" selected="selected"> <?php echo $sanpham['ten_danh_muc_sp']; ?>  </option>
                   <?php } else {?>
                   <option value ="<?php echo $sanpham['id_danh_muc']; ?>"> <?php echo $sanpham['ten_danh_muc_sp']; ?>  </option>
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
                            <label>Mô Tả</label>
                            <textarea name="mo_ta" class="form-control" style="height:70px; max-height:137px; max-width:100%"><?php echo $sanpham['mo_ta'];?></textarea>
                        </div>
						
                        <div class="form-group">
                            <label><?php echo $motachitiet;?></label>
                            <textarea name="noi_dung" id="test1" rows="10" cols="80">
							
							 <?php echo $sanpham['noi_dung'];?>
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
