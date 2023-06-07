<div class="heading" ><?php echo $heading_title;?></div>
<div class="middle" >
   <p><a href="<?php echo $back;?>"><?php echo $address['info_address_name'];?></a></p>
      <b style="margin-bottom: 2px; display: block;"><?php echo "Thong tin chung"; ?></b>
      <div class="bg">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onsubmit="return validate(this);">
     
    <table>
        <tr>
        <td><b><?php echo "Tieu de bai viet bo sung"; ?></b><br><input type="text" name="title" size="60" id="title"value="<?php echo $additional['title'];?>" />
            <span class="required">*</span> 
            <?php if ($_SESSION['err_name']) { ?>
            <span class="error"><?php echo $_SESSION['err_name']; ?></span>
            <?php unset($_SESSION['err_name']); } ?></td>
            
        </tr>
       <tr><td><b><?php echo "Noi dung"; ?></b></td></tr>
      </table>
      <textarea type="text" rows="15" cols=50" name="test" id="<?php echo $editor;?>" >
       <?php  echo  $additional['content'];?>
      </textarea>
        <?php if(LOGIN_2_POST =='0'){?>
      <table>
 <tr><td>
        Ma bao mat:
        <img src="<?php echo $captcha;?>" /><input align="center" size="6" type="text" name="captcha" autocomplate ='off' />
        </td>
        </tr>
        <?php }?>
        
        <tr>
        <td></td>
            <td>
              <input type="submit" value="Dang bai" />
              <input type="button" onclick="javascript:window.history.go(-1);" value="Quay lai" /> 
            </td>
        </tr>
       </table>
       
    </form>
      </div>
</div>

<script type="text/javascript">
	function validate(theform)
		{
		if(theform.title.value=="")
			{
			alert("Vui long nhap tieu de");
			theform.title.focus();
			return false;
			}
            
       	else if(theform.test.value=="")
			{
			alert("vui long nhap noi dung.");
			theform.<?php echo $editor;?>.focus();
			return false;
			}
				
		return true;
	
		}
</script> 

<!-- and main -->
