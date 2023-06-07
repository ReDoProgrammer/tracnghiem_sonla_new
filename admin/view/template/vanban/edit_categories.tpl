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
                            <label>Tên Tiêu Đề</label>
                            <input name="tieu_de" class="form-control" type="text" value="<?php echo $categories['tieu_de'];?>">
                        </div>
						<!--
                        <div class="form-group">
                            <label>Nội dung họp <span class="style2">(*)</span></label>
                            <textarea name="" id="ctl00_phContent_txtNoidung" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
						 <div class="row">
						   <div class="col-md-6">
                                <div class="form-group">
                                    <label>Hình Ảnh Đại Diện</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn tài liệu</a>
                                    <input id="xFilePath" name="hinh_anh" class="form-control" type="text" value="<?php echo $categories['hinh_anh'];?>">
                                                  </div>
												  
												  	<div class="form-group">
                            <label><?php echo $link_anh;́ ?></label>
                            <input name="link_anh" class="form-control" type="text" value="<?php echo $categories['link_anh'];?>" >
                        </div>
                                    
                            </div>
							</div>
                        <div class="row">
						
					
						
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $kieu_file; ?><span class="style2">(*)</span></label>
                             
                                    <input name="kieu_file" class="form-control" type="text" value="<?php echo $categories['kieu_file'];?>" />
                                </div>
                                    
                            </div>
                            <div class="col-md-6">
							
							 <div class="form-group">
                                    <label>Giá<span class="style2">(*)</span></label>
                 
                                    <input name="price" class="form-control" type="text" value="<?php echo $categories['price'];?>" />
                                </div>
                              
                                    
                            </div>
							
							 <div class="col-md-6">
                                 <div class="form-group">
                                    <label>Dung lượng<span class="style2">(*)</span></label>
                 
                                    <input name="mb" class="form-control" type="text" value="<?php echo $categories['mb'];?>" />
                                </div>
                                    
                            </div>
							
							
							
                        </div>
                          <div class="form-group">
                                    <label><?php echo $link_tai;?></label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer1();"><i class="fa fa-paperclip"></i> Chọn file</a>
                                    <input id="xFilePath1" name="link_tai" class="form-control" type="text" value="<?php echo $categories['link_tai'];?>">
                                                  </div>
						
						 <div class="form-group">
                            <label><?php echo $mediafire; ?></label>
                            <input name="mediafire" class="form-control" type="text" value="<?php echo $categories['mediafire'];?>" >
                        </div>
						
						 <div class="form-group">
                            <label><?php echo $fshare; ?></label>
                            <input name="fshare" class="form-control" type="text" value="<?php echo $categories['fshare'];?>" >
                        </div>
						
						 <div class="form-group">
                            <label><?php echo $drive; ?></label>
                            <input name="drive" class="form-control" type="text" value="<?php echo $categories['drive'];?>" >
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
                                    <label><?php echo $pass; ?><span class="style2">(*)</span></label>
                 
                                    <input name="pass" class="form-control" type="text" value="<?php echo $categories['pass'];?>" />
                                </div>
                                    
                            </div>
							
								 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Video Demo<span class="style2">(*)</span></label>
                 
                                    <input name="Video" class="form-control" type="text" value="<?php echo $categories['video'];?>" />
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
                            <label><?php echo $mo_ta; ?></label>
                            <textarea name="mo_ta" id="test1" rows="10" cols="80" <?php echo $categories['mo_ta'];?>>
							
							
							</textarea>
                        </div>
						<!--
                        <div class="form-group">
                            <label>Ghi chú</label>
                            <textarea name="ctl00$phContent$txtGhiChu1" id="ctl00_phContent_txtGhiChu1" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
						
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $theo_danh_muc; ?> <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <select name="danh_muc_id" class="form-control">
						<option value="false"><?php echo "Lựa chọn"; ?></option>
						
						   <?php foreach ($list_danhmuc as $danhmuc){?> 
               
              <option value="<?php echo $danhmuc['ma_danh_muc']; ?>"><?php echo $danhmuc['ten_danh_muc']; ?></option>             
        
              <?php } ?>
										</select>
										
										  <?php if ($error_dm) { ?>
            <span class="error"><?php echo $error_dm; ?></span>
          <?php } ?>  
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo "Thuộc chủ đề"; ?> <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="chu_de_id" class="form-control">
			<option>----------<?php echo "Lựa chọn"; ?>----------</option>
              
              <?php foreach ($list_chude as $chude){?> 
             
              <option value="<?php echo $chude['id_chu_de']; ?>"><?php echo $chude['ten_chu_de']; ?></option>
            
       
              <?php } ?>

			</select>
                                        </div>
                                        
                                    </div>
                               
                                </div>
                            </div>
                        </div>
							  <div class="form-group">
                            <label><?php echo "Từ khóa"; ?></label>
                            <input name="tu_khoa" class="form-control" type="text" value="<?php echo $categories['tu_khoa'];?>" />
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
