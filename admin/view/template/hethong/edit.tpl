<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Cấu Hình Hệ Thống Website
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
                            <label><?php echo $title_name; ?> <span class="style2">(*)</span></label>
                            <input name="title_name" class="form-control" type="text" value="<?php echo $hethong['title_name']; ?>">
                        </div>
						
						
							 <div class="row">
							 <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $url; ?><span class="style2">(*)</span></label>
                             
                                    <input name="url" class="form-control" type="text" value="<?php echo $hethong['url']; ?>" />
									
                                </div>
                                    
                            </div>
							
							 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Địa chỉ Email<span class="style2">(*)</span></label>
                             
                                    <input name="email" class="form-control" type="text" value="<?php echo $hethong['email']; ?>" />
									
                                </div>
                                    
                            </div>
						
						
                                    
                           
                      
							
							
                        </div>
						
				
                        <div class="form-group">
                            <label><?php echo "Meta keyword"; ?> <span class="style2">(*)</span></label>
                            <textarea name="keywords" class="form-control" style="height:70px; max-height:137px; max-width:100%"><?php echo $hethong['keywords'];?></textarea>
                        </div> 

							 <div class="form-group">
                            <label><?php echo "Description keyword"; ?> <span class="style2">(*)</span></label>
                            <textarea name="description" class="form-control" style="height:70px; max-height:137px; max-width:100%"><?php echo $hethong['description'];?></textarea>
                        </div>  

	 <div class="row">
							 <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $author; ?><span class="style2">(*)</span></label>
                             
                                    <input name="author" class="form-control" type="text" value="<?php echo $hethong['author'];?>" />
									
                                </div>
                                    
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo $copyright; ?><span class="style2">(*)</span></label>
                 
                                    <input name="web" class="form-control" type="text" value="<?php echo $hethong['copyright']; ?>" />
									 
                                </div>
                                    
                            </div>
							
							
                        </div>	

	 <div class="row">
							 <div class="col-md-4">
                                <div class="form-group">
                                    <label>Máy Bàn:<span class="style2">(*)</span></label>
                             
                                    <input name="may_ban" class="form-control" type="text" value="<?php echo $hethong['may_ban'];?>" />
									
                                </div>
                                    
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Di Động:<span class="style2">(*)</span></label>
                 
                                    <input name="di_dong" class="form-control" type="text" value="<?php echo $hethong['di_dong']; ?>" />
									 
                                </div>
                                    
                            </div>
							 <div class="col-md-4">
                                <div class="form-group">
                                    <label>Máy Fax:<span class="style2">(*)</span></label>
                 
                                    <input name="fax" class="form-control" type="text" value="<?php echo $hethong['fax']; ?>" />
									 
                                </div>
                                    
                            </div>
							
                        </div>							
						
      <div class="row">
							 <div class="col-md-12">
                                <div class="form-group">
                                    <label>Giấy Phép:<span class="style2">(*)</span></label>
                             
                                    <input name="giay_phep" class="form-control" type="text" value="<?php echo $hethong['giay_phep'];?>" />
									
                                </div>
                                    
                            </div>
	</div>	
	<div class="row">
							 <div class="col-md-12">
                                <div class="form-group">
                                    <label>Cở Quan Chủ Quản:<span class="style2">(*)</span></label>
                             
                                    <input name="chu_quan" class="form-control" type="text" value="<?php echo $hethong['chu_quan'];?>" />
									
                                </div>
                                    
                            </div>
	</div>
 <div class="row">
							 <div class="col-md-12">
                                <div class="form-group">
                                    <label>Bản Đồ Goog Map:<span class="style2">(*)</span></label>
                             
                                    <input name="map" class="form-control" type="text" value="<?php echo $hethong['map'];?>" />
									
                                </div>
                                    
                            </div>
	</div>
 <div class="row">
							 <div class="col-md-12">
                                <div class="form-group">
                                    <label>Link Facebook:<span class="style2">(*)</span></label>
                             
                                    <input name="facebook" class="form-control" type="text" value="<?php echo $facebok['facebook'];?>" />
									
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
                       
                        <div class="form-group">
                            <label><?php echo $dia_chi; ?> <span class="style2">(*)</span></label>
                            <textarea name="dia_chi" class="form-control" style="height:70px; max-height:137px; max-width:100%"><?php echo $hethong['dia_chi'];?></textarea>
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
						
						
						   <div class="row">
				
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><?php echo "Banner"; ?></label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn banner</a>
                                    <input id="xFilePath" name="banner" class="form-control" type="text"><?php echo $_SESSION['invalid_file'];  unset( $_SESSION['invalid_file']);?>
								
									<a href="../view/theme/default/image/<?php echo $hethong['banner'];?>" rel="shadowbox">
          <img src="../view/theme/default/image/<?php echo $hethong['banner'];?>" width="800" height="100"/></a>
                                                  </div>
                                    
                            </div>
							
							
							
							 </div>
							 
							
					 <div class="form-group">
                            <label>Hướng dẫn đăng ký thành viên</label>
                           <textarea name="hddk" id="test1" <?php echo $hethong['hddk']; ?>
							
							
							</textarea>
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
<?php include('view/template/common/footer.tpl'); ?>