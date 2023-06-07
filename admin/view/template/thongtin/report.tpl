<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
      Báo cáo
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=thongtin&act=list">Danh Sách Đăng Ký hỗ trợ Covid 19</a></li>
        <li class="active">Danh Sách</li>
    </ol>
            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">

<div class="box box-warning">
    <div class="box-body">
        <div class="row">
		<!--
            <div class="col-sm-12 text-right">
               <a onclick="location = '<?php echo $link_add; ?>'" class="btn bg-aqua btn-flat btn-margin"><i class="fa fa-floppy-o"></i>&nbsp;&nbsp;Thêm mới</a>
            </div>
        </div>
		-->

<p></p>
    <form action="./index.php" method="get" enctype="multipart/form-data" id="form">
<div class="well">
            
			   <input type="hidden" name="module" value="baocao"/>
									    <input type="hidden" name="act" value="detail"/>
  
        <div class="row">
            <div class="col-xs-12 col-md-2">
                <div class="form-group">

                 Từ mã hồ sơ  <input class="form-control" type="number" value="<?php echo $_SESSION['tu'];?>" maxlength="5" name="tu" placeholder="0" />
                </div>
            </div>
			
			  <div class="col-xs-12 col-md-2">
                <div class="form-group">

                đến mã hồ sơ     <input class="form-control" type="number" value="<?php echo $_SESSION['den'];?>" maxlength="5" name="den" placeholder="100" />
                </div>
            </div>
			
			
			    <div class="col-xs-12 col-md-2">
			 
                <div class="form-group">
Hộ khẩu
                     <select class="form-control" name="huyen">
               
					  <option value="false">----------<?php echo "Tất cả"; ?>----------</option>
					  
					  <?php foreach ($list_huyen as $huyen){?> 
					  <?php if($_SESSION['huyen'] == $huyen['localtion_id']) { ?>
					  <option value="<?php echo $huyen['localtion_id']; ?>" selected="selected"><?php echo $huyen['localtion_name']; ?></option>
					  <?php } else { ?>
					  <option value="<?php echo $huyen['localtion_id']; ?>"><?php echo $huyen['localtion_name']; ?></option>
					  <?php }} ?>
					  
				  </select>
		  
                </div>
            </div>
			
           
		    <div class="col-xs-12 col-md-2">
			 
                <div class="form-group">
Khu vực đang ở
                     <select class="form-control" name="khu_vuc">
               
					  <option value="false">----------<?php echo "Tất cả"; ?>----------</option>
					  
					  <?php foreach ($list_diaphuong as $diaphuong){?> 
					  <?php if($_SESSION['khu_vuc'] == $diaphuong['dia_phuong_id']) { ?>
					  <option value="<?php echo $diaphuong['dia_phuong_id']; ?>" selected="selected"><?php echo $diaphuong['ten_dia_phuong']; ?></option>
					  <?php } else { ?>
					  <option value="<?php echo $diaphuong['dia_phuong_id']; ?>"><?php echo $diaphuong['ten_dia_phuong']; ?></option>
					  <?php }} ?>
					  
				  </select>
		  
                </div>
            </div>
		   
		   
		     <div class="col-xs-12 col-md-2">
                <div class="form-group">
Tình trạng
                     <select class="form-control" name="trang_thai">
               
					  <option value="false">----------<?php echo "Tất cả"; ?>----------</option>
					  
					  <?php foreach ($list_trangthai as $trangthai){?> 
					  <?php if($_SESSION['trang_thai'] == $trangthai['trang_thai_id']) { ?>
					  <option value="<?php echo $trangthai['trang_thai_id']; ?>" selected="selected" ><?php echo $trangthai['ten_trang_thai']; ?></option>
					  <?php } else { ?>
					   <option value="<?php echo $trangthai['trang_thai_id']; ?>"><?php echo $trangthai['ten_trang_thai']; ?></option>
					  <?php } } ?>
					  
				  </select>
		  
                </div>
            </div>
           
     
           
         <div class="col-xs-12 col-md-2">
                <div class="form-group">&nbsp;&nbsp;&nbsp;
					<input type ="checkbox" name="excel" value="1"/> Xuất 
					<input class="btn btn-primary" name="search"  type="hidden" value="1" />
                    <input class="btn btn-primary" type="submit" value="Xem" />
					<!--
					<a class="btn btn-primary" onclick="$('#form2').attr('action', '<?php echo $delete; ?>'); $('#form2').attr('target', '_self'); $('#form2').submit();" class="button"><span><?php echo "Xuất word"; ?></span></a>
					-->
                </div>  
				</div>
            
        </div>
      
    </form>
</div>


 
            <div id="result">
		
<div class="col-xs-12 table-responsive">
			
				<?php if ($_SESSION['ten']) { ?>
				
					<div class="panel panel-success">			
			<div class="panel-heading">
<h3 class="panel-title"><?php echo $_SESSION['ten']; ?></h3>
</div>

<?php } unset($_SESSION['ten']); ?>

<p class="text-right">

       <div class="pagination1"><?php echo $pagination; ?></div>
   </p>
	
	

	
<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0">
    <tbody><tr>
	    
        <th class="text-center">
            Mã hồ sơ
        </th>
       
        <th class="text-center">
            Họ Và Tên
        </th>
		
		
        <th class="text-center" style="white-space:nowrap">
            Số CMTND
        </th>
		
		<th class="text-center" style="white-space:nowrap">
            Điện Thoại
        </th>
		
     	<th class="text-center" style="white-space:wrap">
            Hộ khẩu
        </th>
		
		<th class="text-center" style="white-space:wrap">
           Xã, Huyện
        </th>
		
		<td class="text-center">

              Tập tin đính kèm
        </td>
		
		<th class="text-center" style="white-space:nowrap">
           Ngày tiếp nhận
        </th>
		
      
		 <th class="text-center">
            Tình Trạng
        </th>
		
       <th class="text-center text-green">Xem</th>  <!--
	   <th class="text-center text-green">Sửa</th> 
<th class="text-center text-red">Xóa</th> -->
    </tr>

    </tr>
           
        
        <form action="" method="post" enctype="multipart/form-data" id="form2">
           
         
       <?php if ($list_thongtin) { ?>
          <?php foreach ($list_thongtin as $thongtin) { ?>  
            <tr>
		
			  
			  <!--
                <td class="text-center">
                      <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
               -->
			   <td class="text-center">

                   <?php echo $thongtin['id_thongtin']; ?>
                </td>
			   
			   
                <td>				
				<?php $v = $thongtin['view']; ?>				
				<?php if($v==0) { ?>
                  <b> <?php echo $thongtin['ho_ten']; ?></b>				
				  <?php } else if($v==1){ ?>				 
				  <?php echo $thongtin['ho_ten']; ?>				 
				  <?php } ?>
                </td>
				
			
				
                <td class="text-center">

                        <?php echo $thongtin['cmt']; ?>
                </td>
				
			
				
				<td class="text-center">

                    <?php echo $thongtin['dien_thoai']; ?>
                </td>
					
				<td class="text-center">

                    <?php echo $thongtin['thuong_tru']; ?>
                </td>
					
			
				<td class="text-center">
				   <?php $huyen = get_localtion($thongtin['huyen']); ?>
				    <?php $xa = get_localtion($thongtin['xa']); ?>
				    <?php echo $xa['localtion_name']; ?>, <?php echo $huyen['localtion_name']; ?>
                </td>
				
					<td class="text-center">

                    <?php if($thongtin['anh_cmt1']) { ?> 
					 <i class="fa fa-file-image-o"></i>
					<?php } else { ?>
					 <i class="fa fa-times-circle"></i>
					<?php } ?>
					<?php if($thongtin['anh_cmt2']) { ?> 
					 <i class="fa fa-file-image-o"></i>
					<?php } else { ?>
					 <i class="fa fa-times-circle"></i>
					<?php } ?>
					<?php if($thongtin['anh_xac_nhan']) { ?> 
					 <i class="fa fa-file-image-o"></i>
					<?php } else { ?>
					 <i class="fa fa-times-circle"></i>
					<?php } ?>
					<?php if($thongtin['giay_to_khac']) { ?> 
					 <i class="fa fa-file-image-o"></i>
					<?php } else { ?>
					 <i class="fa fa-times-circle"></i>
					<?php } ?>
					
                </td>
				
				<td class="text-center">
							<?php echo $thongtin['time']; ?>	
                  </td>
				
				 
				
              
               
				
					<td class="text-center"> <?php $tt = get_trang_thai($thongtin['tinh_trang']);?>
		
                    <span class="badge bg-<?php echo mau_sac($thongtin['tinh_trang']);?> ng-scope"><?php echo $tt['ten_trang_thai'];?></span>
			
</td>
				
				<td class="text-center" style="white-space:nowrap">
           			  [ <a href="index.php?module=thongtin&act=view&id=<?php echo $thongtin['id_thongtin']; ?>" title="Xem"><i class="fa fa-file" aria-hidden="true"></i> </a>  ]  

					  
				</td>
				 <!--
                <td class="text-center" style="white-space:nowrap">
					[ <a href="index.php?module=thongtin&act=<?php echo "edit";?>&id=<?php echo $thongtin['id_thongtin']; ?>" title="Sửa"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a> ]
				 </td>
			  
			   <td class="text-center" style="white-space:nowrap">	
					[ <a href="javascript:confirmDelete('index.php?module=thongtin&act=del&id=<?=$thongtin['id_thongtin'];?>')" title="Xóa"><i class="fa fa-trash-o" style="color: red;"></i></a>  ]   				
			   </td>
                -->
            </tr>
		  <?php } ?>
		    <?php } else { ?>
    <tbody>
            <tr>
                <td colspan="9" class="text-center text-red text-bold">Không tồn tại dữ liệu</td>
            </tr>
    </tbody>
   <?php } ?>
   
          
</tbody></table>
</form>

<div class="pagination-container"><ul class="pagination"><li class="active"><a><?php echo $pagination; ?></a></li></ul></div>
            </div>
    </div>
</div>

</div>
                
            </section>
        </div>
        


<?php include('view/template/common/footer.tpl'); ?>
 <script type="text/javascript">
function confirmDelete(delUrl) {
   if (confirm("Ban co chac chan la muon xoa bai viet nay")) {
     document.location = delUrl;
}
}
</script>