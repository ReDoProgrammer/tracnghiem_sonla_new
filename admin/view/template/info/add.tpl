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
       <tr><td><?php echo $tieu_de; ?></td><td><input size="70" type="text" name="tieu_de" value=""/></td></tr>
 
       <tr><td><?php echo $noi_dung; ?></td><td><textarea name="noi_dung" id="chitiet"></textarea></td></tr>

	 <tr>
	 <td></td>
	 <td></td>
	 </tr>
	
      </table>
    </form>
  </div>
  <div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
</div>
<?php include('view/template/common/footer.tpl'); ?>

<script type="text/javascript">
	 var editor = CKEDITOR.replace( 'chitiet');
         var editor1 = CKEDITOR.replace( 'motachung',{
					toolbar :
					[
						[ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-' ],
						[ 'UIColor' ], ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl']
					]});
	 CKFinder.setupCKEditor( chitiet, './view/javascript/ckfinder/' ) ;
         CKFinder.setupCKEditor( motachung, './view/javascript/ckfinder/' ) ;
</script>

