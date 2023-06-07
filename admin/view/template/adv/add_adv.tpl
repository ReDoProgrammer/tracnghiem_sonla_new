<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Bài Viết
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Danh Sách tin tức</a></li>
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
                        <div class="form-group" style="width: 50%;">
                            <label>Tên Tiêu Đề <span class="style2">(*)</span></label>
                            <input name="tieu_de" class="form-control" type="text">
                        </div>				                                                   					
						
                        <div class="row">
				
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Hình Ảnh Đại Diện</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn tài liệu</a>
                                    <input id="xFilePath" name="hinh_anh" class="form-control" type="text">
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
						
						<div class="row">
						<div class="col-md-8">
						 <div class="form-group" style="width: 100%;">
                            <label>Link Ảnh <span class="style2">(*)</span></label>
                            <input name="link" class="form-control" type="text">
                        </div>
						</div>
						</div>
                
						<!--
                        <div class="form-group">
                            <label>Ghi chú</label>
                            <textarea name="ctl00$phContent$txtGhiChu1" id="ctl00_phContent_txtGhiChu1" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
				
                        <div class="row">
											
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Lựa Chọn Bên <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <select name="lua_chon_id" class="form-control">
						<option value=""><?php echo "Lựa chọn"; ?></option>
						
						
              <option value="2"><?php echo "Trung tâm khối 1"; ?></option>
              <option value="3"><?php echo "Quảng Cáo Phải Trên"; ?></option>
              <option value="4"><?php echo "Quảng Cáo Phải Dưới"; ?></option>
              
              <option value="5"><?php echo "Trung tâm Cuối trang"; ?></option>
            
										</select>
										
	 
                                     
                                    </div>
                                </div>
                            </div>
							</div>
							 <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo "Hiện thị trang"; ?> <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="trang_moi" class="form-control">
			<option>----------<?php echo "Lựa chọn"; ?>----------</option>
              
           <option><?php echo "Lựa chọn"; ?></option>
              <option value="0"><?php echo "Hiện tranh mới"; ?></option>
              <option value="1"><?php echo "Ở lại trang"; ?></option>

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

<script type="text/javascript">

function BrowseServer()
{
	// You can use the "CKFinder" class to render CKFinder in a page:
	var finder = new CKFinder();
	finder.basePath = './view/javascript/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
	finder.selectActionFunction = SetFileField;
	finder.popup();

	// It can also be done in a single line, calling the "static"
	// popup( basePath, width, height, selectFunction ) function:
	// CKFinder.popup( '../', null, null, SetFileField ) ;
	//
	// The "popup" function can also accept an object as the only argument.
	// CKFinder.popup( { basePath : '../', selectActionFunction : SetFileField } ) ;
}

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
}

</script>
