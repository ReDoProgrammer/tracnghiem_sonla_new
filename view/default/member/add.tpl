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
<span class="title">Hướng Dẫn Đăng Ký Tài Khoản</span>
</div>
<div class="card-body border-left border-bottom border-right" style="padding:10px">
<div class="fqa" data-src="wow">
<style>

    .content-question p{
        font-size: 13px;
        text-align: justify;
    }
</style>
<div class="content-question">

<?php echo $hddk1;?>


</div>
</div>
</div>
</div>

<div class="card card-box list-news-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/user.png" width="30">
</span>
<span class="title">Đăng Ký Tài Khoản</span>
</div>
<div class="card-body" style="padding:13px">
<div class="fqa" data-src="wow">
<style>

    .search-form {
        padding: 13px;
    }
    .search-form input,
    .search-form select {
        padding: 6px 13px;
        font-size: 13px;
        line-height: 1;
        border-radius: 0;
        max-height: 30px;
    }
    .search-form button {
        padding: 4px 14px;
        font-size: 13px;
        border-radius: 0;
    }
    .list-question-item .item {
        border-bottom: none;
    }
</style>


<form class="search-form fqa" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" onsubmit="return validate(this);">
<div id="alert-result" class="alert alert-info w-100" style="display: none;" role="alert">Gửi góp ý thành công</div>


<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Email tài khoản
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-6">
<input class="form-control" type="text" placeholder="username@sonla.gov.vn" name="email" value="<?php echo $_SESSION['email']; ?>">
  <?php if($err['email']) { ?>
            <span class="error"><?php echo $err['email'];?></span>
            <?php }?>
</div>
</div>



<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Họ và tên
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-6">
<input class="form-control" type="text" placeholder="Nhập họ và tên" name="ho_ten" value="<?php echo $_SESSION['ten']; ?>">
 <?php if($err['ten']) { ?>
            <span class="error"><?php echo $err['ten'];?></span>
            <?php }?>

</div>
</div>



<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Địa chỉ
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-6">
<input class="form-control" type="text" placeholder="Nhập địa chỉ của bạn" name="dia_chi" value="<?php echo $_SESSION['dc'];?>">
 <?php if($err['dc']) { ?>
            <span class="error"><?php echo $err['dc'];?></span>
            <?php }?>
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Điện thoại
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-4">
<input class="form-control" type="text" placeholder="Nhập số điện thoại" name="mobile" value="<?php echo $_SESSION['mobile']; ?>">
 <?php if($err['dt']) { ?>
            <span class="error"><?php echo $err['dt'];?></span>
            <?php }?>

</div>
</div>


<div class="form-group row row-ex" style="margin-top:5px">
<label class="col col-ex col-sm-3 col-form-label" for="txt-captcha"></label>
<div class="col col-ex col-sm-9">
<img id="img-captcha" src="<?php echo $captcha;?>">

</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Mã xác nhận
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input id="txt-captcha" class="form-control" type="text" placeholder="Nhập mã xác nhận" name="captcha">
<?php if($err['captcha']){?>
      <div class="error">  <?php echo $err['captcha'];?> </div>
      <?php }?>
</div>
</div>


<div class="form-group row row-ex">
<div class="col col-ex col-sm-3">
<button class="btn btn-default" onclick="backList()">Quay lại</button>
</div>
<div class="col col-ex col-sm-9">
<button class="btn btn-default" type="reset">Nhập lại</button>
<button class="btn btn-success" type="submit" onclick="$('#form').submit();">Đăng Ký</button>
</div>
</div>
</form>












</div>
</div>
</div>
















</div></div>






</div>

</div>


</div>

   
 