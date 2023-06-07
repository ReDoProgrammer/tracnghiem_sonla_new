<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Sách Khởi Nghiệp
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=home">Trang Chủ</a></li>
        <li class="active">Sách Khởi Nghiệp</li>
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        




<div class="box box-warning">
    <div class="box-body">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              
				 <div class="row" style="margin-bottom: 5px;">
            <div class="col-sm-12 text-right">
               <a onclick="location = '<?php echo $link_add; ?>'" class="btn bg-aqua btn-flat btn-margin"><i class="fa fa-floppy-o"></i>&nbsp;&nbsp;Thêm mới</a>
            </div>
        </div>
		<?php if ($_SESSION['success']) { ?>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo $_SESSION['success']; ?> </h3>
                    </div>
				
            <?php } unset($_SESSION['success']); ?>
    	
                    <div class="panel-body">
                        <div id="result">
						
						
					
               	<p class="text-right">
         <div class="pagination1"><?php echo $pagination; ?></div>
    </p>
<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
    <thead>
        <tr>
		<th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
            <th class="text-center" style="padding-top: 20px;padding-bottom: 20px">
                STT
            </th>
            <th class="text-center">
                Hình Ảnh
            </th>
            <th class="text-center">
                Tên File
            </th>
            <th class="text-center">
                Dung Lượng
            </th>
           
            <th class="text-center">
                Lượt Xem
            </th>
			  <th class="text-center">
                Lượt Tải
            </th>
			  <th class="text-center">
                Thời Gian Đăng </th>
				
								
			 <th class="text-center">
                Thao Tác
            </th>
        </tr>
    </thead>
    <tbody>
  
        
           <?php if ($list_download) { ?>
          <?php foreach ($list_download as $download) { ?>   
<tr>
<td style="text-align: center;">

              <input type="checkbox" name="selected[]" value="<?php echo $download['id_download']; ?>" />
      
           
			  </td>

<td class="text-center" style="width: 2%;">  <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?> </td>

<td style="width: 6%"> <a href ="<?php echo $download['hinh_anh']; ?>"class="thickbox" rel="shadowbox" title="<?php echo $download['tieu_de']?>"> 
<?php if($download['hinh_anh']){?>           
		   <img src ="<?php echo $download['hinh_anh'];?>" class="bimg" width="80" height ="80"/>
		   	 <?php } else{?>
							    <img src ="./view/image/no-ima.jpg" class="bimg" width="80" height ="80"/>
								   <?php } ?>
            </a> </td>
<td style="width: 30%">  <?php echo $download['tieu_de']; ?></td>
<td class="text-center" style="width: 10%;">   <?php echo $download['dung_luong']; ?> </td>

<td class="text-center" style="width: 13%;"><?php echo $download['luot_xem']; ?> </td>

<td class="text-center" style="width: 13%;"><?php echo $download['luot_tai']; ?> </td>

 <td class="text-center" style="white-space:nowrap">
           <?php echo date_format(date_create($download['time']),'d-m-Y');?>
                </td>
			
				 <td class="text-center" style="white-space:nowrap; width: 10%;">
                         [ <a href="index.php?module=download&act=<?php echo "edit";?>&id=<?php echo $download['id_download']; ?>" title="Sửa bài viết"><i class="fa fa-pencil-square-o"></i></a> ]
						 [ <a href="javascript:confirmDelete('index.php?module=download&act=del&id=<?=$download['id_download']?>')" title="Xóa bài viết"><i class="fa fa-trash-o" style="color: red;"></i></a> ]
					
                </td>

</tr>

  <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
         
       

    </tbody>
</table>

<div class="pagination-container"><ul class="pagination"><li class="active"><a>Tổng Số:  <?php echo $total; ?></a></li></ul></div>

                        </div>

                   
                            <hr style=" border: 1px solid #ccc; border-top: none">
                           
                            <div class="form-group text-right groupbutton">
                                <button onclick="quay_lai_trang_truoc()" type="button" class="btn bg-green print"><i class="fa fa-backward" aria-hidden="true"></i>  Back</button>
                                <button onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" type="button" class="btn bg-red close-form"><i class="fa fa-times" aria-hidden="true"></i>&nbsp;Xóa Lựa Chọn</button>
                            </div>
                  
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


             
                </div>
            </section>
        </div>
<?php include('view/template/common/footer.tpl'); ?>

  <script>
      function quay_lai_trang_truoc(){
          history.back();
      }
  </script>
  
   <script type="text/javascript">
function confirmDelete(delUrl) {
   if (confirm("Ban co chac chan la muon xoa bai viet nay")) {
     document.location = delUrl;
}
}
</script>