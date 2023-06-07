<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
   <div class="left"></div>
   <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/country.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons">
	<a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a>
	<a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
   </div>
	 <div class="content">
	    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	      <table class="form">
	        <tr>
			<td><?php echo $ten_album_anh; ?></td>
	        	<td><input  type="text" name="ten_album_anh" value="<?php echo $albumanh['ten_album_anh']; ?>"/></td>
		</tr>
	        <tr>
			<td><?php echo $hinhdaidien;?></td>
			<td> 
            <input id="xFilePath" name="avatar" type="text" size="60" value="<?php echo $albumanh['avatar']; ?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer();" /> <br/>
            <img src ="<?php echo $albumanh['avatar'];?>" width= "150" height ="112" class="bimg"/> 
           
            </td>
		</tr>
	        <tr>
			<td><?php echo $motachung;?></td>
			<td><textarea name="mo_ta_chung" id="motachung"><?php echo $albumanh['general']; ?></textarea></td>
	        </tr>
	       
	      </table>
	    </form>
	  </div>

	<div class="bottom_button">
		<a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a>
		<a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a>
	</div>
</div>
<?php include('view/template/common/footer.tpl'); ?>
<script type="text/javascript">

         var editor1 = CKEDITOR.replace( 'motachung',{
					toolbar :
					[
						[ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','Image' ],
						[ 'UIColor' ], ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl']
					]});

         CKFinder.setupCKEditor( editor1, './view/javascript/ckfinder/' ) ;
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
