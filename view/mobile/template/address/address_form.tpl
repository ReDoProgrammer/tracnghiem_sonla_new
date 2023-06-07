<div id="heading"><?php echo $heading_title;?></div>
<div class="middle">
<div class="bg">
     <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onsubmit="return validate(this);">
      <table>
        <tr>
          <td width="200"><span class="required">*</span> <?php echo "Tên địa chỉ"; ?></td>
          <td><input type="text" name="infoAddressName" id="addressname" value="<?php echo $address['info_address_name'];?>" />
            <?php if ($_SESSION['err_name']) { ?>
            <span class="error"><?php echo $_SESSION['err_name']; ?></span>
            <?php unset($_SESSION['err_name']); } ?></td>
        </tr>
        
        <tr>
            <td><span class="required"></span> <?php echo $entry_location; ?></td>
            <td><select name="location_paren_id" id="location_paren_id" onchange="$('select[name=\'location_id\']').load('index.php?m=selection&act=zones&location_paren_id='+this.value+'&location_id=<?php echo $address['location_id'];?>');">
                <option value="FALSE"><?php echo "---"; ?></option>
                <?php foreach ($location_paren as $paren) { ?>
                <?php if ($paren['location_id'] == $parent) { // edit la de sua?> 
                <option value="<?php echo $paren['location_id']; ?>" selected="selected"><?php echo $paren['location']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $paren['location_id']; ?>"><?php echo $paren['location']; ?></option>
                <?php } ?>
                <?php } ?>
               </select>
                -
                <select name="location_id">
                </select>
           </td>
          </tr>
          
           <tr>
            <td><span class="required"></span> <?php echo $entry_category; ?></td>
            <td><select name="category_paren_id" id="category_paren_id" onchange="$('select[name=\'category_id\']').load('index.php?m=selection&act=subcat&category_paren_id='+this.value+'&category_id=<?php echo $address['category_id'];?>');">
                <option value="FALSE"><?php echo "---"; ?></option>
                <?php foreach ($cps as $cp) { ?>
                <?php if($cp['category_id'] == $address['category_paren_id']) { ?> 
                <option value="<?php echo $cp['category_id']; ?>" selected="selected"><?php echo $cp['category']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $cp['category_id']; ?>"><?php echo $cp['category']; ?></option>
                <?php } ?>
                <?php } ?>
               </select>
                -
               <select name="category_id">
               </select>
           </td>
          </tr>
      
        <tr>
          <td><?php echo "Địa chỉ 1"; ?></td>
          <td><input type="text" name="address1"  id="address1" value="<?php echo $address['address1'];?>" /></td>
        </tr>
        
         <tr>
          <td><?php echo "Địa chỉ 2"; ?></td>
          <td><input type="text" name="address2" id="address2" value="<?php echo $address['address2'];?>" /></td>
        </tr>
        
         <tr>
          <td><?php echo "Người đại diện"; ?></td>
          <td><input type="text" name="contactName" id="contact_name"value="<?php echo $address['contact_name'];?>" /></td>
        </tr>
         
         <tr>
          <td><?php echo "Home phone"; ?></td>
          <td><input type="text" name="homePhone" id="home_phone" value="<?php echo $address['homephone'];?>" />
          
          <?php echo "Fax"; ?>
          <input type="text" name="fax" id="fax" value="<?php echo $address['fax'];?>" /></td>
        </tr>
        
          <tr>
          <td><?php echo "Mobile Phone"; ?></td>
          <td><input type="text" name="mobilePhone" id="mobile_phone" value="<?php echo $address['mobilephone'];?>" /></td>
        </tr>
         
         
         <tr>
          <td><?php echo "Email"; ?></td>
          <td><input type="text" name="email" id="email" value="<?php echo $address['email'];?>" /></td>
        </tr>
        
          <tr>
          <td><?php echo "yahoo"; ?></td>
          <td><input type="text" name="yahoo" id="yahoo" value="<?php echo $address['yahoo'];?>" /></td>
        </tr>
        
        <tr>
          <td><?php echo "Website"; ?></td>
          <td><input type="text" name="website" id="website" value="<?php echo $address['website'];?>" /></td>
        </tr>
        
          <tr>
          <td><?php echo "Logo"; ?></td>
          <td>
          <input type="file" name="picture30" id="picture30" /> <?php echo $_SESSION['invalid_file']; ?></a></td>
          </tr>
          <tr>
          <td><?php echo "Bản đồ"; ?></td>
          <td>
          <input type="file" name="picture31" id="picture31" /> <?php echo $_SESSION['invalid_file'];  unset( $_SESSION['invalid_file']);?></td>
          </tr>
          <tr><td><?php echo "Mô tả chi tiết"; ?></td></tr>
      </table>
       <textarea type="text" rows="20" cols="32" name="test"  id="<?php echo $editor; ?>">
          <?php echo $address['description_detail'];?>
        </textarea>
     <table>
       <?php   for($x=0;$x<$picture_quatity;$x++){ ?>
           <tr>
          <td> Ảnh <?php echo $x;?> </td>
          <td>
          <input name="picture<? echo $x;?>" type="file" id="picture<? echo $x;?>">
         <?php echo $_SESSION['invalid_file']; ?> 
          </td>
          </tr>
          <?php } unset($_SESSION['invalid_file']); ?>
       <?if ($mem_post=='0'){?>
        <tr><td>
        Mã bảo mật:
        <img src="<?php echo $captcha;?>" /></td><td><input align="center" type="text" value="" name="captcha" />
        </td></tr>
        <?php }?>
      </table>
      </div>
      
      <div class="btns">
        <table>
          <tr>
            <td align="right">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <input type="submit" value="Dang bai" name="submit" align="right"/> </td>
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
<script type="text/javascript"><!--
$('select[name=\'location_id\']').load('index.php?m=selection&act=zones&location_paren_id=<?php echo $parent;?>&location_id=<?php echo $address['location_id']; ?>');
//--></script>
<script type="text/javascript"><!--
$('select[name=\'category_id\']').load('index.php?m=selection&act=subcat&category_paren_id=<?php echo $address['category_paren_id'];?>&category_id=<?php echo $address['category_id']; ?>');
//--></script>

<script type="text/javascript" src="view/bbcode/jquery.bbcode.js" ></script>
<script type="text/javascript">
  $(document).ready(function(){
	$("#test").bbcode({tag_bold:true,tag_left:true ,tag_italic:true,tag_underline:true,tag_link:true,tag_image:true,button_image:true});
	process();
  });
  
  var bbcode="";
  function process()
  {
		if (bbcode != $("#test").val())
		{
			bbcode = $("#test").val();
			$.get('bbParser.php',
			{
				bbcode: bbcode
			},
			function(txt){
				$("#preview").html(txt);
				})
			
		}
		setTimeout("process()", 2000);
  
  }
</script>
 <script type="text/javascript">
	function validate(theform)
		{
		if(theform.addressname.value=="")
			{
			alert("Vui lòng nhập tên địa chỉ");
			theform.addressname.focus();
			return false;
			}
            
           else if(theform.location_id.value=="")
			{
			alert("Vui lòng chọn khu vực");
			theform.location_id.focus();
			return false;
			}  
          else if(theform.location_paren_id.value=="FALSE")
			{
			alert("Vui lòng chọn khu vực");
			theform.location_paren_id.focus();
			return false;
			}   
          else if(theform.address1.value=="")
			{
			alert("Vui lòng nhập địa chỉ");
			theform.address1.focus();
			return false;
			}  
            
		 else if(theform.contact_name.value=="")
			{
			alert("Vui lòng nhập tên người đại diện");
			theform.contact_name.focus();
			return false;
			}
        else if(theform.home_phone.value=="")
			{
			alert("Vui lòng nhập số điện thoại");
			theform.home_phone.focus();
			return false;
			}
       else if(theform.mobile_phone.value=="")
			{
			alert("Vui lòng nhập số di động");
			theform.mobile_phone.focus();
			return false;
			}
		else if(theform.email.value=="")
			{
			alert("Đề nghị nhập địa chỉ email.");
			theform.email.focus();
			return false;
			}
		else if(theform.<?php echo $editor; ?>.value=="")
			{
			alert("Vui lòng nhập nội dung mô tả ?");
			theform.<?php echo $editor; ?>.focus();
			return false;
			}
      
      	return true;
	
		}
</script>      
<!-- and main -->

