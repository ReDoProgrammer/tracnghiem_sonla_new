<?php include('view/template/common/header.tpl'); ?>

<script type="text/javascript">
function BrowseServer()
{
// You can use the "CKFinder" class to render CKFinder in a page:
var finder = new CKFinder();
finder.basePath = './view/javascript/ckfinder/'; // The path for the installation of CKFinder (default = "/ckfinder/").
finder.selectActionFunction = SetFileField;
finder.popup();

}
// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
document.getElementById( 'xFilePath' ).value = fileUrl;
}
</script>

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
			<td>Tên nơi ban hành</td>
	        	<td><input  type="text" name="ten_noi_ban_hanh" value="<?php echo $noibanhanh['ten_noi_ban_hanh']; ?>" size="60"/></td>
	  	</tr>
       
        <tr>
		<td>Số thứ tự</td>
                <td><input  type="text" name="sap_xep" value="<?php echo $noibanhanh['sap_xep']; ?>"/>	</td>
       </tr>
      
             <tr>
    	        	<td><?php echo $motachitiet;?></td>
    	     		<td><textarea name="mo_ta" id="mo_ta"><?php echo $noibanhanh['mo_ta']; ?></textarea></td>
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
	 var editor = CKEDITOR.replace( 'mo_ta');
         
	 CKFinder.setupCKEditor( editor, './view/javascript/ckfinder/' ) ;
        
</script>
