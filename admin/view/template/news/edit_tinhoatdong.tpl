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

<?php if($list_ykxl) { ?>

 <table class="list">
        <thead>
          <tr>
                 <td class="center">ID</td>
              <td class="center">Ngày giờ</td>
              <td class="center">Ý kiến xử lý</td>
               <td class="center">Tên người gửi</td>
            
          </tr>
        </thead>
        <tbody>

<?php foreach($list_ykxl as $ykxl) { ?>

<tr>
<td width="10">  <?php echo $ykxl['ykxl_id'];?></td>
<td width="120">   <?php echo $ykxl['gio_gui'];?></td>
<td>  <?php echo $ykxl['y_kien'];?></td>
<td width="80">  <?php echo $ykxl['ten_can_bo'];?></td>
</tr>




<?php } ?>        

        </tbody>


<?php } ?> 

	    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	      <table class="form">
	        <tr>
			<td><?php echo $ten_tin_hoat_dong; ?></td>
	        	<td><input size="80"  type="text" name="ten_tin_hoat_dong" value="<?php echo $tinhoatdong['ten_tin_hoat_dong']; ?>"/></td>
		</tr>
	        <tr>
			<td><?php echo $hinhdaidien;?></td>
			<td>
             <input id="xFilePath" name="file" type="text" size="60" value="<?php echo $tinhoatdong['file']; ?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer();" /> 
              <?php if($tinhoatdong['file']){ ?>
              <br/>
            <img src ="<?php echo get_thumnai($tinhoatdong['file']); ?>" width= "150" height ="112" class="bimg"/> 
              <?php } ?>
            </td>
		</tr>
        
           </tr>

<?php if(($_SESSION['type']=="admin")||($_SESSION['type']=="develop")){ ?>
	    <tr>
         <td>Danh mục tin</td>
	<td>
          <select name="cha_id" id="cha_id" onchange="$('select[name=\'cat_id\']').load('index.php?module=tinhoatdong&act=cat&cha_id='+this.value+'&cat_id=<?php echo $tinhoatdong['cat_id'];?>');">
               <option>----------<?php echo "Lựa chọn"; ?>----------</option>
               <?php foreach ($list_danhmuc as $danhmuc){?> 
               <?php if ($danhmuc['ma_danh_muc'] == $cha_id) { ?>
              <option value="<?php echo $danhmuc['ma_danh_muc'] ; ?>" selected="selected"><?php echo $danhmuc['ten_danh_muc']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $danhmuc['ma_danh_muc']; ?>"><?php echo $danhmuc['ten_danh_muc']; ?></option>
              <?php } ?>

              <?php } ?>
            </select>

              -
              <select name="cat_id">
              </select>
            </td>
		</tr>
<?php } ?>
<?php if($_SESSION['type']=="cb") { ?>
<tr>
<td>Chuyên mục</td> <td>            
          <select name="cat_id">
              <?php foreach ($list_chuyenmuc as $chuyenmuc){?> 
               <?php if ($chuyenmuc['ma_danh_muc'] == $tinhoatdong['cat_id']) { ?>
              <option value="<?php echo $chuyenmuc['ma_danh_muc'] ; ?>" selected="selected"><?php echo $chuyenmuc['ten_danh_muc']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $chuyenmuc['ma_danh_muc']; ?>"><?php echo $chuyenmuc['ten_danh_muc']; ?></option>
              <?php } ?>

              <?php } ?>
           </select>
</td>
</tr>
<?php } ?>

	        <tr>
			<td><?php echo $motachung;?></td>
			<td><textarea name="mo_ta_chung" cols="150" rows ="10"><?php echo $tinhoatdong['general']; ?></textarea></td>
	        </tr>
	        <tr>
	        	<td><?php echo $motachitiet;?></td>
	     		<td><textarea name="mo_ta_chi_tiet" id="motachitiet"><?php echo $tinhoatdong['detail']; ?></textarea></td>
	        </tr>
	   <tr>
	     <td>Tin tiêu điểm</td>
	     <td><input type="checkbox" name = "tieu_diem" value ="1"></td> 
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

<?php if(($_SESSION['type']=="admin")||($_SESSION['type']=="develop")){ ?>
<script type="text/javascript"><!--
$('select[name=\'cat_id\']').load('index.php?module=tinhoatdong&act=cat&cha_id=<?php echo $cha_id;?>&cat_id=<?php echo $tinhoatdong['cat_id']; ?>');
//--></script>
<?php } ?>