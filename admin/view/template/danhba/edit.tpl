<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thêm mới cán bộ
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=danhba&act=list">Danh sách cán bộ</a></li>
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
					<div class="row">
					 <div class="col-md-8">
                        <div class="form-group">
                            <label>Họ và tên <span class="style2">(*)</span></label>
                            <input name="ho_ten" class="form-control" type="text" value="<?php echo $danhba['ho_ten'];?>">
							 <?php if ($error_tieude) { ?>
        <span class="error"><?php echo $error_tieude; ?></span>
        <?php } ?>
                        </div>
						</div>
						
						 <div class="col-md-4">
                                <div class="form-group">
                                    <label>Số thứ tự<span class="style2">(*)</span></label>
                             
                                    <input name="stt" class="form-control" type="text" value="<?php echo $danhba['stt'];?>" />
                                </div>
                                    
                            </div>
						
						   </div>
                          
						
						<!--
                        <div class="form-group">
                            <label>Nội dung họp <span class="style2">(*)</span></label>
                            <textarea name="" id="ctl00_phContent_txtNoidung" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
						<div class="row">
						 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Danh mục phòng ban <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <div id="divLoai">
                                            <select name="to_chuc_id" class="form-control">

               
              <option value="false">----------<?php echo "Lựa chọn"; ?>----------</option>
               <?php if($list_dm) {?>
              <?php foreach ($list_dm as $danhmuc){?> 
			   <?php if ($danhmuc['id'] == $danhba['to_chuc_id']) {?>
              <option value="<?php echo $danhmuc['id']; ?>" selected="selected"><?php echo $danhmuc['tieu_de']; ?></option>
                        <?php } else {?>
					<option value="<?php echo $danhmuc['id']; ?>"><?php echo $danhmuc['tieu_de']; ?></option>	
						
			<?php } ?>
                   <?php } ?>
                   <?php }?>
              
          </select>
                                        </div>
                                        
                                    </div>
                               
                                </div>
                            </div>
							
							</div>
						
						 <div class="row">
						  
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Chức vụ<span class="style2">(*)</span></label>
                             
                                    <input name="chuc_vu" class="form-control" type="text" value="<?php echo $danhba['chuc_vu'];?>" />
                                </div>
                                    
                            </div>
							</div>
                        <div class="row">
										
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Điện thoại<span class="style2">(*)</span></label>
                             
                                    <input name="dien_thoai" class="form-control" type="text" value="<?php echo $danhba['dien_thoai'];?>" />
                                </div>
                                    
                            </div>
                            <div class="col-md-6">
							
							 <div class="form-group">
                                    <label>Email<span class="style2">(*)</span></label>
                 
                                    <input name="email" class="form-control" type="text" value="<?php echo $danhba['email'];?>" />
                                </div>
                              
                                    
                            </div>
							
							
							
							
							
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
