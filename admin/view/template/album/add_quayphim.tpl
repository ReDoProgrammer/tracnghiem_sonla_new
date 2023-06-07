<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thêm Mới Album Ảnh
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Thêm Mới Album Ảnh</a></li>
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
                        <div class="form-group" style="width: 50%;">
                            <label>Tên Tiêu Đề <span class="style2">(*)</span></label>

							 <input size="70" type="text" name="tieu_de" class="form-control" value="<?php echo $_SESSION['tieude']; ?>"/>
								    <?php if ($error_tieude) { ?>
										<span class="error"><?php echo $error_tieude; ?></span>
									<?php } ?>
                        </div>				                                                   					
						
                        <div class="row">
				
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Hình Ảnh Đại Diện  <span class="style2">(*)</span></label>
                                    <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i class="fa fa-paperclip"></i> Chọn ảnh đại diện</a>
                                    <input id="xFilePath" name="hinh_anh" class="form-control" type="text" value="<?php echo $_SESSION['pic']; ?>">
										 <?php if ($error_pic) { ?>
										<span class="error"><?php echo $error_pic; ?></span>
										<?php } ?>
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
						
						  <!--
                 <tr>
          <td><?php echo $chu_de; ?></td>
          <td><select name="chu_de">
               
              <option value="false"><?php echo "Lựa chọn"; ?></option>
              <?php if($_SESSION['chude']=='1') { ?>
              <option value="1" selected="selected"><?php echo "Album Ảnh Cưới"; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo "Album Ảnh Cưới"; ?></option>
              <?php } ?>
              <?php if($_SESSION['chude']=='2') { ?>
              <option value="2" selected="selected"><?php echo "Album Thời Trang"; ?></option>              
              <?php } else { ?>
              <option value="2"><?php echo "Album Thời Trang"; ?></option>
              <?php } ?>
              <?php if($_SESSION['chude']=='3') { ?>
              <option value="3" selected="selected"><?php echo "Album Ảnh Tự Do"; ?></option>
              <?php } else { ?>
              <option value="3"><?php echo "Album Ảnh Tự Do"; ?></option>
              <?php } ?>
              </select>
            <?php if ($error_chude) { ?>
            <span class="error"><?php echo $error_chude; ?></span>
            <?php } ?>
            </td>
         </tr>-->
						
						                
						<!--
                        <div class="form-group">
                            <label>Ghi chú</label>
                            <textarea name="ctl00$phContent$txtGhiChu1" id="ctl00_phContent_txtGhiChu1" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
				
                         <div class="form-group">
                            <label><?php echo $noi_dung; ?></label>
                            <textarea name="noi_dung" id="chitiet" <?php echo $_SESSION['noidung']; ?> rows="10" cols="80">
							
							
							</textarea>
                        </div>
						
						<div class="form-group">

<div class="checkbox">
<label>
<input type="checkbox" name="noi_bat">
Video Nổi Bật
</label>
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

function BrowseServer1()
    {
    	var finder1 = new CKFinder();
    	finder1.basePath = './view/javascript/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
    	finder1.selectActionFunction = SetFileField1;
    	finder1.popup();
    }
// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
}

function SetFileField1(fileUrl )
{
	document.getElementById( 'xFilePath1' ).value = fileUrl;
 }
</script>