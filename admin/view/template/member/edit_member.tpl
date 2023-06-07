<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thông Tin Thành Viên
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Thông Tin</a></li>
        <li class="active"><?php echo $member['ho_ten']; ?></li>
    </ol>

            </section>
          
		  
		  
		  
		  
		  
		   <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
			<?php if($member['logo']){?>
              <img class="profile-user-img img-responsive img-circle" src="../data/images/users/logo.png" alt="User profile picture">
			  <?php } else { ?>
			   <img class="profile-user-img img-responsive img-circle" width="128" src="./view/image/no-avatar.jpg" alt="User profile picture" />
			  <?php } ?>

              <h3 class="profile-username text-center"><?php echo $member['tai_khoan']; ?></h3>

              <p class="text-muted text-center"><?php echo $member['ho_ten']; ?></p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Email:</b> <a class="pull-right"><?php echo $member['email']; ?></a>
                </li>
                <li class="list-group-item">
                  <b>Điện Thoại:</b> <a class="pull-right"><?php echo $member['mobile']; ?></a>
                </li>
                <li class="list-group-item">
                  <b>Ngày Sinh:</b> <a class="pull-right"><?php echo $member['ngay_sinh']; ?></a>
                </li>
				 <li class="list-group-item">
                  <b>Ngày Tham Gia:</b> <a class="pull-right"><?php echo $member['ngay_tham_gia']; ?></a>
                </li>
              </ul>

              <a href="index.php?module=member&act=<?php echo "cpw";?>&id=<?php echo $member['id_regedit']; ?>" class="btn btn-primary btn-block"><b>Thay Đổi Mật Khẩu</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Giới Thiệu</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> Education</strong>

              <p class="text-muted">
              <?php echo $member['mo_ta']; ?>
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> Địa Chỉ</strong>

              <p class="text-muted"><?php echo $member['dia_chi']; ?></p>

              <hr>
<!--
              <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

              <p>
                <span class="label label-danger">UI Design</span>
                <span class="label label-success">Coding</span>
                <span class="label label-info">Javascript</span>
                <span class="label label-warning">PHP</span>
                <span class="label label-primary">Node.js</span>
              </p>

              <hr>-->


            
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">

              <li class="active"><a href="" data-toggle="tab">Sửa Thông Tin Cá Nhân</a></li>
            
            </ul>
            <div class="tab-content">
 
		 
    <!-- /.tab-pane -->
             
              <div class="box box-primary">
<h3 class="box-title">Chi tiết</h3>
</div>
 <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onclick="return validate(this);">
			  <div class="box-body">
			   
<div class="row">


			  
			  <div id="pop4" class="col-md-4" style="display: block;">
                                    <div class="form-group">
                                        <label>Họ và tên </label>
                                        <input name="ho_ten" type="text" value="<?php echo $member['ho_ten'];?>" class="form-control" />
                                    </div>
                                    <div class="form-group">         
                                        <label>Ngày Tham Gia </label>
                                        <input name="ctl00$phContent$txtTen" type="text" value="Bình" readonly="readonly" id="ctl00_phContent_txtTen" class="form-control" />
                                    </div>
                                  
                                 
                                    <div class="form-group">
                                        <label>Ngày Sinh </label>
                                        <div class="input-group">
                                          <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                          </div>
                                          <input name="ngay_sinh" type="text" value="<?php echo $member['ngay_sinh'];?>" id="datepicker1" class="form-control" />
                                        </div>
                                        
                                    </div>
                                  
                                    <div class="form-group">
                                        <label>Giới tính </label>
											<select name="gioi_tinh" class="form-control">
												 <option value=""><?php echo "Lựa Chọn"; ?></option>
       
          <?php if($member['gioi_tinh']=='1'){ ?>
          <option value="1" selected="selected"><?php echo "Nam"; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo "Nam"; ?></option>
          <?php } ?>
          <?php if($member['gioi_tinh']=='2'){ ?>
          <option value="2" selected="selected"><?php echo "Nữ"; ?></option>
          <?php } else { ?>
          <option value="2"><?php echo "Nữ"; ?></option>
          <?php } ?> 

											</select>
                                        
                                    </div>

		</div>

  
			  <div id="pop5" class="col-md-4" style="display: block;">
  <div class="form-group">
  
  
  
    <div class="form-group">
                                        <label>Điện thoại </label>
                                        <div class="input-group">
                                          <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                          </div>
                                          <input name="may_ban" type="text" value="<?php echo $member['may_ban'];?>" id="" class="form-control" />
                                        </div>
                            
                                    </div>
                                    <div class="form-group">
                                        <label>Di động </label>
                                    
                                        <div class="input-group">
                                          <div class="input-group-addon">
                                            <i class="fa fa-tablet"></i>
                                          </div>
                                          <input name="mobile" type="text" value="<?php echo $member['mobile'];?>" id="" class="form-control" />
                                            
                                        </div>
                                        
                                    </div>
                                        <label>Phân Quyền </label>
                                       <select name="phan_quyen" class="form-control">
												 <option value=""><?php echo "Thành viên"; ?></option>
       
          <?php if($member['phan_quyen']=='1'){ ?>
          <option value="1" selected="selected"><?php echo "Quản trị web"; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo "Quản trị web"; ?></option>
          <?php } ?>
          <?php if($member['phan_quyen']=='2'){ ?>
          <option value="2" selected="selected"><?php echo "Phát triển website"; ?></option>
          <?php } else { ?>
          <option value="2"><?php echo "Phát triển website"; ?></option>
          <?php } ?> 
											</select>
                                    </div>
                                     <div class="form-group">
                                        <label>Địa chỉ </label>
                                        <input name="dia_chi" type="text" value="<?php echo $member['dia_chi'];?>" id="" class="form-control" />
                                    </div>
                     
                                 
</div>


 <div id="pop6" class="col-md-4" style="display: block;">
 
									  <div class="form-group">
                                        <label>Email </label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                            <input name="email" type="text" value="<?php echo $member['email'];?>" id="ctl00_phContent_txtEmail" class="form-control" />
                                          </div>
                            
                                    </div>
                   
                                   
                                    <div class="form-group">
                                        <label>Website</label>
                                        <div class="input-group">
                                          <div class="input-group-addon">
                                            <i class="fa fa-firefox"></i>
                                          </div>
                                          <input name="web" type="text" value="<?php echo $member['web'];?>" class="form-control" />
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label>Yaoo Messenger </label>
                                        <div class="input-group">
                                          <div class="input-group-addon">
                                            <i class="fa fa-wechat"></i>
                                          </div>
                                          <input name="yahoo" type="text" value="<?php echo $member['yahoo'];?>" id="ctl00_phContent_txtDienThoai" class="form-control" />
                                        </div>
                            
                                    </div>
									
									<div class="form-group">
									<label for="exampleInputFile">Chọn Ảnh Đại Diện</label>
									<input id="exampleInputFile" type="file" name="file" id="file" value="<?php echo $member['logo'];?>">
									<p class="help-block"><?php echo $_SESSION['invalid_file']; ?>.</p>
									</div>
									

</div>


</div>




</form>		  
			  
	<div class="box-footer clearfix">
<span class="pull-right">
<button class="btn btn-danger btn-flat" type="reset">
<i class="fa fa-times"></i>
 Hủy
</button>

<button class="btn btn-primary btn-flat" onclick="location = '<?php echo $link_list; ?>';" style="">
<i class="fa fa-save"></i>
 Lưu
</button>
<button class="btn btn-primary btn-flat" onclick="history.go(-1);" type="button">
<i class="fa fa-reply"></i>
 Trở về
</button>
</span>
</div>		
			 
</div>	

              <!-- /.tab-pane -->

            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
		  
		  
		  
		  
		  
		  
		  
        </div>
        



<?php include('view/template/common/footer.tpl'); ?>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
    <script>
  $( function() {
    $( "#datepicker1" ).datepicker();
  } );
  </script>
  
    <script>
  $( function() {
    $( "#datepicker3" ).datepicker();
  } );
  </script>
  