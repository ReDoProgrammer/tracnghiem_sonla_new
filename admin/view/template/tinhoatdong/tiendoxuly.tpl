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
	</div>
   </div>
	 <div class="content">

<?php if($list_tiendoxuly) { ?>

 <table class="list">
        <thead>
          <tr>
                 <td class="center">ID</td>
              <td class="center">Ngày giờ</td>
             <td class="center">Tác nhân</td>
              <td class="center">Hành động</td>
             
            
          </tr>
        </thead>
        <tbody>

<?php foreach($list_tiendoxuly as $tdxl) { ?>

<tr>
<td width="10">  <?php echo $tdxl['tdxl_id'];?></td>
<td width="120">   <?php echo $tdxl['ngay_gio'];?></td>
<td width="120">  <?php echo $tdxl['tai_khoan'];?> ( <?php echo $tdxl['ho_ten'];?>)</td>
<td> <?php echo $tdxl['hanh_dong'];?></td>

</tr>

<?php } ?>        

        </tbody>
</table>

<?php } ?> 

	    
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

<?php if(($_SESSION['type']=="admin")||($_SESSION['type']=="develop")){ ?>
<script type="text/javascript"><!--
$('select[name=\'cat_id\']').load('index.php?module=tinhoatdong&act=cat&cha_id=<?php echo $cha_id;?>&cat_id=<?php echo $tinhoatdong['cat_id']; ?>');
//--></script>
<?php } ?>