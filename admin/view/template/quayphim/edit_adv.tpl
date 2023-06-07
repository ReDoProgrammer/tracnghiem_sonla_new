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


       <tr><td><?php echo $tieu_de; ?>:</td><td><input size="70" type="text" name="tieu_de" value="<?php echo $adv['tieu_de']; ?>"/></td></tr>
       
       <td><?php echo $hinh_anh;?></td>
			<td>
             <input id="xFilePath" name="hinh_anh" type="text" size="70" value="<?php echo $adv['hinh_anh']; ?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer();" /> <br/> 
            </td>
       
       <tr><td><?php echo $lien_ket; ?>:</td><td><input size="70" type="text" name="link" value="<?php echo $adv['link']; ?>"/></td></tr>
       
     <tr>
          <td><?php echo "Chọn bên"; ?></td>
          <td><select name="lua_chon_id">
               
              <option><?php echo "Lựa chọn"; ?></option>
                 <?php if($adv[lua_chon_id]==1) { ?>
              <option value="1" selected="selected"><?php echo "Trên - Top"; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo "Trên - Top"; ?></option>
              <?php } ?>
              
              
              <?php if($adv[lua_chon_id]==2) { ?>
              <option value="2" selected="selected"><?php echo "Trung tâm khối 1"; ?></option>
              <?php } else { ?>
              <option value="2"><?php echo "Trung tâm khối 1"; ?></option>
              <?php } ?>
              
              <?php if($adv['lua_chon_id']=='3') { ?>
              <option value="3" selected="selected"><?php echo "Trung tâm khối 2"; ?></option> 
              <?php } else { ?>
              <option value="3"><?php echo "Trung tâm khối 2"; ?></option>  
              <?php } ?> 
              
                <?php if($adv['lua_chon_id']=='4') { ?>
              <option value="4" selected="selected"><?php echo "Trung tâm khối 3"; ?></option> 
              <?php } else { ?>
              <option value="4"><?php echo "Trung tâm khối 3"; ?></option>  
              <?php } ?> 
              
               <?php if($adv['lua_chon_id']=='5') { ?>
              <option value="5" selected="selected"><?php echo "Liên kết trái"; ?></option> 
              <?php } else { ?>
              <option value="5"><?php echo "Liên kết trái"; ?></option>  
              <?php } ?>
              
               <?php if($adv['lua_chon_id']=='6') { ?>
              <option value="6" selected="selected"><?php echo "Liên kết phải"; ?></option> 
              <?php } else { ?>
              <option value="6"><?php echo "Liên kết phải"; ?></option>  
              <?php } ?>  
              
          </select></td>
     </tr>
     
      <tr>
          <td><?php echo "Hiện thị trang"; ?></td>
          <td><select name="trang_moi">
               
              <option><?php echo "Lựa chọn"; ?></option>
              <?php if($adv['trang_moi']=='0'){ ?>
             <option value="0" selected="selected"><?php echo "Hiện thị trang mới"; ?></option> 
              <?php } else { ?>
              <option value="0"><?php echo "Hiện thị trang mới"; ?></option>
              <?php } ?>
              
              <?php if($adv['trang_moi']=='1'){ ?>
              <option value="1" selected="selected"><?php echo "Ở lại trang"; ?></option>
       <?php } else { ?>
       <option value="1"><?php echo "Ở lại trang"; ?></option>
       <?php } ?>
              
            </select></td>
         </tr>
	 
     <tr>
	 <td></td>
	 <td></td>
	 </tr>
	
      </table>
    </form>
  </div><div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
</div>

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
