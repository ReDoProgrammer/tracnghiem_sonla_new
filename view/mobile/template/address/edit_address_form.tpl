<div class="heading"><?php echo $heading_title;?></div>
<div class="middle">
  <div class="bg">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onsubmit="return validate(this);">
      <table>
        <tr>
          <td width="200"><span class="required">*</span> <?php echo "Ten dia diem (dia diem)"; ?></td>
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
          <td><?php echo "Dia chi 1"; ?></td>
          <td><input type="text" name="address1" id="address1"value="<?php echo $address['address1'];?>" /></td>
        </tr>
        
         <tr>
          <td><?php echo "Dia chi 2"; ?></td>
          <td><input type="text" name="address2" id="address2"value="<?php echo $address['address2'];?>" /></td>
        </tr>
        
         <tr>
          <td><?php echo "Nguoi dai dien"; ?></td>
          <td><input type="text" name="contactName" id="contact_name" value="<?php echo $address['contact_name'];?>" /></td>
        </tr>
         
         <tr>
          <td><?php echo "Home phone"; ?></td>
          <td><input type="text" name="homePhone" id="home_phone"value="<?php echo $address['homephone'];?>" />
          
          <?php echo "Fax"; ?>
          <input type="text" name="fax" id="fax"value="<?php echo $address['fax'];?>" /></td>
        </tr>
        
          <tr>
          <td><?php echo "Mobile Phone"; ?></td>
          <td><input type="text" name="mobilePhone" value="<?php echo $address['mobilephone'];?>" /></td>
        </tr>
         
         
         <tr>
          <td><?php echo "Email"; ?></td>
          <td><input type="text" name="email" id="email"value="<?php echo $address['email'];?>" /></td>
        </tr>
        
          <tr>
          <td><?php echo "yahoo"; ?></td>
          <td><input type="text" name="yahoo" value="<?php echo $address['yahoo'];?>" /></td>
        </tr>
        
        <tr>
          <td><?php echo "Website"; ?></td>
          <td><input type="text" name="website" value="<?php echo $address['website'];?>" /></td>
        </tr>
        
          <tr>
          <td><?php echo "logo2"; ?></td>
          <td>
          <?php if($address['logo']){?>
	    <a href="images/logo/<?php echo $address['logo'];?>" rel="shadowbox">
          <img src="images/logo/<?php echo $address['logo'];?>" width="100" height="100"/><br />
        </a>
         <?php } else{?>
         <img src="images/no-photo.jpg" width="100" height="100"/><br />
          <?php } ?>
          <input type="file" name="picture30" id="picture30" /> <?php echo $_SESSION['invalid_file']; ?></td>
          </tr>
          <tr>
          <td><?php echo "map2"; ?></td>
	 <td> <?php if($address['map']){?>
         <a href="images/map/<?php echo $address['map'];?>" rel="shadowbox">
          <img src="images/map/<?php echo $address['map'];?>" width="100" height="100"/><br />
          </a>
          <?php } else{?>
         <img src="images/no-photo.jpg" width="100" height="100"/><br />
          <?php } ?>
          <input type="file" name="picture31" id="picture31" /> <?php echo $_SESSION['invalid_file'];  unset( $_SESSION['invalid_file']);?></td>
          </tr>
          <tr><td><?php echo "Mo ta chi tiet"; ?></td></tr>
      </table>
       <textarea type="text" rows="20" cols="60" name="test"  id="<?php echo $editor; ?>">
          <?php echo $address['description_detail'];?>
       </textarea></td>
    <table>
	
	<tr>
       <td>Cac anh da co</td>
        <td> <?php if($pictures){?>
        <?php foreach($pictures as $picture) { ?>
        <a href ="images/address/<?php echo $picture['image']; ?>" rel="shadowbox[Vacation]">
        <img src = "images/address/<?php echo $picture['image']; ?>" width="100" height="100"/>
        </a>
        <?php } ?>
        <?php }?>
         </td>
       </tr>
        
         <?php for($x=0;$x<$picture_quatity;$x++){ ?>
           <tr>
          <td> Anh <?php echo $x;?> </td>
          <td>
          <input name="picture<? echo $x;?>" type="file" id="picture<? echo $x;?>">
         <?php echo $_SESSION['invalid_file']; ?> 
          </td>
          </tr>
          <?php } unset($_SESSION['invalid_file']); ?>
       
      </table>
      <tr><td><p align="center"><input align="center" type="submit" value="Dang bai" name="submit" /></a></td></tr> 
     </form>
      </div>
  </div>
</div>
<script type="text/javascript"><!--
$('select[name=\'location_id\']').load('index.php?m=selection&act=zones&location_paren_id=<?php echo $parent;?>&location_id=<?php echo $address['location_id']; ?>');
//--></script>
<script type="text/javascript"><!--
$('select[name=\'category_id\']').load('index.php?m=selection&act=subcat&category_paren_id=<?php echo $address['category_paren_id'];?>&category_id=<?php echo $address['category_id']; ?>');
//--></script>

 <script type="text/javascript">
	function validate(theform)
		{
		if(theform.addressname.value=="")
			{
			alert("Vui lòng nh?p tên d?a di?m");
			theform.addressname.focus();
			return false;
			}
            
           else if(theform.location_id.value=="--")
			{
			alert("Vui lòng ch?n khu v?c");
			theform.location_id.focus();
			return false;
			}  
          else if(theform.location_paren_id.value=="---")
			{
			alert("Vui lòng ch?n khu v?c");
			theform.location_id.focus();
			return false;
			}   
          else if(theform.address1.value=="")
			{
			alert("Vui lòng nh?p d?a ch?");
			theform.address1.focus();
			return false;
			}  
            
		 else if(theform.contact_name.value=="")
			{
			alert("Vui lòng nh?p tên ngu?i d?i di?n");
			theform.contact_name.focus();
			return false;
			}
        else if(theform.home_phone.value=="")
			{
			alert("Vui lòng nh?p s? di?n tho?i");
			theform.home_phone.focus();
			return false;
			}
       else if(theform.mobile_phone.value=="")
			{
			alert("Vui lòng nh?p s? di?n tho?i di d?ng");
			theform.mobile_phone.focus();
			return false;
			}
		else if(theform.email.value=="")
			{
			alert("please enter email.");
			theform.email.focus();
			return false;
			}
		else if(theform.<?php echo $editor; ?>.value=="")
			{
			alert("Vui lòng nh?p n?i dung mô t?");
			theform.<?php echo $editor; ?>.focus();
			return false;
			}
      
      
  	  			
		return true;
	
		}
</script> 

<!-- and main -->
