<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Danh Mục Download
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Hệ Thống</a></li>
        <li class="active">Thay đổi mật khẩu</li>
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        



<div class="box box-warning">

<div class="box-header with-border">
<h3 class="box-title">Thông tin chính </h3>
<div class="pull-right">
<span style="font-style:italic">
(
<strong style="color:red">*</strong>
) Là thông tin bắt buộc
</span>
</div>
</div>


<!--
<?php if($success) {?>
<div class ="success">
<?php echo $success;?>
</div>
<?php } ?>


<?php if($err['oldpass']) { ?>
<div class ="warning">
<?php echo $err['oldpass'];?>
</div>
<?php } ?>

<?php if($err['pass']) { ?>
<div class ="warning">
<?php echo $err['pass']; ?>
</div>
<?php } ?>


<?php if($err['repass']) { ?>
<div class ="warning">
<?php echo $err['repass'];?>
</div>
<?php } ?>
-->

<div class="callout callout-danger">
<?php if($err['oldpass']) { ?>
<i class="fa fa-caret-right"></i>
  <?php echo $err['oldpass'];?>
<br>
<?php } ?>


<?php if($err['pass']) { ?>
<i class="fa fa-caret-right"></i>
<?php echo $err['pass']; ?>
<br>
<?php } ?>

<?php if($err['repass']) { ?>
<i class="fa fa-caret-right"></i>
<?php echo $err['repass'];?>
<br>
<?php } ?>
</div>
       <div class="box-body" id="boxBody">
	    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="create" onsubmit="return validate(this);">   
			   
			     <div class="row">
                    <div class="col-md-8">
                        <table cellpadding="3px" cellspacing="1px" border="0px" width="100%">       
        <tr class="form-group">
            <td style="text-align: right; padding:7px 0 7px 0">
                <label>Mật khẩu cũ <span style="color:Red">* &nbsp;</span></label>
            </td>
            <td>
                <input name="oldpass" type="password" Class="form-control" />
            </td>                
        </tr>   
        <tr class="form-group">
            <td style="text-align: right; padding:7px 0 7px 0">
                <label>Mật khẩu mới <span style="color:Red">* &nbsp;</span></label>
            </td>
            <td>
                <input name="password" type="password" Class="form-control" />
            </td>                
        </tr>  
        <tr>
            <td style="text-align: right; padding:7px 0 7px 0">
                <label>Nhập lại mật khẩu mới <span style="color:Red">* &nbsp;</span></label>
            </td>
            <td>
                <input name="repass" type="password" Class="form-control" />
            </td>                
        </tr>  
                               
    </table>   
                    </div>
                </div>
    <br />
	        

			
		<div class="box-footer text-center">

      <button class="btn btn-sm btn-primary btn-flat" type="submit" value="Cập nhật" name="submit" style="margin-top: 4px;"/> <i class="fa fa-check-square-o"></i>Cập Nhật</button>	
<a class="btn btn-sm btn-primary btn-flat" onclick="history.go(-1);" style="margin-top:4px">
<i class="fa fa-arrow-left"></i>
Hủy
</a>
</div>	
	
			</form>
					
			
			
			
			
			
			
			</div>



			
			
                    </div>
					
					
					
							<div class="callout callout-danger">
<h4>Chú ý!</h4>
<i class="fa fa-caret-right"></i>
  Mật khẩu phải có ít nhất 6 ký tự.
<br>
<i class="fa fa-caret-right"></i>
  Mật khẩu phải có ít nhất 1 ký tự thường (VD: a,b,c,d,...).
<br>
<i class="fa fa-caret-right"></i>
  Mật khẩu phải có ít nhất 1 ký tự hoa (VD: A,B,C,D,...).
<br>
<i class="fa fa-caret-right"></i>
  Mật khẩu phải có ít nhất 1 ký tự đặc biệt (VD: @,#,$,...).
</div>
					
					
					
                </div>
				

				
				
            </section>
        </div>
        



<?php include('view/template/common/footer.tpl'); ?>
