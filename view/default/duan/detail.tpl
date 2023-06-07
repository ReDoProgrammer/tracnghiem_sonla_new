<div class="row row-ex body">
<div class="col col-ex col-sm-9 col-12 pr-0 col-9">
<div class="container-fluid container-fluid-ex">

<div data-src="wow">
<style type="text/css">

    .plyr--audio {
        width: 200px;
        float: left;
    }

    .plyr--audio .plyr__controls {
        padding: 1px;
    }

    .plyr--audio .plyr__controls .plyr__progress {
        margin-left: 5px;
    }

    .plyr__controls button {
        padding: 4px;
    }

    .plyr__controls button svg {
        width: 10px;
        height: 10px;
    }

    .plyr__time {
        font-size: 10px;
    }

    .plyr__progress--buffer, .plyr__progress--played, .plyr__volume--display {
        height: 3px;
        margin-top: -1px;
    }

    .plyr .plyr__volume {
        max-width: 35px;
    }

    .plyr input[type=range] {
        height: 3px;
    }

    .plyr input[type=range]::-webkit-slider-thumb {
        height: 10px;
        width: 10px;
        margin-top: -1px;
    }

    .plyr input[type=range]::-moz-range-thumb {
        height: 10px;
        width: 10px;
    }

    .plyr input[type=range]::-ms-thumb {
        height: 10px;
        width: 10px;
    }

    .plyr__tooltip {
        font-size: 10px;
    }

    .rating {
        position: absolute;
        right: 0;
    }

    .rating i {
        cursor: pointer;
    }

    .rating i.full,
    .rating i.half {
        color: #edb007;
    }

    .item-involve {
        font-weight: 600;
        font-size: 12px;
    }

    .item-involve a {
        color: #444444;
    }

    .item.content {
        background-color: rgba(113, 113, 113, 0);
    }
</style>
<div class="row row-ex">
<div class="col col-ex p-0">
<div class="card card-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/icon_cts.png">
</span>
<span class="title">Chi tiết dự án</span>
</div>


 <div class="card-body p-2">
                <div class="row row-ex">
                    <div class="col col-ex">
                        <div class="item content" id="detail-item">
                            <h4 class="title"><?php echo $duan['tieu_de'];?> </h4>
                            <div class="item-info">
                                <div class="row row-ex">
                                    <div class="col col-ex col-4">
                                        <span class="time" data-time="1568975456347"><?php echo date_format(date_create($duan['time']),'d.m.Y');?></span>
                                    </div>
                                    <div class="col col-ex col-8">
                                        <div class="float-right">
                                            <audio id="audio-player" controls="" style="display:none">
                                                <source src="" type="audio/mp3">
                                            </audio>
                                            <a href="javascript:;" onclick="read(this)">
                                                <i class="fa fa-volume-up"></i>
                                                Đọc bài viết
                                            </a> 
                                            <a href="javascript:window.open('',
                                            '_blank');">
                                            <i class="fa fa-print"></i>
                                            In bài
                                            </a> 
                                    

                                            <a href="javascript:screenPlus();">
                                                <i class="fa fa-sun"></i><sup>-</sup>

                                            </a> 
                                            <a href="javascript:screenMinus();">
                                                <i class="fa fa-sun"></i><sup>+</sup>
                                            </a> 

                                            <button onclick="fontMinus()">
                                                <b>A</b><sup>-</sup>
                                            </button>
                                             
                                            <button onclick="fontPlus()"><b>A</b><sup>+</sup>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--<div class="brief">UBND tỉnh vừa ban hành Quyết định công bố mở Cảng cá Ban Quản lý Cảng cá Lộc An là Cảng loại II, bắt đầu hoạt động từ ngày 15/9/2019.</div>-->
                            <div class="row row-ex item-box">
                                

                            </div>
                            <div class="content">
							<p data-mce-style="text-align: justify;" style="text-align: justify;">
<strong>
  <?php echo $duan['mo_ta'];?>
</strong>
</p>
<h3 class="tab_project">Chi tiết dự án</h3>

							<p style="text-align: justify;" data-mce-style="text-align: justify;">
							
							  <?php echo $duan['noi_dung'];?>
							</p>
							
							<div style="padding-top: 10px;">
<p>

  <?php if($duan['file']){?>
  <b>File đính kèm:</b> 
  <a href="<?php echo $duan['file'];?>">Tải tại đây</a>
  <?php } ?> 
 </p>
 
 <h3 class="tab_project">Thông tin dự án</h3>

							<p style="text-align: justify;" data-mce-style="text-align: justify;">
							
							  <?php echo $duan['thong_tin'];?>
							</p>
  </div>
							</div>
                       
					   </div>
                    </div>
                </div>
                <div class="row row-ex">
                    <div class="col col-ex">
                        <div class="border-top pt-2">
                            <div class="row row-ex">
                                <div class="col-ex col-4">
                                    <div class="fb-share-button"
                                         data-href=''
                                         data-layout="button"
                                         data-size="large" data-mobile-iframe="true"></div>
                                    <div class="g-plus" data-action="share" data-annotation="bubble"
                                         data-height="24"></div>
                                </div>
                                <div class="col-ex col-4"></div>
                                <label class="col-ex col-2 text-right">Đánh giá:</label>
                                <div class="col-ex col-2">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <div id="item-rating" class="rating col-ex col-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>













</div>


</div></div>











<div class="card card-box list-news-box">
                                <div class="card-header">
                                    <span><img src='view/theme/default/image/word.png'></span>
                                    <span class="title">Các Dự Án Khác</span>
                                </div>
                                <div class="card-body">
                                    <div  data-src="wow">

<style>
    .col-ex.col-9 {
        max-width: 100%;
		max-height: 30%;
        flex: 100%;
        padding-right: 13px!important;
    }
</style>

 
 <div class="related-content">
<div class="row cat-content">
<?php foreach ($list_duan as $duan) { ?> 
<div class="col-xs-3 col-md-3 text-center">
<div class="thumbnail cw-item">
<a href="index.php?module=duan&act=view&id=<?php echo $duan['duan'];?>">
<div class="img-news">
<img title="<?php echo $duan['tieu_de'];?>" src="<?php echo $duan['hinh_anh'];?>" height="">
<div class="play-icon"></div>
</div>

</a>
<div class="cwi-caption">
<h2 class="cwi-title">
<a href="index.php?module=duan&act=view&id=<?php echo $duan['duan'];?>"><?php echo $duan['tieu_de'];?></a>
</h2>
<p class="cwi-download">
<i class="fa fa-download"></i>
<label><?php echo $duan['luot_xem_id'];?></label>
lượt Xem
</p>
</div>
</div>
</div>

<?php } ?>



 </div>
 
 
 
 
 
 
 
 </div>

</div>





                                    <div  data-src="wow">
<style>
    .pagination .paging {
        padding-left: 30px;
    }
</style>



</div>
                                </div>
                            </div>













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

 

  function sendEmail() {
    var itemLink = location.origin + '/sphere/baria/vungtau/page/xem-tin.cpx?uuid=5d88284d1bd20b4c4e0cbbb5';
    var params = {
      subject: 'Xem tin: Bí thư Tỉnh ủy làm việc với Huyện ủy Châu Đức: Tập trung đầu tư phát triển nông nghiệp công nghệ cao, bền vững',
      content: 'Chiều 20/9, ông Nguyễn Hồng Lĩnh, Ủy viên Trung ương Đảng, Bí thư Tỉnh ủy, Chủ tịch HĐND tỉnh đã chủ trì buổi làm việc với Ban Thường vụ Huyện ủy Châu Đức về đánh giá sơ bộ kết quả thực hiện Nghị quyết Đại hội Đảng bộ huyện Châu Đức nhiệm kỳ 2015-2020. ' + '<br> Xem thêm tại:' + '<a href="' + itemLink + '">' + itemLink + '</a>',
      captcha: $('#text-captcha').val(),
      receiver: $('#text-receiver').val()
    };
    $.post('/sphere/smartcloud/mail/marketing.cpx', params, function (result) {
      if (result.uuid === 'SUCESS')
        $('#send-email-modal').modal('hide');
      else
        $('#mail-error').show();
    });
  }



  
</script>