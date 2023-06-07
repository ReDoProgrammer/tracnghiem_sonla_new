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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onclick="return validate(this);">
      <table class="form">
       
       <tr><td><?php echo $ma_san_pham; ?></td><td><input size="40" type="text" name="ma_san_pham" value="<?php echo $_SESSION['masanpham'];?>"/>
       
       <?php if ($error_ma) { ?>
<span class="error"><?php echo $error_ma; ?></span>
<?php } ?>
       
       </td></tr>
       
       <tr><td><?php echo $ten_san_pham; ?></td><td><input size="60" type="text" name="ten_san_pham" value="<?php echo $_SESSION['tensanpham'];?>" />
       
       <?php if ($error_ten) { ?>
<span class="error"><?php echo $error_ten; ?></span>
<?php } ?>
       
       </td></tr>
      
           <tr><td><?php echo $loai_san_pham; ?></td>
          <td>
       
          <select name="ma_loai" id="ma_loai" onchange="$('select[name=\'con_id\']').load('index.php?module=combobox&act=danhmuccon&ma_cha='+this.value+'&ma_loai=<?php echo $maytinh['ma_loai'];?>');">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($list_danhmuccha as $danhmuccha) { ?>
              <?php if ($danhmuccha['ma_loai'] == $getdanhmuccha['ma_loai']) { ?>
              <option value="<?php echo $danhmuccha['ma_loai']; ?>" selected="selected"><?php echo $danhmuccha['ten_loai']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $danhmuccha['ma_loai']; ?>"><?php echo $danhmuccha['ten_loai']; ?></option>
              <?php } ?>
              <?php } ?>
                          <?php if ($error_loaisp) { ?>
<span class="error"><?php echo $error_loaisp; ?></span>
<?php } ?> 
            </select>
                   danh muc con
              
              <select name="con_id">
              </select>  
              
            </td>
         </tr>
      <tr>
			<td><?php echo $hinh_anh;?></td>
			<td>
             <input id="xFilePath" name="hinh_anh" type="text" size="60" value="<?php echo $maytinh['hinh_anh']; ?><?php echo $_SESSION['hinhanh'];?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer();" /> <br/> 
            </td>
		</tr>
        
       <tr><td><?php echo $gia_san_pham; ?></td><td><input size="20" type="text" name="gia_san_pham" value="<?php echo $_SESSION['giasanpham'];?>"/><td><?php echo $bao_hanh; ?></td><td><input size="20" type="text" name="bao_hanh" value=""/></td>
          

       </td> </tr>
       <tr><td><?php echo $hang_san_xuat; ?></td><td><input size="30" type="text" name="hang_san_xuat" value=""/></td></tr>
       <tr><td><?php echo $khuyen_mai; ?></td><td><input size="40" type="text" name="khuyen_mai" value="<?php echo $_SESSION['khuyenmai'];?>"/>
       
       <?php if ($error_km) { ?>
<span class="error"><?php echo $error_km; ?></span>
<?php } ?> 

       </td></tr>
        <tr>
          <td><?php echo $kho_hang; ?></td>
          <td><select name="kho_hang">
               
              <option value="1"><?php echo "Còn hàng"; ?></option>
              <option value="0"><?php echo "Hết hàng"; ?></option>
              <option value="2"><?php echo "Đợi 2-3 ngày"; ?></option>
              
            </select></td>
         </tr>
  
          <tr><td><?php echo $mo_ta; ?></td><td><textarea type="text" name="mo_ta" id="motachung"></textarea></td></tr>
          <tr><td><?php echo $noi_dung; ?></td><td><textarea type="text" name="noi_dung" id="chitiet"></textarea></td></tr>
          <tr><td>sp dac biet</td> <td>  <input type="checkbox" name="dac_biet"/>  </td></tr>
          
	 <tr>
	 <td></td>
	 <td></td>
	 </tr>
	
      </table>
    </form>
  </div><div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
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

//ham goi popup len
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
<script type="text/javascript">
	function validate(theform)
		{
	    	if(theform.gia_san_pham.value=="")
			{
			alert("Vui lòng nhập giá sản phẩm");
			theform.gia_san_pham.focus();
			return false;
			}
 
           
          
      
      	return true;
		}
</script>
