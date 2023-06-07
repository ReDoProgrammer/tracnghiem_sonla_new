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
			<td><?php echo $hinh_anh;?></td>
			<td>
             <input id="xFilePath" name="hinh_anh" type="text" size="70" value="<?php echo $hinhanh['hinh_anh']; ?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer();" /> <br/> 
            </td>
		</tr>
  
	 
     <tr>
	 <td></td>
	 <td></td>
	 </tr>
	
      </table>
    </form>
    
    <div class="box-product">
 	    <?php foreach($list_hinhanh as $hinhanh) { ?>
		   <div>
		        
                         <?php if($hinhanh['hinh_anh']) {?>
        <a href="<?php echo $hinhanh['hinh_anh']; ?>" class="thickbox" rel="shadowbox">              
        <img src ="<?php echo $hinhanh['hinh_anh'];?>" class="bimg" width="140" height ="100" style="border: 4px solid #ebebeb; box-shadow: 2px 1px 6px 1px #000000;"/> </a>
                        <?php } ?>
		        
		     <td align="center"><br>
            [ <a href="index.php?module=album&act=<?php echo "editanh";?>&id=<?php echo $hinhanh['ma_anh']; ?>"><?php echo "Sửa"; ?></a> ]
            [ <a href="javascript:confirmDelete('index.php?module=album&act=xoaanh&id=<?=$hinhanh['ma_anh']?>')"  ><?php echo "Xóa"; ?></a>]
            </br></td>
            
		     </div>
         <?php } ?>

		 </div>	 
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
