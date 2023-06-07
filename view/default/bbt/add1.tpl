


<div class="center_panel">

<div class="news_box_skhvdt">

<div class="news_box_title">
<span class="right_title"></span>
<a href="hoat-dong-cua-so.htm">BAN BIÊN TẬP</a>
<span class="left_title"></span>
</div>


<div class="cont_skhvdt">
  <!-- bat dau -->
  

      
    
      
       <table class="list">
	   
       <div class="group" style="margin-top: 10px;">
	   <p class="header_tours">THÔNG TIN BAN BIÊN TẬP:</p><br>
	   <p style="color:red;"><b>HỘI LIÊN HIỆP VĂN HỌC NGHỆ THUẬT TỈNH SƠN LA:</b></p>
     <br>
     <div align="center">
       <p><b>TỔNG BIÊN TẬP:</b></p>
       <p><b>NGUYỄN HÀ THU</b></p>
	  
       </div>
       </div>
 	        <form action="" method="post" enctype="multipart/form-data" id="form" onsubmit="return validate(this);">
      <table class="form">

	<tr><td><?php echo "Họ Và Tên"; ?><span class="required"> *</span></td><td><input size="50" type="text" name="ten" value="" /></td></tr>
<tr><td><?php echo "Điện thoại"; ?><span class="required"> *</span></td><td><input size="50" type="text" name="dt" value="" /></td></tr>
<tr><td><?php echo "Email"; ?><span class="required"> *</span></td><td><input size="50" type="text" name="email" value="" /></td></tr>
       
       <tr><td><?php echo "Tiêu đề"; ?><span class="required"> *</span></td><td><input size="50" type="text" name="tieu_de" value="<?php echo $_SESSION['tieude'];?>" /></td></tr>

       <tr><td><?php echo $noi_dung; ?><span class="required"> *</span> </td><td><textarea name="noi_dung" cols="60" rows="9"><?php echo $_SESSION['noidung'];?></textarea></td></tr>
       <tr><td><?php echo $ma_bao_mat; ?><span class="required"> *</span> </td><td> <img src="<?php echo $captcha;?>" />  
       <input name="captcha" value="" size="5"/>
       <span><?php if($err['captcha']){?>
      <div class="error">  <?php echo $err['captcha'];?> </div>
      <?php }?></span>
       </td></tr>
       
        <tr>
			<td><?php echo "File đính kém";?></td>
			<td>
             <input id="xFilePath" name="file" type="text" size="40" value="" />
		    <input type="button" value="Chọn file" onclick="BrowseServer();" /> <br/> 
          
            </td>
		</tr>
      
	 <tr>	       
	 </tr>
      </table>
 <input type="submit" value="Gửu đi"/> 
    </form>
    
     </table>

     
  
  <!-- ket thuc -->          
      
           
        </div>
        <div class='pager pager'></div>
    
    </div>


</div>

   
    


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