<div id="content">
<div class="box1">
<div class="box-heading1">Sửa thông tin tài khoản</div>
<div class="box-content1">
<div class="middle1">


      <div class="group6">
      <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="create">
        <table>
            
           <tr class="groupuser"><td width="250">Tên tài khoản:</td><td width="250"><?php echo $member['tai_khoan'];?></td> </tr>
           <tr><td width="250">Họ và tên: </td><td><input size="50" type="text" name="ho_ten" value="<?php echo $member['ho_ten']; ?>"/></td></tr> 
           <tr class="groupuser"><td width="250">Địa chỉ Email:</td><td><input size="50" type="text" name="email" value="<?php echo $member['email']; ?>"/></td></tr>
           <tr><td width="250">Ngày thánh năm sinh:</td><td><input size="50" type="text" name="ngay_sinh" value="<?php echo $member['ngay_sinh']; ?>"/></td></tr>
           
           <tr class="groupuser"><td width="250">Giới tính:</td>
           <td style="float: right;">
       <select name="gender">
       <option value="0">N/A</option>
       <option value="1"><?php echo "Nam"; ?></option>
       <option value="2"><?php echo "Nữ"; ?></option>
       </select>
        </td>
           </tr>
          
           <tr><td width="250">Địa chỉ:</td><td><input size="50" type="text" name="dia_chi" value="<?php echo $member['dia_chi']; ?>"/></td></tr>
           <tr class="groupuser"><td width="250">Website:</td><td><input size="40" type="text" name="web" value="mobile<?php echo $member['web']; ?>"/>(http://)<td></tr>
           <tr><td width="250">Tài khoản Yahoo:</td><td><input size="30" type="text" name="yahoo" value="<?php echo $member['yahoo']; ?>"/></td></tr>
           <tr class="groupuser"><td width="250">Điện thoại:</td><td><input size="" type="text" name="mobile" value="<?php echo $member['mobile']; ?>"/></td></tr>
    
           <tr><td width=""> <a href ="index.php?module=member&act=<?php echo "edit";?>&id=<?php echo $_SESSION['member_id']; ?>"><?php echo "Sửa thông tin hồ sơ cá nhân"; ?></a></td></tr>
       </table>
       <div class="btn" align="center">
        <table>
          <tr>
          <!--
          <td align="right" width="5"><a onclick="$('#create').submit();" class="button"><span><?php echo $button_continue; ?></span></a></td>
          -->
          <td>
          <p align="center"><input type="submit" value="Cập nhật" name="submit" /></p> 
          </td>
          </tr>
        </table>
      </div>
       </form>
       
      </div>
      
     

</div>

</div>
	</div>

 </div>
 <!-- and main -->
