<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/country.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
      
	<tr>
		<td><?php echo $ten_dan_toc; ?></td>
                <td><input  type="text" name="ten_tin_hoat_dong" value=""/>
      			<?php if ($error_name) { ?>
          		  <span class="error"><?php echo $error_name; ?></span>
                         <?php } ?>
        	</td>
       </tr>
	
     <tr>
     <td><?php echo $hinhdaidien;?></td>
     <td><input type="file" name="file"/></td>
     </tr>
     
     <tr>
     <td><?php echo $motachung;?></td>
     <td><textarea name="mo_ta_chung" id="motachung"></textarea></td>
     </tr>
     
     <tr>
     <td><?php echo $motachitiet;?></td>
     <td><textarea name="mo_ta_chi_tiet" id="motachitiet"></textarea></td>
     </tr>
      <tr>
     <td>Tin tiêu điểm</td>
     <td><input type="checkbox" name = "tieu_diem"></td>
     </tr>
     </table>
    </form>
  </div><div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
</div>
<?php include('view/template/common/footer.tpl'); ?>

<script type="text/javascript">
	 var editor = CKEDITOR.replace( 'motachitiet');
         var editor1 = CKEDITOR.replace( 'motachung',{
					toolbar :
					[
						[ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','Image' ],
						[ 'UIColor' ], ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl']
					]});
	 CKFinder.setupCKEditor( editor, './view/javascript/ckfinder/' ) ;
         CKFinder.setupCKEditor( editor1, './view/javascript/ckfinder/' ) ;
</script>

