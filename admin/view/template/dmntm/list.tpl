<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Chuyên Mục
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=home">Trang Chủ</a></li>
        <li class="active">Chuyên mục</li>
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
    	
          
                        <div id="result" class="col-xs-12 table-responsive">
						
						
					
               	<p class="text-right">
         <div class="pagination1"><?php echo $pagination; ?></div>
    </p>

	
	
	<div class="box-body">
<table class="table table-bordered">
<tbody>
<tr>
<th style="width: 10px">#</th>
<th>Tên Danh Mục</th>
<th>Thứ Tự</th>
<th style="width: 100px">Thao Tác</th>
</tr>
   <?php if ($list_dmntm) { ?>
          <?php foreach ($list_dmntm as $danhmuc) { ?>
<tr>
<td>   <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?></td>
<td><?php echo $danhmuc['ten_dm']; ?></td>
<td>
<?php echo $danhmuc['thu_tu']; ?>
</div>
</td>

   <td class="text-center" style="white-space:nowrap; width: 10%;">
   
                         [ <a href="index.php?module=dmntm&act=<?php echo "edit";?>&id=<?php echo $danhmuc['id_dmntm']; ?>" title="Sửa bài viết"><i class="fa fa-pencil-square-o"></i></a> ]
						 [ <a href="javascript:confirmDelete('index.php?module=dmntm&act=del&id=<?=$danhmuc['id_dmntm']?>')" title="Xóa bài viết"><i class="fa fa-trash-o" style="color: red;"></i></a> ]
					
                </td>

</tr>
		  <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="3"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>


</tbody>
</table>
</div>
	
	
	
	
	
	
	
	
	
	
	


                        </div>
						<div class="pagination-container"><ul class="pagination"><li class="active"><a>Tổng Số:  <?php echo $total; ?></a></li></ul></div>


                   
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