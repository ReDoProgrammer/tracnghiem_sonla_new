
<div class="row row-ex body">



<div class="col col-ex col-sm-9 col-12 pr-0 col-9">
<div class="container-fluid container-fluid-ex">

<div data-src="wow">

<div class="row row-ex">
<div class="col col-ex p-0">






<div class="card card-box list-news-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/icon-lienhe.png">
</span>
<span class="title">Đăng Nhập Hệ Thống</span>
</div>
<div class="card-body border-left border-bottom border-right" style="padding:10px">
<div class="fqa" data-src="wow">



 <span style=""><?php echo "Thông tin chung tài khoản cá nhân của tôi"; ?></span>

      <div class="group">
	  
	 <table class="table table-bordered">
<colgroup>

<col style="width:200px">
<col style="width:auto">

</colgroup>
<tbody id="list-legal-docs">
<!--<tr>
<td class="text-left" scope="row">Tài Khoản</td>
<td><?php echo $member['tai_khoan'];?></td>

</tr>-->
<tr>
<td class="text-left" scope="row">Họ Và Tên</td>
<td><?php echo $member['ho_ten'];?></td>
</tr>
<tr>
<td class="text-left" scope="row">Email</td>
<td><?php echo $member['email'];?></td>
</tr>
<tr>
<td class="text-left" scope="row">Điện Thoại</td>
<td><?php echo $member['mobile'];?></td>
</tr>
<tr>
<td class="text-left" scope="row">Địa Chỉ:</td>
<td><?php echo $member['dia_chi'];?></td>
</tr>
 <?php if($member['ngay_sinh']) {?>
<tr>
 
<td class="text-left" scope="row">Ngày sinh</td>
<td><?php echo $member['ngay_sinh'];?></td>
</tr>
<?php } ?>
<tr>
<td class="text-left" scope="row">Ngày tham gia</td>
<td><?php echo date_format(date_create($member['ngay_tham_gia']),'d/m/Y');?></td>
</tr>
<tr>
<td class="text-left" scope="row">Lần đăng nhập cuối:</td>
<td><?php echo date_format(date_create($member['time_login']),'H:i:s d - d/m/Y');?></td>
</tr>

<tr>
<td class="text-left" scope="row">Địa chỉ IP:</td>
<td><?php echo $member['add_ip'];?></td>
</tr>

</tbody>
</table> 
	  
	  
      
		<hr>
<p align="center"><button class="btn btn-success" onclick="window.location.href='./index.php?module=cts&act=add'" type="button">Đăng ký CTS Online</button></p>
      </div>

    <b style="margin-bottom: 2px; display: block;"><a href ="index.php?module=member&act=<?php echo "edit";?>&id=<?php echo $member['id_regedit']; ?>">Sửa thông tin tài khoản</a></b>
      <!--<div class="group">
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
      </div>-->


<b>
<span style="">Danh sách Email Đã Đăng Ký</span> <span style="float: right;"><?php echo $totalctsonline;?></span></b>
<table class="list_tb" style="text-align: center; height: 55px;">
<thead>
<tr>
<td>STT</td>
<td>Email</td>
<td>Họ Và Tên</td>
<td>Ngày Đăng Ký</td>
<td>Ngày Hết Hạn</td>
<td>Xem</td>
</tr>
</thead>
<tbody>
<?php foreach ($list_ctsonline as $cts) {  $s=$s+1;  ?>
<tr>

<td><?php echo $s; ?></td>
<td class="center" style="width: 30%;"><?php echo $cts['email'];?></td>
<td style="width: 20%;"><?php echo $cts['ho_ten'];?></td>

<td class="" style="width: 20%;">
 <?php if($cts['ngay_bat_dau']) {?>
<?php echo date_format(date_create($cts['ngay_bat_dau']),'d.m.Y');?>
<?php } ?>
</td>

<td class="" style="width: 20%;">
 <?php if($cts['ngay_ket_thuc']) {?>
<?php echo date_format(date_create($cts['ngay_ket_thuc']),'d.m.Y');?>
<?php } ?>
</td>
<td class="" style="width: 10%;"><a href="index.php?module=cts&act=view&id=<?php echo $cts['id_cts']; ?>">Xem</a></td>
</tr>
<?php } ?>
</tbody>
</table>




</div>
</div>
</div>
















</div></div>






</div>

</div>


</div>

   
