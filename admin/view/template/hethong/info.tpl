<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thông tin hệ thống
    </h1>
    <ol class="breadcrumb">
       
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        



<div class="box box-warning">

<div class="box-header with-border">
<h3 class="box-title">Thông tin chính </h3>
<div class="pull-right">

</div>
</div>

       <div class="box-body" id="boxBody">
	   
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Hệ điều hành<span class="style2"></span></label>
                            <input name="title_name" class="form-control" type="text" value="<?php echo $hethong['os']; ?>">
                        </div>
						
						
							 <div class="row">
							 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Dịch vụ web<span class="style2"></span></label>
                             
                                    <input name="url" class="form-control" type="text" value="<?php echo $hethong['service']; ?>" />
									
                                </div>
                                    
                            </div>
							
							<div class="col-md-6">
                                <div class="form-group">
                                    <label>Phiên bản PHP<span class="style2"></span></label>
                             
                                    <input name="url" class="form-control" type="text" value="<?php echo $hethong['php_version']; ?>" />
									
                                </div>
                                    
                            </div>
							
							
						
							
                        </div>
						
							 <div class="row">
							 
							
							 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phiên bản MySQL<span class="style2"></span></label>
                             
                                    <input name="email" class="form-control" type="text" value="<?php echo $hethong['sql_version']; ?>" />
									
                                </div>
                                    
                            </div>
						
						   <div class="col-md-6">
                                <div class="form-group">
                                    <label>Đơn vị phát hành<span class="style2"></span></label>
                             
                                    <input name="email" class="form-control" type="text" value="<?php echo $hethong['dev']; ?>" />
									
                                </div>
                                    
                            </div>
						
							
                        </div>
						
                     
					<div class="row">
							 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phiên bản phần mềm web<span class="style2"></span></label>
                             
                                    <input name="url" class="form-control" type="text" value="<?php echo $hethong['web_version']; ?>" />
									
                                </div>
                                    
                            </div>
							
							 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Ngày phát hành<span class="style2"></span></label>
                             
                                    <input name="email" class="form-control" type="text" value="<?php echo $hethong['realeas']; ?>" />
									
                                </div>
                                    
                            </div>
						
						
							
                        </div>
	
	                   <?php //echo phpinfo();?>
						
    
			
		<div class="box-footer text-center">


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