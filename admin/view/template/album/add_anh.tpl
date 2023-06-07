<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thêm mới hình ảnh vào Album
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=home">Trang Chủ</a></li>
        <li class="active">Hình Ảnh</li>
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
						
						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
						
				
      <table class="form">
      
        <tr>
			 <label><?php echo "Tải ảnh vào hinhanh";?></label>
			<td>
             <input id="xFilePath" name="hinh_anh" type="text" size="70" value="" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer();" /> <input type="submit" value="Up ảnh vào hinhanh"> <br/> 
            </td>
			<tr>
          <?php if ($error_anh) { ?>
            <span class="error"><?php echo $error_anh; ?></span>
            <?php } ?> 
	</tr>			
		</tr>
           

	 <tr>
	 <td></td>
	 <td></td>
	 </tr>
	 
	
      </table>
    </form>
						
		<p></p>			
       <div class="row">
	     <?php foreach($list_hinhanh as $hinhanh) { ?>
<div class="col-sm-3">
<img class="img-responsive" alt="Photo" src="<?php echo $hinhanh['hinh_anh'];?>" style="">
  [ <a href="index.php?module=album&act=<?php echo "editanh";?>&id=<?php echo $hinhanh['ma_anh']; ?>"><?php echo "Sửa"; ?></a> ]
            [ <a href="javascript:confirmDelete('index.php?module=album&act=xoaanh&id=<?=$hinhanh['ma_anh']?>')"  ><?php echo "Xóa"; ?></a>]
</div>


		 <?php } ?>
		
	    </div>
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