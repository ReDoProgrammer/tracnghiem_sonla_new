<div id="whole-page">
    <div id="page-header"></div>
    <div id="page-content">
        <div id="module14" class="ModuleWrapper">
            <div id="column1-14" class="column1 container ">
                <div class="foverlay"></div>
                <div class="columns-widget row">
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div id="module15" class="ModuleWrapper">
                            <div class="tab-trangtrong tab-center-home">
                                <div class="columns-widget columns9-3 ">
                                    <div class="row">
                                        <div class="col-left col-xs-12 col-md-9 col-sm-8">
                                            <div id="module30" class="ModuleWrapper">
                                                <div class="pathway-category">
                                                    <ol class="breadcrumb clearfix" itemprop="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
                                                        <li class="first-item"> <a href="" title="Trang chủ"><i class="fas fa-home"></i> Trang chủ</a> </li>
                                                        <li class="last-item" typeof="v:Breadcrumb">
                                                            <a href="index.php?module=hoidap&act=add" title="Hỏi đáp">Hỏi đáp</a>
                                                            <meta itemprop="position" content="1"> </li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div id="module31" class="ModuleWrapper" modulerootid="1628195">
                                                <section id="section31" class="intro-type1">
                                                    <article id="article31" class="intro-content">

                                                        <div class="post-content">
                                  
								  
								  
								   <div class="listNewsType1 Article-News">
                                      
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

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onsubmit="return validate(this);">
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Họ và tên
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input class="form-control" type="text" placeholder="Nhập họ tên" name="author" value="<?php echo $_SESSION['ten'];?>" />
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Địa chỉ
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input class="form-control" type="text" placeholder="Nhập địa chỉ" name="dia_chi" value="<?php echo $_SESSION['dc'];?>" />
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">Email</label>
<div class="col col-ex col-sm-9">
<input class="form-control" type="text" placeholder="Nhập thư điện tử" name="email" value="<?php echo $_SESSION['email'];?>" />
</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Điện thoại
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input class="form-control" type="text" placeholder="Nhập điện thoại" name="dien_thoai" value="<?php echo $_SESSION['dt'];?>"/ >
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Tiêu đề câu hỏi
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input class="form-control" type="text" placeholder="Nhập tiêu đề câu hỏi" name="title" value="<?php echo $_SESSION['tieude'];?>"/ >
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Nội dung câu hỏi
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<textarea class="form-control" placeholder="Nhập nội dung câu hỏi" name="noi_dung" rows="3"><?php echo $_SESSION['nd'];?></textarea>
</div>
</div>




<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Nội dung câu hỏi
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-3">
        <img style="padding-left: 20px;margin-bottom: 5px" src="system/maxacnhan/image.php" id="img-maxacnhan"
                                         alt=""
                                         onclick="$('#img-maxacnhan').attr('src', 'system/maxacnhan/image.php?rand=' + Math.random())"
                                            />
</div>
<div class="col col-ex col-sm-3">
                                    <div class="controls">
                                        <input type="text" class="input-large"
                                               name="captcha">
                                    </div>
</div>
</div>




<!--<div class="form-group row row-ex" style="margin-top:5px">
<label class="col col-ex col-sm-3 col-form-label"></label>
<div class="col col-ex col-sm-9">
<img id="img-captcha" src="<?php echo $captcha;?>">

</div>
</div>
<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Mã xác nhận
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input id="txt-captcha" class="form-control" type="text" placeholder="Nhập mã xác nhận" name="captcha">
<?php if($err['captcha']){?>
      <div class="error">  <?php echo $err['captcha'];?> </div>
      <?php }?>
</div>
</div>-->

 <div class="">
                                                            <div class="btn-submit-form text-right"> <i style="font-size:11px;">Dấu<span class="text-color-3"> * </span> là phần không được để trống</i>
                                                                <button type="submit" class="btn btn-sendcontact mt-10 mb-10">Gửi liên hệ</button>
                                                            </div>
                                                        </div>


</form>





</div>
</div>
</div>

										  
										
										  
										  
										  
                                       
                                    </div>
								  
								  
								  
								  
								  
								  
								  
								  
								  
								  
                                                        </div>
                                                        <ul class="share-social hidden-print mb-15">
                                                            <li>Chia sẻ:</li>
                                                            <li>
                                                                <a class="btn_facebook" href="" rel="noopener noreferrer" title="Chia sẻ bài viết lên facebook"><img alt="Chia sẻ bài viết lên facebook" src="view/theme/default/image/f.jpg">
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="btn_twitter" rel="nofollow noopener noreferrer" href="" data-title="Dịch vụ công" title="Chia sẻ bài viết lên twitter"><img alt="Chia sẻ bài viết lên twitter" src="view/theme/default/image/t.jpg">
                                                                </a>
                                                            </li>
                                                            <li class="khoangcach">|</li>
                                                            <li>
                                                                <a href="javascript:void(0);" onclick="$('#article31').printArea()" title="In" rel="nofollow"><img src="view/theme/default/image/print.jpg" alt="">&nbsp;In bài viết</a>
                                                            </li>
                                                        </ul>

                                                    </article>
                                                </section>
                                            </div>
                                        </div>
                                        <script type="text/javascript">
	function validate(theform)
		{
	    	if(theform.author.value=="")
			{
			alert("Vui lòng nhập họ tên người gửu");
			theform.author.focus();
			return false;
			}
            
            else if(theform.dia_chi.value=="")
			{
			alert("Vui lòng nhập địa chỉ");
			theform.dia_chi.focus();
			return false;
			}  
             
          
            else if(theform.email.value=="")
			{
			alert("Vui lòng nhập email");
			theform.email.focus();
			return false;
			}  
            else if(theform.email.value.indexOf('@',0)==-1 || theform.email.value.indexOf('.',0)==-1 || theform.email.value.indexOf(' ',0)!=-1){
			alert("Email không hợp lệ");
			theform.email.focus();
			return false;
	      	}
            
             else if(theform.title.value=="")
			{
			alert("Nhập tiêu đề câu hỏi");
			theform.title.focus();
			return false;
			}  
            
             else if(theform.noi_dung.value=="")
			{
			alert("Vui lòng nhập nội dung câu hỏi");
			theform.noi_dung.focus();
			return false;
			}  
           
          
      
      	return true;
		}
</script>   
					