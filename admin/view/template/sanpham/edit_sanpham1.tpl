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
       
      
       <tr><td><?php echo $ten_san_pham; ?></td><td><input size="60" type="text" name="tieu_de" value="<?php echo $sanpham['tieu_de'];?>" />   
       </td></tr>
       
       <tr>
          <td><?php echo $theo_danh_muc; ?></td>
          <td><select name="muc_id">
               
              <option value="false">----------<?php echo "Lựa chọn"; ?>----------</option>
              
              <?php foreach ($list_dm as $danhmuc){?>
              <?php if($danhmuc['id_danh_muc']==$sanpham['muc_id']) {?> 
              <option value="<?php echo $danhmuc['id_danh_muc']; ?>" selected ="selected"><?php echo $danhmuc['ten_danh_muc_sp']; ?></option>            
              <?php } else {?>
              <option value="<?php echo $danhmuc['id_danh_muc']; ?>"><?php echo $danhmuc['ten_danh_muc_sp']; ?></option>
              <?php } ?>
              <?php } ?>
          </select>
         
          </td>
      </tr> 
       
      
      <tr>
			<td><?php echo $hinh_anh;?></td>
			<td>
             <input id="xFilePath" name="hinh_anh" type="text" size="60" value="<?php echo $sanpham['hinh_anh'];?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer();" /> <br/> 
            </td>
		</tr>
        <tr><td><?php echo "Link Video"; ?></td><td><input size="80" type="text" name="video" value="<?php echo $sanpham['video'];?>"/>
       <tr><td><?php echo $gia_san_pham; ?></td><td><input size="20" type="text" name="gia" value="<?php echo $sanpham['gia'];?>"/>
          

       </td> </tr>
       <tr><td><?php echo $so_luong; ?></td><td><input size="10" type="text" name="so_luong" value="<?php echo $sanpham['so_luong'];?>"/><span style="padding-left: 20px; color:red; font-weight: bold;"> (DVD or CD) </span></td></tr>
       <tr><td><?php echo $dung_luong; ?></td><td><input size="15" type="text" name="dung_luong" value="<?php echo $sanpham['dung_luong'];?>"/><span style="padding-left: 20px; color:red; font-weight: bold;">(MB - GB)</span>
       </td></tr>
        <tr><td><?php echo "Định dạng"; ?></td><td><input size="35" type="text" name="dinh_dang" value="<?php echo $sanpham['dinh_dang'];?>"/><span style="padding-left: 20px; color:red; font-weight: bold;">(PSD, AI, EPS )</span>
       </td></tr>
  
         <tr>
			<td><?php echo $anh1;?></td>
			<td>
             <input id="xFilePath1" name="anh1" type="text" size="40" value="<?php echo $sanpham['anh1'];?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer1();" /> <br/> 
            </td>
		</tr>
          <tr>
			<td><?php echo $anh2;?></td>
			<td>
             <input id="xFilePath2" name="anh2" type="text" size="40" value="<?php echo $sanpham['anh2'];?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer2();" /> <br/> 
            </td>
		</tr>
          <tr>
			<td><?php echo $anh3;?></td>
			<td>
             <input id="xFilePath3" name="anh3" type="text" size="40" value="<?php echo $sanpham['anh3'];?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer3();" /> <br/> 
            </td>
		</tr>
          <tr>
			<td><?php echo $anh4;?></td>
			<td>
             <input id="xFilePath4" name="anh4" type="text" size="40" value="<?php echo $sanpham['anh4'];?>" />
		    <input type="button" value="Chọn ảnh" onclick="BrowseServer4();" /> <br/> 
            </td>
		</tr>
  
          <tr><td><?php echo $mo_ta; ?></td><td><textarea type="text" name="noi_dung" id="noidung"><?php echo $sanpham['noi_dung'];?></textarea></td></tr>
       <tr>
			<td><?php echo "Sản phẩm tiêu biểu";?></td>
			<td>
            <label>
            <?php if($sanpham['tieu_bieu']=='1'){ ?>
            <input type="checkbox" value="1" name="tieu_bieu" checked/>
            <?php } else { ?>
            <input type="checkbox" name="tieu_bieu" value="1"/>
            <?php } ?>
            </label> 
            </td>
		</tr>   
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
function BrowseServer1()
    {
    	var finder1 = new CKFinder();
    	finder1.basePath = './view/javascript/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
    	finder1.selectActionFunction = SetFileField1;
    	finder1.popup();
    }
function BrowseServer2()
    {
    	var finder2 = new CKFinder();
    	finder2.basePath = './view/javascript/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
    	finder2.selectActionFunction = SetFileField2;
    	finder2.popup();
    }
function BrowseServer3()
    {
    	var finder3 = new CKFinder();
    	finder3.basePath = './view/javascript/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
    	finder3.selectActionFunction = SetFileField3;
    	finder3.popup();
    }
function BrowseServer4()
    {
    	var finder4 = new CKFinder();
    	finder4.basePath = './view/javascript/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
    	finder4.selectActionFunction = SetFileField4;
    	finder4.popup();
    }

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
    
}
function SetFileField1(fileUrl )
{
	document.getElementById( 'xFilePath1' ).value = fileUrl;
 }
 function SetFileField2(fileUrl )
{
	document.getElementById( 'xFilePath2' ).value = fileUrl;
 }
 function SetFileField3(fileUrl )
{
	document.getElementById( 'xFilePath3' ).value = fileUrl;
 }
 function SetFileField4(fileUrl )
{
	document.getElementById( 'xFilePath4' ).value = fileUrl;
 }

</script>
