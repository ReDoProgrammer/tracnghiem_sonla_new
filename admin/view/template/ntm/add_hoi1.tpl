<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/country.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?>
	</span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
       <tr><td><?php echo $title; ?></td><td><input size="70" type="text" name="title" value=""/>
   
       </td></tr>
        <tr><td><?php echo $author; ?></td><td><input size="50" type="text" name="author" value=""/></td></tr>
<!--
        <tr><td><?php echo $loai_cau_hoi; ?></td><td><input size="50" type="text" name="loai_cau_hoi" value=""/></td></tr>
-->
		 <tr><td><?php echo $dia_chi; ?></td><td><input size="50" type="text" name="dia_chi" value=""/></td></tr>
		 <tr><td><?php echo $email; ?></td><td><input size="50" type="text" name="email" value=""/></td></tr>
		  
        <tr>
			<td><?php echo $file;?></td>
			<td>
             <input id="xFilePath" name="file" type="text" size="60" value="" />
		    <input type="button" value="Chọn file" onclick="BrowseServer();" /> <br/> 
            </td>
		</tr>
        <tr><td><?php echo $link; ?></td><td><input size="80" type="text" name="link" value=""/>
       
       </td></tr>
       
       <tr><td><?php echo $noi_dung; ?></td><td><textarea name="noi_dung" id="noi_dung"></textarea></td></tr>
  
        <tr><td><?php echo "Trả lời"; ?></td>
		<td><textarea name="tra_loi" cols="100" rows="3" id="tra_loi"><?php echo $hoi['tra_loi'];?></textarea></td>
	 

	   </tr>
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
	 var editor = CKEDITOR.replace( 'noi_dung');
     	 var editor = CKEDITOR.replace( 'tra_loi');
	 CKFinder.setupCKEditor( chitiet, './view/javascript/ckfinder/' ) ;
         CKFinder.setupCKEditor( traloi, './view/javascript/ckfinder/' ) ;
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
