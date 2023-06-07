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
    </div>
   </div>
	 <div class="content">
	    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	      <table class="form">
	        <tr>
		
	    <tr>
         <td>Thiết lập quy trình</td>
	<td>

          <select name="ben_a" id="ben_a" onchange="$('select[name=\'ben_b\']').load('index.php?module=tinhoatdong&act=gui_nhan&ben_a='+this.value+'');">
           <?php foreach ($list_ben_a as $ben_a){?> 
              <option value="<?php echo $ben_a['role_key']; ?>"><?php echo $ben_a['role_name']; ?></option>
              <?php } ?>
            </select>
           


            <select name="hanh_dong">
          
              <option value="gui">Gửi</option>
              <option value="nhan">Nhận</option>

            </select>


              <select name="ben_b">
              </select>

            </td>
		</tr>
	       
	      </table>



	    </form>

 <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            
             <td class="center" width="10">
 		ID
             </td>
              <td class="center" width="50">Bên A</td>
              <td class="center" width="50"> Hành động</td>
               <td class="center" width="50">Bên B</td>
              
             <td class="center" width="10">
             Thao tác </td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_quy_trinh) { ?>
          <?php foreach ($list_quy_trinh as $quytrinh) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quytrinh['tin_hoat_dong_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quytrinh['tin_hoat_dong_id']; ?>" />
              <?php } ?></td>
              
 
            <td class="left"><?php echo  $quytrinh['quy_trinh_id']; ?></td>
            <td class="left"><?php echo  $quytrinh['ben_a']; ?></td>
            <td class="left"> <?php echo $quytrinh['hanh_dong']; ?></td>
            <td class="left"><?php echo  $quytrinh['ben_b']; ?></td>
            
           
             <td class="center" width="40">
            
            [ <a href="javascript:confirmDelete('index.php?module=tinhoatdong&act=del_quy_trinh&id=<?=$quytrinh['quy_trinh_id']?>')"  ><?php echo "Xóa"; ?></a>]
            
            </td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>


	  </div>

	<div class="bottom_button">
	
		
	</div>
</div>
<?php include('view/template/common/footer.tpl'); ?>
<script type="text/javascript">
	 var editor = CKEDITOR.replace( 'motachitiet');
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

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
}

</script>

<script type="text/javascript"><!--
$('select[name=\'ben_b\']').load('index.php?module=tinhoatdong&act=gui_nhan&ben_a=+this.value+');
//--></script>