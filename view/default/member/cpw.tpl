<div class="row row-ex body">



<div class="col col-ex col-sm-9 col-12 pr-0 col-9">
<div class="container-fluid container-fluid-ex">

<div data-src="wow">

<div class="row row-ex">
<div class="col col-ex p-0">







<div class="card card-box list-news-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/user.png" width="30">
</span>
<span class="title">Thay đổi mật khẩu</span>
</div>
<div class="card-body border-left border-bottom border-right" style="padding:10px">
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
<!--
<?php if($success) {?>
<div class ="success">
<?php echo $success;?>
</div>
<?php } ?>


<?php if($err['password']) { ?>
<div class ="warning">
<?php echo $err['password']; ?>
</div>
<?php } ?>


<?php if($err['repass']) { ?>
<div class ="warning">
<?php echo $err['repass'];?>
</div>
<?php } ?>-->

 <?php if($success) {?>
<div class="alert alert-info w-100" role="alert"><?php echo $success;?>

</div>
<?php } ?>

<?php if($err['password']) { ?>
<div class="alert alert-info w-100" role="alert">
<?php echo $err['password']; ?>
</div>
<?php } ?>

<?php if($err['repass']) { ?>
<div class="alert alert-info w-100" role="alert">
<?php echo $err['repass']; ?>
</div>
<?php } ?>

 <form class="search-form fqa" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="create" onsubmit="return validate(this);">





<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Mật Khẩu Mới
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-6">
<input class="form-control" type="password" name="password" />
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Xác nhận lại mật khẩu
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-6">
<input class="form-control" type="password" name="repass" />

</div>
</div>



<div class="form-group row row-ex" align="center">

<div class="col col-ex col-sm-12">
 <p align="center"><input type="submit" value="Cập nhật" name="submit" /> </p> 

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

   
 