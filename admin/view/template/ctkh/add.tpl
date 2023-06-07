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
       <tr><td><?php echo $tieu_de; ?></td><td><input size="70" type="text" name="tieu_de" value="<?php echo $_SESSION['ten'];?>"/>
         <?php if ($error_tieude) { ?>
        <span class="error"><?php echo $error_tieude; ?></span>
        <?php } ?>
       </td></tr>
 
     <tr>
          <td><?php echo "Danh Mục"; ?></td>
          <td><select name="dm_id">
               
              <option value="false"><?php echo "Lựa chọn"; ?></option>
              <?php if($_SESSION['dm']=='1') { ?>
              <option value="1" selected="selected"><?php echo "Kế Hoạch"; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo "Kế Hoạch"; ?></option>
              <?php } ?>
              
              <?php if($_SESSION['dm']=='2') { ?>
              <option value="2" selected="selected"><?php echo "Quy Hoạch"; ?></option>
            <?php } else { ?>
            <option value="2"><?php echo "Quy Hoạch"; ?></option>
            <?php } ?>
              
            </select>
             <?php if ($error_dm) { ?>
            <span class="error"><?php echo $error_dm; ?></span>
            <?php } ?>
            </td>
         </tr>
         
       <tr><td><?php echo $noi_dung; ?></td><td><textarea name="noi_dung" id="noidung"><?php echo $_SESSION['nd'];?></textarea></td></tr>
 <tr>
			<td><?php echo "File đính kém";?></td>
		<td>
             <input id="xFilePath" name="file" type="text" size="60" value="" />
		    <input type="button" value="Chọn file đính kèm" onclick="BrowseServer();" /> <br/> 
            </td>
		</tr>
        <tr><td><?php echo "Link liên kết"; ?></td><td><input size="70" type="text" name="link" value="<?php echo $_SESSION['link'];?>"/></td></tr>
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
	var editor = CKEDITOR.replace( 'noidung');
 
   	CKFinder.setupCKEditor( editor, './view/javascript/ckfinder/' ) ;
   
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
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
    
}

</script>