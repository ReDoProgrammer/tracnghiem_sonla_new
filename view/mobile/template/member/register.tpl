<div class="heading"><?php echo $heading_title;?></div>
<div class="content">
 <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="create" onsubmit="return validate(this);">
      <p><?php echo $text_account_already; ?></p>
      <b style="margin-bottom: 2px; display: block;"><?php echo $account_info; ?></b>
      <div class="bg">
        <table>
          <tr>
            <td width="150"><span class="required">*</span> <?php echo $username; ?></td>
            <td><input type="text" name="userName" value="<?php echo $member['user_name'];?>" />
              <?php if ($err['user_name']) { ?>
              <span class="error"><?php echo $err['user_name'];?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span><?php echo email;?></td>
            <td><input type="text" name="email" value="<?php echo $member['email']; ?>" />
              
              <span class="error"><?php echo $err_email; ?></span>
              
             </td>
          </tr>
         
          <tr>
            <td><span class="required">*</span><?php echo $entry_password; ?></td>
            <td><input type="password" name="password"  />
               <span class="error"><?php echo $err_password; ?></span></td>
          </tr>
          <tr>
            <td><?php echo $entry_re_password; ?></td>
            <td><input type="password" name="repassword"  /> 
            <span class="error"><?php echo $err_repassword; ?></span></td>
          </tr>
        </table>
      </div>
      <b style="margin-bottom: 2px; display: block;"><?php echo $entry_profile; ?></b>
      <div class="group2">
        <table>
          <tr>
            <td width="150"><?php echo $entry_fullname; ?></td>
            <td><input type="text" name="fullName" value="<?php echo $member['full_name']; ?>" /></td>
          </tr>
         
         <tr>
              <td><?php echo $entry_birthday; ?></td>
              <td><input type="text" name="age" value="<?php echo $member['age']; ?>" id="age" /></td>
         </tr>
          
          <tr>
            <td width="150"><?php echo $entry_gender; ?></td>
            <td><?php if ($member['gender']==1) { ?>
              <input type="radio" name="gender" value="1" checked="checked" />
              <?php echo $male; ?>
              <input type="radio" name="gender" value="0" />
              <?php echo $female; ?>
              <?php } else { ?>
              <input type="radio" name="gender" value="1" />
              <?php echo $male; ?>
              <input type="radio" name="gender" value="0" checked="checked" />
               <?php echo $female; ?>
              <?php } ?></td>
          </tr>
         
          <tr>
              <td><?php echo $entry_homephone; ?></td>
              <td><input type="homephone" name="homePhone" value="<?php echo $member['homephone']; ?>"  />
                <br />
                <?php if ($error_homephone) { ?>
                <span class="error"><?php echo $error_homephone; ?></span>
                <?php  } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_mobilephone; ?></td>
              <td><input type="mobilephone" name="mobilePhone" value="<?php echo $member['mobilephone']; ?>" />
                <?php if ($error_mobilephone) { ?>
                <span class="error"><?php echo $error_mobilephone; ?></span>
                <?php  } ?></td>
            </tr>
    
              <tr>
              <td><?php echo $entry_address; ?></td>
              <td><textarea cols="60" rows="5" name="address" ><?php echo $member['address']; ?></textarea>
                 <span class="error"><?php echo $err_address; ?></span></td>
            </tr>
            <tr><td><?php echo $entry_captcha; ?></td>
            <td><input type="text" name="captcha" size="10"/> 
            <img src="<?php echo $captcha; ?>" class="captcha"/>
            <?php if($err_captcha){ ?>
            <span class="error"><?php echo $err_captcha;  ?></span>
            <?php } ?>
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
          <p align="center"><input type="submit" value="<?php echo $btn_reg;?>" name="submit" /> <input onclick="url:('http://ghfg')"type="button" value="<?php echo $btn_cancel;?>"/></p> 
          </td>
          </tr>
        </table>
      </div>
  
    </form>
 </div>
</div>
 <script type="text/javascript">
	function validate(theform)
		{
	    	if(theform.userName.value=="")
			{
			alert("Vui long nhap ten su dung");
			theform.userName.focus();
			return false;
			}
            
           else if(theform.email.value=="")
			{
			alert("Vui long nhap email");
			theform.email.focus();
			return false;
			}  
            else if(theform.email.value.indexOf('@',0)==-1 || theform.email.value.indexOf('.',0)==-1 || theform.email.value.indexOf(' ',0)!=-1){
			alert("Email khong hop le");
			theform.email.focus();
			return false;
	      	}
            else if(theform.password.value=="")
			{
			alert("Vui long nhap mat khau");
			theform.password.focus();
			return false;
			}   
          else if(theform.password.value != theform.repassword.value)
			{
			alert("Mat khau xac nhan khong dung");
			theform.repassword.focus();
			return false;
			}  
            
		 else if(theform.fullName.value=="")
			{
			alert("Vui long nhap ten day du");
			theform.fullName.focus();
			return false;
			}
        else if(theform.address.value=="")
			{
			alert("Vui long nhap dia chi");
			theform.address.focus();
			return false;
			}
    
		else if(theform.captcha.value=="")
			{
			alert("Vui long nhap ma bao mat");
			theform.captcha.focus();
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

<!-- and main -->
