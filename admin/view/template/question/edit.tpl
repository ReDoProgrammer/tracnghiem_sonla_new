<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thêm bài mới
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=about&act=home">Trang Chủ</a></li>
        <li class="active">Thêm Bài Mới</li>
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
                            <input name="tieu_de" class="form-control" type="text" value="<?php echo $about['tieu_de']; ?>">
                        </div>				                                                   					
						
                         <div class="form-group">
                            <label><?php echo $mo_ta; ?></label>
                            <textarea name="noi_dung" id="test1" rows="10" cols="80" /> <?php echo $about['noi_dung']; ?>
							
							
							</textarea>
                        </div>
						
					
                
					
				
                 
						
							 
					

			</form>
			
			
		<div class="box-footer text-center">

<button class="btn btn-sm btn-primary btn-flat" onclick="location = '<?php echo $link_list; ?>';" style="margin-top:4px">
<i class="fa fa-check-square-o"></i>
Thêm Mới
</button>

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
