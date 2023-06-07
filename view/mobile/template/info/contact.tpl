
    <div id="heading">
     <?php echo $heading_title; ?>
    </div>
  </div>
  <div class="middle">
    <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" onsubmit="return validate(this);" id="contact">
      <div class="content">
        <div style="display: inline-block; width: 100%;">
       
            <?php echo $company; ?><br />
          <b>Dia chi</b><br />
            <?php echo $address; ?></div>
         
            <?php if ($phone) { ?>
            <b>Dien thoai</b><br />
            <?php echo $phone; ?><br />
          
            <?php } ?>
            <?php if ($fax) { ?>
            <b>Fax</b><br />
            <?php echo $fax; ?>
            <?php } ?>
        </div>
      </div>
      <div class="content">
        <table width="100%">
          <tr>
            <td><?php echo "Tên"; ?><br />
              <input type="text" name="name" size="40" value="<?php echo $name; ?>" id ="name"/>
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo "Email ";?><br />
              <input type="text" name="email" size ="40"value="<?php echo $email; ?>"  id="email"/>
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo "Nội dung"; ?><br />
              <textarea name="content"  rows="10" cols="30" id="noidung"></textarea>
              <?php if ($error_content) { ?>
              <span class="error"><?php echo $error_enquiry; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo "Mã bảo mật"; ?><br />
              <img src="<?php echo $captcha;?>" /> 
              <input type="text" size="6"  name="captcha"  id="captcha" autocomplete="off" />
            <?php echo $text;?>  <?php if ($error_captcha) { ?>
              <span class="error"><?php echo $error_captcha; ?></span>
              <?php } ?>
              <br />
              </td>
          </tr>
        </table>
      </div>
      <div class="buttons">
        <table>
          <tr>
          <input value="Gui di" type="submit" name="submit" id="sunmit"/>
          </tr>
         </table>
      </div>
    </form>
  </div>
  <div class="bottom">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center"></div>
  </div>
</div>
<script type="text/javascript">
	function validate(theform){
		 if(theform.name.value=="")
			{
			alert("please enter Name");
			theform.name.focus();
			return false;
			}
		
		else if(theform.email.value=="")
			{
			alert("please enter email.");
			theform.email.focus();
			return false;
			}
		
			
		else if(theform.content.value=="")
			{
			alert("please enter content");
			theform.content.focus();
			return false;
			}
       	else if(theform.captcha.value=="")
			{
			alert("please enter captcha");
			theform.captcha.focus();
			return false;
			}
  	  			
		return true;
	
		}
</script>

