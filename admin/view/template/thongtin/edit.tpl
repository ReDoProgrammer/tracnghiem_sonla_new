<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Sửa Thông Tin
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Sửa thông tin</a></li>
        <li class="active"><?php echo $thongtin['ho_ten'];?></li>
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
                      
						<!--
                        <div class="form-group">
                            <label>Nội dung họp <span class="style2">(*)</span></label>
                            <textarea name="" id="ctl00_phContent_txtNoidung" class="form-control" style="height:70px; max-height:137px; max-width:100%"></textarea>
                        </div>-->
						
						
						


   <div class="row">
										
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Họ Và Tên<span class="style2">(*)</span></label>
                             
                                    <input name="ho_ten" class="form-control" type="text" value="<?php echo $thongtin['ho_ten'];?>" />
						
                                </div>
                                    
                            </div>
							
                            <div class="col-md-6">
							
							 <div class="form-group">
                                    <label>Ngày Sinh<span class="style2">(*)</span></label>
                 
                                    <input name="ngay_sinh" readonly="readonly" class="form-control" id="datepicker1" type="text" value="<?php echo $thongtin['ngay_sinh'];?>" />
									
                                </div>
                              
                                    
                            </div>										
    	
						 
						 
						
							</div>
							
					<div class="row">
<div class="col-xs-6">
 <div class="form-group">
  <label>Số CMT<span class="style2">(*)</span></label>
<input class="form-control" name="cmt" readonly="readonly" type="text" placeholder="Số CMT" value="<?php echo $thongtin['cmt'];?>" />

</div></div>
<div class="col-xs-6">
 <div class="form-group">
  <label>Ngày Cấp<span class="style2">(*)</span></label>
<input class="form-control" readonly="readonly" name="ngay_cap" type="text" id="datepicker" placeholder="Ngày cấp" value="<?php echo $thongtin['ngay_cap'];?>" />

</div></div>
<div class="col-xs-12">
 <div class="form-group">
  <label>Nơi Cấp<span class="style2">(*)</span></label>
<input class="form-control" name="noi_cap" type="text" placeholder="Nơi Cấp" value="<?php echo $thongtin['noi_cap'];?>" />

</div>
</div>

 <div class="col-md-6">
                                 <div class="form-group">
                                    <label>Hộ khẩu: Huyện thị</label>
                 
                                  		<select class="form-control" name="huyen_id" id="huyen_id" onchange="$('select[name=\'xa_id\']').load('index.php?module=thongtin&act=local&huyen_id='+this.value+'&xa_id=<?php echo $thongtin['xa'];?>');">
                                                                         <?php foreach ( $list_huyen as $dp) { ?>
																		  <?php if ($dp['localtion_id'] == $thongtin['huyen']) {?>
                                                                        <option class="" value="<?php echo $dp['localtion_id'];?>" selected="selected">
                                                                            <?php echo $dp[ 'localtion_name'];?>
                                                                        </option>
																		  <?php } else {?>
																		 <option class="" value="<?php echo $dp['localtion_id'];?>">
                                                                            <?php echo $dp[ 'localtion_name'];?>
                                                                        </option>
                                                                        <?php }} ?>
                                                                    </select>
									
                                </div>
                                    
                            </div>
							
							
								 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Xã thị trấn:</label>
                 
                                    <select class="form-control" name="xa_id" id="xa_id" class="aui-field-select"> </select>
                                </div>
                                    
                            </div>
							
							 <div class="col-md-12">
                                <div class="form-group">
                                    <label>Nơi ĐKHK thường trú (theo CMND/CCCD):</label>
                 
                                    <input name="thuong_tru" class="form-control" type="text" value="<?php echo $thongtin['thuong_tru'];?>" />
									 
          
                                </div>
                                    
                            </div>
							

</div>


	
							
                        <div class="row">
										
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label>Thư điện tử</label>
                             
                                    <input name="email" readonly="readonly" class="form-control" type="text" value="<?php echo $thongtin['email'];?>" />
									
                                </div>
                                    
                            </div>
							
                            <div class="col-md-5">
							
							 <div class="form-group">
                                    <label>Điện thoại</label>
                 
                                    <input name="dien_thoai" readonly="readonly" class="form-control" type="text" value="<?php echo $thongtin['dien_thoai'];?>" />
									
                                </div>
                              
                                    
                            </div>
							
							 <div class="col-md-6">
                                 <div class="form-group">
                                    <label>Khu vực đang ở<span class="style2">(*)</span></label>
                 
                                  <select class="form-control" name="khu_vuc" title="donvi-tiep-nhan-id">
                                                                         <?php foreach ( $list_dia_phuong as $dp) { ?>
																		  <?php if ($dp['dia_phuong_id'] == $thongtin['khu_vuc']) {?>
                                                                        <option class="" value="<?php echo $dp['dia_phuong_id'];?>" selected="selected">
                                                                            <?php echo $dp[ 'ten_dia_phuong'];?>
                                                                        </option>
																		  <?php } else {?>
																		 <option class="" value="<?php echo $dp['dia_phuong_id'];?>">
                                                                            <?php echo $dp[ 'ten_dia_phuong'];?>
                                                                        </option>
                                                                        <?php }} ?>
                                                                    </select>
			 
                                </div>
        
                            </div>
							
							
								 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Chỗ ở hiện nay<span class="style2">(*)</span></label>
                 
                                    <input name="noi_cu_tru" class="form-control" type="text" value="<?php echo $thongtin['noi_cu_tru'];?>" />
									 
          
                                </div>
                                    
                            </div>
							
							
                        </div>
                       
						
                       
				 <div class="legend-box">
							<div class="legend-head">
								<span class="txt">Tài khoản ngân hàng </span>
							</div>
<div class="legend-body" style="display: block;">
<div class="row">
<div class="col-xs-6">
 <div class="form-group">
  <label>Họ tên<span class="style2">(*)</span></label>
<input class="form-control" name="chu_tk" type="text" placeholder="Số CMT" value="<?php echo $thongtin['chu_tk'];?>" />

</div></div>
<div class="col-xs-6">
 <div class="form-group">
  <label>Số tài khoản<span class="style2">(*)</span></label>
<input class="form-control" name="so_tk" type="text" id="datepicker" placeholder="Ngày cấp" value="<?php echo $thongtin['so_tk'];?>" />

</div></div>
<div class="col-xs-12">
 <div class="form-group">
  <label>Chi nhánh<span class="style2">(*)</span></label>
<input class="form-control" name="chi_nhanh" type="text" placeholder="Nơi Cấp" value="<?php echo $thongtin['chi_nhanh'];?>" />

</div>
</div>
</div>
</div>
</div>							
					
												
						


						
                        <!--<div class="form-group">
                            <label><?php echo $motachitiet;?></label>
                            <textarea name="ghi_chu" id="test1" rows="10" cols="80" value="<?php echo $thongtin['ghi_chu'];?>">
							
							
							</textarea>
                        </div>-->
					
						
                    <!--
							  <div class="form-group">
                            <label><?php echo "Từ khóa"; ?></label>
                            <input name="tu_khoa" class="form-control" type="text" value="<?php echo $thongtin['tukhoa'];?>" />
                        </div>-->
					

			</form>
			
			
		<div class="box-footer text-center">

<button class="btn btn-sm btn-primary btn-flat" onclick="location = '<?php echo $link_list; ?>';" style="margin-top:4px">
<i class="fa fa-check-square-o"></i>
Cập nhật
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

<script type="text/javascript"><!--
$('select[name=\'xa_id\']').load('index.php?module=thongtin&act=local&huyen_id=<?php echo $thongtin['huyen'];?>&xa_id=<?php echo $thongtin['xa']; ?>');
//--></script>

<?php include('view/template/common/footer.tpl'); ?>


