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
       <tr><td><?php echo $tieu_de; ?></td><td><input size="70" type="text" name="ho_ten" value=""/>
       <?php if ($error_tieude) { ?>
        <span class="error"><?php echo $error_tieude; ?></span>
        <?php } ?>
       </td></tr>
         <tr>
          <td><?php echo "Lựa chọn danh mục"; ?></td>
          <td><select name="to_chuc_id">
               
              <option value="false">----------<?php echo "Lựa chọn"; ?>----------</option>
              
              <?php foreach ($list_dm as $danhmuc){?> 
              <option value="<?php echo $danhmuc['id']; ?>"><?php echo $danhmuc['tieu_de']; ?></option>
              <?php } ?>
              
          </select>
         
          </td>
      </tr> 
       
  <tr><td><?php echo "STT"; ?></td><td><input size="30" type="text" name="stt" value=""/></td></tr>
    <tr><td><?php echo "Chức vụ"; ?></td><td><input size="70" type="text" name="chuc_vu" value=""/></td></tr>
     <tr><td><?php echo "Điện thoại"; ?></td><td><input size="50" type="text" name="dien_thoai" value=""/></td></tr>
      <tr><td><?php echo "Email"; ?></td><td><input size="50" type="text" name="email" value=""/></td></tr>
	  
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
