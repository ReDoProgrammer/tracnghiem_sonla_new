<div id="content">
  <div class="top1">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center">
    <div class="heading"><?php echo $heading_title;?></div>
  </div>
</div>
<div class="middle1">
  <table class="list_tb">
    <thead>    
    <tr>
    <td>Tài khoản</td>
    <td>Họ và tên</td>
    <td>Email</td>
    <td>Thao tac</td>
    </tr>
    </thead>
    <tbody>
<?php foreach($list_member as $member) { ?>
<tr>
<td><?php echo $member['tai_khoan'];?></td>
<td class="center"><?php echo $member['ten'];?></td>
<td><?php echo $member['email'];?></td>
<td class="right" width="80">[
<a href="index.php?module=member&act=<?php echo "edit";?>&id=<?php echo $member['id']; ?>">Sua</a>
] [
<a href="javascript:confirmDelete('?m=address&act=del&id=1253')">Xoa</a>
]</td>
</tr>
<tr>
<?php } ?>
</tbody>
    </table>

</div>
        <div class="bottom">
	<div class="left"></div>
	<div class="right"></div>
	<div class="center"></div>
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
			alert("Vui long nhap email");
			theform.email.focus();
			return false;
			}  
            else if(theform.email.value.indexOf('@',0)==-1 || theform.email.value.indexOf('.',0)==-1 || theform.email.value.indexOf(' ',0)!=-1){
			alert("Email khong hop le");
			theform.email.focus();
			return false;
	      	}
            else if(theform.pass.value=="")
			{
			alert("Vui lòng nhập mật khẩu");
			theform.pass.focus();
			return false;
			}   
          else if(theform.pass.value != theform.nhap_lai_pass.value)
			{
			alert("Mat khẩu xác nhận không đúng");
			theform.nhap_lai_pass.focus();
			return false;
			}  
            
		 else if(theform.ten.value=="")
			{
			alert("Vui long nhap ten day du");
			theform.ten.focus();
			return false;
			}
        else if(theform.may_ban.value=="")
			{
			alert("Vui lòng nhập số điện thoại");
			theform.may_ban.focus();
			return false;
			}
        else if(theform.dia_chi.value=="")
			{
			alert("Vui long nhap dia chi");
			theform.dia_chi.focus();
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
