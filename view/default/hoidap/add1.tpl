<div class="row row-ex body">



<div class="col col-ex col-sm-9 col-12 pr-0 col-9">
<div class="container-fluid container-fluid-ex">

<div data-src="wow">

<div class="row row-ex">
<div class="col col-ex p-0">






<div class="card card-box list-news-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/icon-hoi.png">
</span>
<span class="title">Lời nói đầu</span>
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
<p class="h">Quý bạn đọc thân mến!</p>
<p>Để thuận tiện cho việc chuyển thư phản ánh đề nghị bạn đọc: </p>


<p class="the-end"> Xin cảm ơn sự tin cậy và hợp tác của bạn đọc! </p>
</div>
</div>
</div>
</div>












<div class="card card-box list-news-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/icon-hoi.png">
</span>
<span class="title">Hỏi đáp trực tuyến</span>
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

<form id="ask-form" class="search-form fqa" style="" method="post" enctype="multipart/form-data" onsubmit="return validate(this);">
<div id="alert-result" class="alert alert-info w-100" style="display: none;" role="alert">Gửi góp ý thành công</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-fullname">
Họ và tên
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input id="txt-fullname" class="form-control" type="text" required="" placeholder="Nhập họ tên" name="owner">
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-address">
Địa chỉ
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input id="txt-address" class="form-control" type="text" required="" placeholder="Nhập địa chỉ" name="address">
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-phone">
Điện thoại
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input id="txt-phone" class="form-control" type="text" required="" placeholder="Nhập điện thoại" name="phone">
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-email">Email</label>
<div class="col col-ex col-sm-9">
<input id="txt-email" class="form-control" type="text" placeholder="Nhập thư điện tử" name="email">
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-subject">
Tiêu đề câu hỏi
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input id="txt-subject" class="form-control" type="text" required="" placeholder="Nhập tiêu đề câu hỏi" name="subject">
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="cbb-category">
Chuyên mục
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<select id="cbb-category" class="form-control" name="category">
<option value="5acc67af52568943f4f8963b">Kinh doanh</option>
<option value="5abc585e5256893d9f8da611">Khiếu nại - Tố cáo</option>
<option value="5abc58595256893d9f8da610">Đất đai</option>
<option value="5abc58525256893d9f8da60f">Thuế</option>
<option value="5abc584a5256893d9f8da60e">Hôn nhân - Gia đình</option>
<option value="5abc583e5256893d9f8da60d">Thủ tục hành chính</option>
<option value="5abc58345256893d9f8da60c">Tư vấn pháp luật</option>
<option value="5a5c05295256895adeaa3c3f">Luật lao động</option>
</select>
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label" for="txt-question">
Nội dung câu hỏi
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<textarea id="txt-question" class="form-control" required="" placeholder="Nhập nội dung câu hỏi" name="question" rows="3"></textarea>
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
<button class="btn btn-success" type="submit" onclick="$('#form').submit();">Gửu câu hỏi</button>
</div>
</div>
</form>
<script id="fqa-option-item-tpl" type="text/html">

    <option value="{uuid}" {selected}>{name}</option>
</script>
<script id="fqa-item-tpl" type="text/html">

    <div class="item" role="tablist" id="{uuid}">
        <h4 class="title">
            <a data-toggle="collapse" data-parent="#fqa-accordion" href="#collapse-{uuid}" role="button" aria-expanded="false" aria-controls="{uuid}">
                {subject}
            </a>
        </h4>
        <div class="media">
            <div class="media-body">
                <p class="" style="margin-bottom:5px">{question}</p>
                <p style="color:#666;margin-top: 20px;text-align: right">Người gửi: {owner}</p>
                <p style="color:#666; text-align: right; ">Ngày gửi: {created}</p>
            </div>
        </div>
        <div id="collapse-{uuid}" class="collapse" role="tabpanel" aria-labelledby="{uuid}" data-parent="#fqa-accordion">
            <div class="card">
                <div class="card-body">{answer}</div>
            </div>
        </div>
    </div>
</script>
<script type="text/javascript">

    $(function () {
      var itemTplId = 'fqa-item-tpl';
      var listEl = $('#fqa-accordion');
      var searchForm = $('#search-form');
      var askForm = $('#ask-form');
      var btnAsk = $('#btn-submit-question');

      var itemId = '';
      if (itemId !== '')
        loadItem({fqa: itemId});
      else
        search(searchForm.serializeArray());

      btnAsk.click(function () {
        searchForm.hide();
        askForm.show();
      });

      listEl.on('click', '[aria-controls]', function () {
        var thisEl = $(this);
        var parentEl = thisEl.closest('.item');
        iPortal.loadFqaItem({fqa: thisEl.attr('aria-controls')}, function (result) {
          if (result.type !== 'ERROR')
            parentEl.find('.card-body').html(result.answer || '');
        });
      });

      // iPortal.listFqaCate({group: 'GROUP_FQA'}, function (results) {
      //   var cateSelectEl = $('[name="category"]');
      //   (results.items || []).forEach(function (cate) {
      //     cate.selected = cate.uuid === '' ? 'selected' : '';
      //     cateSelectEl.append(iNet.Template.parse('fqa-option-item-tpl', cate));
      //   });
      // });

      function search(params) {
        var data = params;
        if (params instanceof Array) {
          params.forEach(function (param) {
            data[param.name] = param.value;
          });
        }
        data.category = '';
        iPortal.listFQA(data, function (results) {
          var items = results.items || [];
          var html = '';
          items.forEach(function (item) {
            item.created = new Date(item.created).format('H:i d/m/Y');
            html += iNet.Template.parse(itemTplId, item);
          });
          listEl.html(html);
          $('.collapse').collapse();
          listEl.find('.item:first a[data-toggle]').click();
          // set global data => total record
          window.totalRecord = results.total || 0;
          iPortal.paging('pagination');
        });
      }

      function loadItem(params) {
        iPortal.loadFqaItem(params || {}, function (result) {
          if (result.type !== 'ERROR') {
            var html = '';
            result.created = new Date(result.created).format('H:i d/m/Y');
            html += iNet.Template.parse(itemTplId, result);
            listEl.html(html);
            listEl.find('.item:first a[data-toggle]').click();
          }
        });
      }
    });

    function backList() {
      location.reload();
    }

    
    function submitQuestion() {
      var askForm = $('#ask-form');
      var alertEl = $('#alert-result');
      $.post(iPortal.getUrl('cmsfaq/create'), askForm.serializeArray(), function(result) {
        if (result.type !== 'ERROR') {
          alertEl.text('Gửi góp ý thành công').show();
          setTimeout(function () {
            askForm[0].reset();
            alertEl.hide();
          }, 2000);
        } else {
          alertEl.text('Gửi góp ý xảy ra lỗi').show();
          setTimeout(function () {
            alertEl.hide();
          }, 5000);
        }
      }, 'json');
    }

    function beforeSubmit(form) {
      form.pageNumber.value = 0;
    }
</script>
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