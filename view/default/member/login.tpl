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
<span class="title">Đăng Nhập Tài Khoản</span>
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

  <?php if(!$_SESSION['login']){ ?>
 <form class="search-form fqa" action="index.php?module=member&act=login" method="post" enctype="multipart/form-data" onsubmit="return validate(this);" id="create" name="dangki">

<div id="alert-result" class="alert alert-info w-100" style="display: none;" role="alert">Gửi góp ý thành công</div>


<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Tài khoản email 
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-6">
<input class="form-control" type="text" placeholder="Nhập tài khoản email" name="username" value="">

</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Nhập mật khẩu
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-6">
<input class="form-control" size="20" type="password" placeholder="Nhập mật khẩu" name="password">

</div>
</div>



<div class="form-group row row-ex" align="center">

<div class="col col-ex col-sm-12">
<button class="btn btn-success" type="submit" onclick="$('#form').submit();">Đăng Nhập</button>


<button class="btn btn-success" onclick="window.location.href='./index.php?module=member&act=regedit'" type="button">Đăng ký</button>
</div>
</div>
</form>
<?php } ?>











</div>
</div>
</div>
















</div></div>






</div>

</div>


</div>

   
 