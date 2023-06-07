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
<span class="title">Thông tin liên hệ</span>
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
<div class="group">
<p class="header_tours">THÔNG TIN LIÊN HỆ:</p>

<p style="color:red;">
<b>TRANG CHỨNG THỰC ĐIỆN TỬ VÀ CHỮ KÝ SỐ
TỈNH SƠN LA:</b>
</p>

<p>
<b>Điện thoai:</b>
 0212.2210468
<b>Fax:</b>
 0212.2210468

</p>
<p>
<b>Địa Chỉ:</b>
 Số 20, Đường Hoàng Quốc Việt, TP Sơn La 
</p>


<p>
<b>Email:</b>
cntt.stttt@sonla.gov.vn 
</p>

<p>
<b>Website:</b>
<a href="http://chukyso.sonla.gov.vn">http://chukyso.sonla.gov.vn</a>
</p>
</div>
</div>
</div>
</div>
</div>

<div class="card card-box list-news-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/icon-hoi.png">
</span>
<span class="title">Liên Hệ Với Chúng Tôi</span>
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
<label class="col col-ex col-sm-3 col-form-label" for="txt-fullname">
Họ và tên
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input class="form-control" type="text" required="" placeholder="Nhập họ tên" name="ten">
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-address">
Địa chỉ
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input class="form-control" type="text" required="" placeholder="Nhập địa chỉ" name="dia_chi">
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-email">Email</label>
<div class="col col-ex col-sm-9">
<input id="txt-email" class="form-control" type="text" placeholder="Nhập thư điện tử" name="email">
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-phone">
Điện thoại
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input id="txt-phone" class="form-control" type="text" required="" placeholder="Nhập điện thoại" name="dien_thoai">
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Tiêu đề
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input id="txt-subject" class="form-control" type="text" required="" placeholder="Nhập tiêu đề câu hỏi" name="tieu_de">
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-question">
Nội dung
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<textarea id="txt-question" class="form-control" required="" placeholder="Nhập nội dung" name="noi_dung" rows="3"></textarea>
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
<input id="txt-captcha" class="form-control" type="text" required="" placeholder="Nhập mã xác nhận" name="captcha">
</div>
</div>
<div class="form-group row row-ex">
<div class="col col-ex col-sm-3">
<button class="btn btn-default" onclick="backList()">Quay lại</button>
</div>
<div class="col col-ex col-sm-9">
<button class="btn btn-default" type="reset">Nhập lại</button>
<button class="btn btn-success" type="submit" value="submit" onclick="submitQuestion()">Gửu liên hệ</button>
</div>
</div>
</form>




<div class="card card-box list-news-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/icon-lienhe.png">
</span>
<span class="title">Thông tin liên hệ</span>
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
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3716.750630553384!2d103.91304931451994!3d21.320867685840856!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3132f4d55acf3481%3A0xa51d5217b4a27db9!2zMjAgSG_DoG5nIFF14buRYyBWaeG7h3QsIENoaeG7gW5nIEPGoWksIFPGoW4gTGEsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1569322613911!5m2!1svi!2s" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
</div>
</div>
</div>
</div>








</div>
</div>
</div>
















</div></div>






</div>

</div>


</div>

<script>
  var screen = $('#detail-item');
  var tagStr = '';
  tagStr = tagStr.substr(1, tagStr.length - 2);

  function fontPlus() {
    var contentEl = $('.content .content');
    var fontSize = parseInt(contentEl.css('font-size').split('px')[0]);
    contentEl.css('font-size', ++fontSize);
  }

  function fontMinus() {
    var contentEl = $('.content .content');
    var fontSize = parseInt(contentEl.css('font-size').split('px')[0]);
    contentEl.css('font-size', --fontSize);
  }

  function screenPlus() {
    var rbgaColor = screen.css('background-color');
    var bgColorSeparated = rbgaColor.split(',');
    var opacity = bgColorSeparated[3].split(')');
    if (parseFloat(opacity[0]) < 0.9) {
      var newOpacity = parseFloat(opacity[0]) + 0.1;
      screen.css('background-color', 'rgba(113,113,113,' + newOpacity + ')');
    }
  }

  function screenMinus() {
    var rbgaColor = screen.css('background-color');
    var bgColorSeparated = rbgaColor.split(',');
    var opacity = bgColorSeparated[3].split(')');
    if (parseFloat(opacity[0]) > 0) {
      var newOpacity = parseFloat(opacity[0]) - 0.1;
      screen.css('background-color', 'rgba(113,113,113,' + newOpacity + ')');
    }
  }

 


  
</script>