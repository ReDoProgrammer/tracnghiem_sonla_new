<div id="content">
<div class="box1">
<div class="box-heading1">Thông tin tài khoản</div>
<div class="box-content1">
<div class="middle1">

      <b style="margin-bottom: 2px; display: block;"><?php echo "Thông tin chung tài khoản cá nhân của tôi"; ?></b>
      <div class="group6">
        <table>
        <?php if($_SESSION['avatar']) {?>
        <a title="Tài khoản" href="index.php?module=member&act=account">
<img class="signed1" style="float: right;" src="<?php echo $_SESSION['avatar'];?>" alt="Thông tin tài khoản">
        </a>
        <?php } else{?>
        <a title="Tài khoản" href="index.php?module=member&act=account">
<img class="signed1" style="float: right;" src="view/theme/default/image/avatar_male.png" alt="Thông tin tài khoản">
        </a>
        <?php } ?>
        <!--
          <tr>
            <td width="150"> <?php echo "Tổng số địa chỉ "; ?></td>
            <td><?php echo $total;?> bài</td>
            
          </tr>
          -->
          <tr>
            <td width="150"> <?php echo "Họ và tên"; ?> : </td>
            <td><?php echo $member['ho_ten'];?></td>
          </tr>
        <tr>
            <td width="150"> <?php echo "Email"; ?> : </td>
            <td><?php echo $member['email'];?></td>
          </tr>
       <tr>
            <td width="150"> <?php echo "Ngày sinh"; ?> : </td>
            <td><?php echo $member['ngay_sinh'];?></td>
       </tr>
        <tr>
            <td width="150"> <?php echo "Điện thoại"; ?> : </td>
            <td><?php echo $member['mobile'];?></td>
       </tr>
       <tr>
            <td width="150"> <?php echo "Lần đăng nhập cuối:"; ?></td>
            <td><?php echo $member['time_login'];?></td>
       </tr>
        <tr>
            <td width="150"> <?php echo "Địa chỉ Ip:"; ?></td>
            <td><b><font color="red"><?php echo $member['add_ip'];?></font></b></td>
       </tr>
       
        </table>

      </div>

    <b style="margin-bottom: 2px; display: block;"><a href ="index.php?module=member&act=<?php echo "edit";?>&id=<?php echo $member['id_regedit']; ?>">Sửa thông tin tài khoản</a></b>
      <div class="group6">
        <table>
            
           <tr class="groupuser"><td width="250">Tên tài khoản:</td><td width="250"><font color="red"><?php echo $member['tai_khoan'];?></font></td> </tr>
           <tr class="groupuser1"><td width="250">Họ và tên: </td><td width="250"><?php echo $member['ho_ten'];?></td></tr> 
           <tr class="groupuser"><td width="250">Địa chỉ Email:</td><td width="250"><font color="red"><?php echo $member['email'];?></font></td></tr>
           <tr class="groupuser1"><td width="250">Ngày thánh năm sinh:</td><td width="250"><?php echo $member['ngay_sinh'];?></td></tr>
           
           <tr class="groupuser"><td width="250">Giới tính:</td><td width="250">
            <?php if($member['gender']=='0') {echo "N/A" ;}
            else if($member['gender']=='1'){echo "Nam" ;}
            else if($member['gender']=='2'){echo "Nu" ;}?>
           
           </td></tr>
           
           <tr class="groupuser1"><td width="250">Địa chỉ:</td><td width="250"><?php echo $member['dia_chi'];?></td></tr>
           <tr class="groupuser"><td width="250">Website:</td><td width="250"><a target="_blank" href="<?php echo $member['web'];?>"><?php echo $member['web'];?></a></td></tr>
           <tr class="groupuser1"><td width="250">Tài khoản Yahoo:</td><td width="250"><?php echo $member['yahoo'];?></td></tr>
           <tr class="groupuser"><td width="250">Điện thoại:</td><td width="250"><?php echo $member['mobile'];?></td></tr>
           <tr class="groupuser1"><td width="250">Ngày tham gia:</td><td width="250"><?php echo $member['ngay_tham_gia'];?></td></tr>
           <tr class="groupuser"><td width="250">Địa chỉ Ip:</td><td width="250"><?php echo $member['add_ip'];?></td></tr>
           <tr><td width=""> <a href ="index.php?module=member&act=<?php echo "edit";?>&id=<?php echo $_SESSION['member_id']; ?>"><?php echo "Sửa thông tin hồ sơ cá nhân"; ?></a></td></tr>
       </table>
      </div>
      
     

</div>

</div>
	</div>

 </div>
 <!-- and main -->
