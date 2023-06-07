 <!-- BEGIN: content -->
<div id="heading">{heading_title}</div>
<div id="content">
 <form action="{action}" method="post" enctype="multipart/form-data" id="create">
      <p><?php echo $text_account_already; ?></p>
      <b style="margin-bottom: 2px; display: block;"><?php echo $account_info; ?></b>
      <div class="bg">
        <table>
          <tr>
            <td><span class="required"></span>{login_name}</td>
            <td><input type="text" name="user_name" value="" />
              <?php if ($_SESSION['error_user_name']) { ?>
              <span class="error"><?php echo $_SESSION['error_user_name'];?></span>
              <?php } ?></td>
          </tr>
          
           <tr>
            <td><span class="required"></span> {entry_password} </td>
            <td><input type="password" name="password" value="" />
              <?php if ($_SESSION['error_password']) { ?>
              <span class="error"><?php echo $_SESSION['error_password'];?></span>
              <?php } ?></td>
          </tr>
          
           <tr>
            <td ><span class="required"></span> </td>
            <td><input type="submit" name="submit" value="{login}" />   
            <a href="./?m=member&act=pwd">{reset_pwd}</a><br/></td>
          </tr>
          </table>
           <table>
	          <tr><td>
           {note_login}  
           </td></tr>
          </table>
      </div>
 </form>
</div>

 <!-- END: content -->
 <!-- and main -->