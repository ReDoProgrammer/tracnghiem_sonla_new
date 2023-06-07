
    <div id="whole-page">
        <div id="page-header"></div>
        <div id="page-content">
            <div id="module10" class="ModuleWrapper">
                <div class="content-frame">
                    <div class="columns-widget columns9-3 container">
                        <div class="row">
                            <div class="col-left col-xs-12 col-md-9 col-sm-8">
                                <div id="module11" class="ModuleWrapper">
                                    <div class="pathway-category">
                                        <ol class="breadcrumb clearfix" itemprop="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
                                            <li class="first-item" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Trang chủ" itemprop="item">Trang chủ</a> </li>
                                            <li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Chi tiết câu hỏi" itemprop="item">Gửu ban biên tập MTTQ</a>
                                                <meta itemprop="position" content="1" /> </li>
                                        </ol>
                                    </div>
                                </div>
                                <div id="module17" class="ModuleWrapper" moduleRootId="1636191">
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
<p>Để thuận tiện cho việc chuyển tải thông tin: </p>
<p>Bạn nhớ ghi tên, địa chỉ email, điện thoại để chúng tôi có thể liên lạc nếu cần thêm thông tin.</p>

<p>Nếu bạn gặp khó khăn gì xin hãy email cho ubmattratq@sonla.gov.vn.</p>

<p>Nếu có thắc mắc hãy tìm hiểu trong phần <a href="index.php?module=hoidap&act=list">Hỏi/Đáp</a></p>

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
<span class="title">GỬI BÀI CHO BAN BIÊN TẬP</span>
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
<input class="form-control" type="text" placeholder="Nhập họ tên" name="ho_ten" value="<?php echo $_SESSION['ten'];?>" />
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
Tiêu đề bài viết
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<input class="form-control" type="text" placeholder="Nhập tiêu đề câu hỏi" name="tieu_de" value="<?php echo $_SESSION['tieude'];?>"/ >
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Mô tả bài viết
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<textarea class="form-control" placeholder="Nhập nội dung mô tả" name="mo_ta" rows="3"><?php echo $_SESSION['nt'];?></textarea>
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
Nội dung bài viết
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
<textarea class="form-control" placeholder="Nhập nội dung" name="noi_dung" rows="15"><?php echo $_SESSION['noidung'];?></textarea>
</div>
</div>

<div class="form-group row row-ex">
<label class="col col-ex col-sm-3 col-form-label">
File đính kém
<span class="text-danger">*</span>
</label>
<div class="col col-ex col-sm-9">
  <input id="xFilePath" name="files" type="text" size="60" value="" />
		    <input type="button" value="Chọn file" onclick="BrowseServer();" />
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
                                                                <button type="submit" class="btn btn-sendcontact mt-10 mb-10">Gửi bài viết</button>
                                                            </div>
                                                        </div>


</form>





</div>
</div>
</div>

										  
										
										  
										  
										  
                                       
                                    </div>
                                   
                                </div>
                            </div>
							
							
                         <script type="text/javascript">
	function validate(theform)
		{
	    	if(theform.ho_ten.value=="")
			{
			alert("Vui lòng nhập họ tên người gửu");
			theform.ho_ten.focus();
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
            
             else if(theform.tieu_de.value=="")
			{
			alert("Nhập tiêu đề câu hỏi");
			theform.tieu_de.focus();
			return false;
			}  
            
             else if(theform.mo_ta.value=="")
			{
			alert("Vui lòng nhập nội dung câu hỏi");
			theform.mo_ta.focus();
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

<script type="text/javascript">

function BrowseServer()
{
	// You can use the "CKFinder" class to render CKFinder in a page:
	var finder = new CKFinder();
	finder.basePath = './view/javascript/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
	finder.selectActionFunction = SetFileField;
	finder.popup();

	// It can also be done in a single line, calling the "static"
	// popup( basePath, width, height, selectFunction ) function:
	// CKFinder.popup( '../', null, null, SetFileField ) ;
	//
	// The "popup" function can also accept an object as the only argument.
	// CKFinder.popup( { basePath : '../', selectActionFunction : SetFileField } ) ;
}

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
}

 </script>
					