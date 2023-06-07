<?php include('view/template/common/header.tpl'); ?>


<body class="hold-transition login-page" style="">
<div class="login-box">
  <div class="login-logo">
    <img class="logo" src="view/image/logo-mt.png" width="140px"></br>
    <a href=""><b>Hệ Thống Đăng Nhập</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">
	
	 <?php if ($_SESSION['password_error']) { ?>
    <div class="warning">
    <?php
             echo $_SESSION['password_error']; 
             
    ?>
     </div>
    <?php }  ?>
   
  <?php if ($_SESSION['user_name_error']) { ?>
    <div class="warning">
    <?php echo $_SESSION['user_name_error'];
             //session_destroy();
?>
     </div>
    <?php  }  ?>
   
   <?php if( $error_username){ ?>
   <div class="warning">
    <?php
             echo  $error_username; 
    ?>
    </div>
    <?php } ?>

    <?php if( $error_mk){ ?>
   <div class="warning">
    <?php
             echo  $error_mk; 
    ?>
    </div>
    <?php } ?>
	
	</p>

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Tài Khoản" name="uname">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="pwd">
        <span class="icon fa  fa-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Đăng Nhập</button>
        </div>
        <!-- /.col -->
      </div>
    </form>


  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->


</body>



