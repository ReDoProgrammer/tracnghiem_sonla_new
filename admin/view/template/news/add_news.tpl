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
                        <div class="form-group">
                            <label>Tên Tiêu Đề <span class="style2">(*)</span></label>
                            <input name="tieu_de" class="form-control" type="text" value="<?php echo $_SESSION['tieude'];?>">
							 <?php if ($error_tieude) { ?>
            <span class="error"><?php echo $error_tieude; ?></span>
          <?php } ?> 
                        </div>
				
                        <div class="row">
						
						 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Danh Mục</label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                           <select class="form-control" name="dm_id" id="dm_id" onchange="$('select[name=\'id_dm_nho\']').load('index.php?module=dmnho&act=danhsachdmnhotheodm&dm_id='+this.value+'&id_dm_nho=<?php echo $address['id_dm_nho'];?>');">
               
              <option value="false">----------<?php echo "Lựa chọn"; ?>----------</option>
              
              <?php foreach ($list_dm as $danhmuc){?> 
			  
			      <?php if ($_SESSION['dmid'] == $danhmuc['id']) {?>
              <option value="<?php echo $danhmuc['id']; ?>" selected="selected"><?php echo $danhmuc['title']; ?></option>
			 <?php } else {?>
             <option value="<?php echo $danhmuc['id']; ?>"><?php echo $danhmuc['title']; ?></option>
                   <?php } ?>
                   <?php } ?>
            
          </select>
          <?php if ($error_danhmuc) { ?>
            <span class="error"><?php echo $error_danhmuc; ?></span>
          <?php } ?>  
			
			
                                        </div>
                                        
                                    </div>
                               
                                </div>
                            </div>

	
                            <div class="col-md-6">
                                <div class="form-group">
                                        <label>Danh Mục</label>
<select class="form-control" name="id_dm_nho">
            </select>


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
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Hình Ảnh Đại Diện</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn hình ảnh</a>
                                    <input id="xFilePath" name="hinh_anh" class="form-control" type="text" value="<?php echo $_SESSION['hinhanh'];?>">
                                                  </div>
                                    
                            </div>
							
				    </div>			
						
                        <div class="form-group">
                            <label>Nội Dung Mô Tả <span class="style2">(*)</span></label>
                            <textarea name="mo_ta" class="form-control" style="height:70px; max-height:137px; max-width:100%"><?php echo $_SESSION['mota'];?></textarea>
                        </div>                                       					
						
                        <div class="form-group">
                            <label><?php echo $mo_ta; ?></label>
                            <textarea name="noi_dung" id="test1" rows="10" cols="80">
							
							 <?php echo $_SESSION['noidung'];?>
							</textarea>
                        </div>
						<!--
                        <div class="form-group">
                            <label>Ghi chú</label>
                            <textarea name="ctl00$phContent$txtGhiChu1" id="ctl00_phContent_txtGhiChu1" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
				
                       <!-- <div class="row">
											
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
                        </div>-->
						<div class="form-group">
<div class="checkbox">
<label>
 <?php if($_SESSION['noibat']=='1'){ ?> 
<input type="checkbox" name="noi_bat" value="1" checked/>
 <?php } else { ?>
 <input type="checkbox" name="noi_bat" value="1"/>
 <?php } ?>
Tin nổi bật
</label>
</div>

<div class="checkbox">
<label>
 <?php if($_SESSION['tinlanhdao']=='1'){ ?> 
<input type="checkbox" name="tin_lanh_dao" value="1" checked/>
 <?php } else { ?>
 <input type="checkbox" name="tin_lanh_dao" value="1"/>
 <?php } ?>
Hoạt động lãnh đạo MTTQ
</label>
</div>

<div class="checkbox">
<label>
 <?php if($_SESSION['tinchay']=='1'){ ?> 
<input type="checkbox" name="tin_chay" value="1" checked/>
 <?php } else { ?>
 <input type="checkbox" name="tin_chay" value="1"/>
 <?php } ?>
Tin chạy
</label>
</div>



</div>		
  <div class="row">
 <div class="col-md-6">
                        <div class="form-group">
                            <label>Tác giả bài viêt</label>
                            <input name="tac_gia" class="form-control" type="text" value="<?php echo $_SESSION['tacgia'];?>">
                        </div>
				</div>	
				
				 <div class="col-md-6">
                        <div class="form-group">
                            <label>Nguồn Tin </label>
                            <input name="nguon_tin" class="form-control" type="text" value="<?php echo $_SESSION['nguontin'];?>">
                        </div>
				</div>	


</div>	
 <div class="form-group">
                                    <label>File Đính Kèm</label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer1();"><i class="fa fa-paperclip"></i> Chọn tài liệu</a>
                                    <input id="xFilePath1" name="file" class="form-control" type="text">
                                                  </div>				
							  <div class="form-group">
                            <label><?php echo "Từ khóa"; ?></label>
                            <input name="tag" class="form-control" type="text" value="<?php echo $_SESSION['tukhoa'];?>" />
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
