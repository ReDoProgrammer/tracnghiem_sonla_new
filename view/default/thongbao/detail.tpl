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
                                                            <a href="/hcc0010/dich-vu-cong" title="Dịch vụ công">Giới thiệu</a>
                                                            <meta itemprop="position" content="1"> </li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div id="module31" class="ModuleWrapper" modulerootid="1628195">
                                                <section id="section31" class="intro-type1">
                                                  <article id="download18" class="download-detail-layout-default-type2">
    <h1 class=""> <?php echo $thongbao['tieu_de'];?></h1>
    <div class="time-news"><span class="time"><i class="fa far fa-calendar ico-download"></i> Ngày đăng: <span class="mau"><?php echo date_format(date_create($thongbao['time']),'d/m/Y');?> </span></span><span class="view"><i class="fa fa-eye ico-download"></i> <span class="mau"><?php echo $thongbao['luot_xem'];?> </span>lượt xem</span>
    </div>
	<p><?php echo $thongbao['noi_dung'];?></p>
	
	 <div style="padding-top: 10px;">
<?php if($ext == 'PDF' || $ext == 'pdf') { ?>
<iframe src = "view/javascript/ViewerJS/#<?php echo $thongbao['file'];?>" width='100%' height='850' allowfullscreen webkitallowfullscreen></iframe>
<?php } ?></div>
	
    <div class="block-core-a5">
        <div class="title-listfile">Danh sách file (1 files)</div>
        <div class="quot-list">
            <ul class="file-list list-group">
			  <?php if($thongbao['file']){?>
                <li class="list-group-item"> <a href="<?php echo $thongbao['file'];?>" class="btn btn-danger" title="" target="_blank"><i class="fa fa-download" aria-hidden="true"></i>Tải về</a><span class="ml-10">demo.zip</span> </li>
           <?php } ?> 
		   
		     <?php if($thongbao['link']){?>
                <li class="list-group-item"> <a href="<?php echo $thongbao['link'];?>" class="btn btn-danger" title="" target="_blank"><i class="fa fa-download" aria-hidden="true"></i>Tải về</a><span class="ml-10">demo.zip</span> </li>
           <?php } ?> 
		   
		 </ul>
        </div>
        <div class="block-core-a5"> </div>
        <div class="clearfix"> </div>
    </div>
</article>

 <style>
        .download-detail-layout-default-type2 {
            background: white;
        }
        
        .download-detail-layout-default-type2 h1 {
            margin-top: 20px;
            color: #0963cc;
            font-size: 18px;
            line-height: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .download-detail-layout-default-type2 .time-news span.time {
            margin-right: 10px;
        }
        
        .download-detail-layout-default-type2 .time-news i {
            color: #81b12e;
        }
        
        .download-detail-layout-default-type2 .time-news span.mau {
            color: #0963cc;
        }
        
        .download-detail-layout-default-type2 ul.list-group {
            padding: 0;
            margin: 0 0 10px 0;
            list-style-type: disc;
        }
        
        .download-detail-layout-default-type2 .title-listfile {
            display: inline-block;
            background: white;
            z-index: 2;
            position: relative;
            margin-bottom: 10px;
            margin-top: 20px;
        }
        
        .download-detail-layout-default-type2 .quot-list {
            margin-top: -20px;
        }
        
        .download-detail-layout-default-type2 .title-brief {
            font-weight: bold;
            margin-top: 30px;
        }
        
        .download-detail-layout-default-type2 .brief {
            border-left: 2px solid #ddd;
            padding: 10px;
            color: #555;
            font-style: italic;
            margin-bottom: 20px;
            margin-left: 18px;
        }
    </style>
                                                </section>
                                            </div>
                                        </div>
                                      