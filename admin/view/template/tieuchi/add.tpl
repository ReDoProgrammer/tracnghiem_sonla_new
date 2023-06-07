<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thêm mới bộ tiêu chí
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Danh sách bộ tiêu chí</a></li>
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
                            <label>Tiêu đề <span class="style2">(*)</span></label>
                            <input name="tieu_de" class="form-control" type="text">
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
                                    <label>Danh mục <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="dmtieuchi_id" class="form-control">
			<option>----------<?php echo "Lựa chọn"; ?>----------</option>
              
            <?php if($list_dm) {?>
                   <?php foreach ($list_dm as $dm) {?>
                   <?php if ($_SESSION['dmtieuchiid'] == $dm['id_dmtieuchi']) {?>
                    <option value="<?php echo $dm['id_dmtieuchi']; ?>" selected="selected"> <?php echo $dm['ten_dm']; ?>  </option>
                   <?php } else {?>
                   <option value ="<?php echo $dm['id_dmtieuchi']; ?>"> <?php echo $dm['ten_dm']; ?>  </option>
                   <?php } ?>
                   <?php } ?>
                   <?php }?>

			</select>
                                        </div>
                                        
                                    </div>
                               
                                </div>
                            </div>
							
							
						
						   <div class="col-md-6">
                                <div class="form-group">
                                    <label>File đính kèm</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn file đính kém</a>
                                    <input id="xFilePath" name="files" class="form-control" type="text" value="<?php echo $_SESSION['file'];?>">
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
                            <textarea name="mo_ta" class="form-control" style="height:70px; max-height:137px; max-width:100%"/><?php echo $_SESSION['mota'];?></textarea>
                        </div>
						
                        <div class="form-group">
                            <label><?php echo $motachitiet;?></label>
                            <textarea name="noi_dung" id="test1" rows="10" cols="80"/>
							
							 <?php echo $_SESSION['noidung'];?>
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
