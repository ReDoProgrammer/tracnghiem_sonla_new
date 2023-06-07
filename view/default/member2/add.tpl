<script type="text/javascript" src="./view/javascript/ckfinder/ckfinder.js"></script>
<div id="content">
<div class="box1">
<div class="box-heading1">Thông tin đăng ký</div>
<div class="box-content1">
<div class="middle1">
<div style="font-size: 10pt;padding-top: 0px; padding-bottom: 2px; padding-left: 5px; text-align:justify;">
Mục có dấu (
<font color="red">*</font>
) là bắt buộc phải nhập!
</div>
 <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="create" onsubmit="return validate(this);">
      <p><?php echo $text_account_already; ?></p>
      <b style="margin-bottom: 2px; display: block;"><?php echo $account_info; ?></b>
      <div class="group6">
        <table>
          <tr>
            <td width="150"><?php echo $username; ?><span class="required"> *</span></td>
            <td><input type="text" name="tai_khoan" value="<?php echo $_SESSION['tk'];?>" />
            <?php if($err['tai_khoan_trong']) { ?>
            <span class="error"><?php echo $err['tai_khoan_trong'];?></span>
            <?php }?>
              </td>
          </tr>
          <tr>
            <td><?php echo email;?><span class="required"> *</span></td>
            <td><input type="text" name="email" value="<?php echo $_SESSION['email']; ?>" />
            <?php if($err['email']) { ?>
            <span class="error"><?php echo $err['email'];?></span>
            <?php }?>
             </td>
          </tr>
         
          <tr>
            <td><?php echo $entry_password; ?><span class="required"> *</span>
            <td><input type="password" name="password"  />
             <?php if($err['password']) { ?>
            <span class="error"><?php echo $err['password'];?></span>
            <?php }?>
              </td>
          </tr>
          <tr>
            <td><?php echo "Xác nhận mật khẩu"; ?></td>
            <td><input type="password" name="nhap_lai_pass"  /> 
            </td>
          </tr>
        </table>
      </div>
      <b style="margin-bottom: 2px; display: block;"><?php echo $ho_so; ?></b>
      <div class="group6">
        <table>
          <tr>
            <td width="150"><?php echo $ho_ten; ?></td>
            <td><input type="text" name="ho_ten" value="<?php echo $_SESSION['ten']; ?>" />
             <?php if($err['ten']) { ?>
            <span class="error"><?php echo $err['ten'];?></span>
            <?php }?>
            </td>
          </tr>
		  <tr>
            <td width="150"><?php echo $avatar; ?></td>
            <td>
		    <input type="file" name="avatar" value="Chọn ảnh"/> <br/>             
            </td>
          </tr>
         
         <tr>
              <td><?php echo $ngay_sinh; ?></td>
              <td><input type="text" name="ngay_sinh" value="<?php echo $_SESSION['ngaysinh']; ?>"/></td>
         </tr>
         
          <tr>
              <td><?php echo "Điện thoại"; ?><span class="required"> *</span></td>
              <td><input type="text" name="mobile" value="<?php echo $_SESSION['mobile']; ?>"  /><span><font color="red"><?php echo "ký tự là kiểu số";?></font></span>
                <br />
                </td>
         </tr>
 <tr>
              <td><?php echo "Nick yahoo"; ?></td>
              <td><input type="text" size="40" name="yahoo" value="<?php echo $_SESSION['yahoo']; ?>"/></td>
         </tr>         
    <tr><td><?php echo $ma_bao_mat; ?><span class="required"> *</span></td><td><input type="text" name="captcha" value="" size="5"/>
     <img src="<?php echo $captcha;?>" />        
       <span><?php if($err['captcha']){?>
        <div class="error">  <?php echo $err['captcha'];?> </div>
      <?php }?></span>
       </td></tr>
         
        </table>
      </div>
      
      <div class="btn" align="center">
        <table>
          <tr>
          <!--
          <td align="right" width="5"><a onclick="$('#create').submit();" class="button"><span><?php echo $button_continue; ?></span></a></td>
          -->
          <td>
          <p align="center"><input type="submit" value="đăng ký" name="submit" /> <input name="submit" type="reset" value="Làm lại"/></p> 
          </td>
          </tr>
        </table>
      </div>
  
    </form>
</div>
</div>
</div>      
</div>
 <script type="text/javascript">
	function validate(theform)
		{
	    	if(theform.tai_khoan.value=="")
			{
			alert("Vui lòng nhập tên tài khoản");
			theform.tai_khoan.focus();
			return false;
			}
            
           else if(theform.email.value=="")
			{
			alert("Vui lòng nhập địa chỉ email");
			theform.email.focus();
			return false;
			}  
            else if(theform.email.value.indexOf('@',0)==-1 || theform.email.value.indexOf('.',0)==-1 || theform.email.value.indexOf(' ',0)!=-1){
			alert("Email không hợp lệ");
			theform.email.focus();
			return false;
	      	}
            else if(theform.password.value=="")
			{
			alert("Vui lòng nhập mật khẩu");
			theform.password.focus();
			return false;
			}   
          else if(theform.password.value != theform.nhap_lai_pass.value)
			{
			alert("Mật khẩu xác nhận không đúng");
			theform.nhap_lai_pass.focus();
			return false;
			}  
            
		 else if(theform.ten.value=="")
			{
			alert("Vui lòng nhập họ tên đầy đử");
			theform.ten.focus();
			return false;
			}
        else if(theform.mobile.value=="")
			{
			alert("Vui lòng nhập số điện thoại");
			theform.mobile.focus();
			return false;
			}
        
      	return true;
		}
</script>      

 <script type="text/javascript" src="./admin/theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#age').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
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
<!-- and main -->
