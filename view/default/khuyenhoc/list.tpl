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
                                                        <li class="" typeof="v:Breadcrumb">
                                                            <a href="#" title="Tin tức">Thông báo</a>
                                                            <meta itemprop="position" content="1"> </li>
                                                      <!--  <li class="last-item" typeof="v:Breadcrumb">
                                                            <a href="#" title="Tin hoạt động trong tỉnh">Tin hoạt động trong tỉnh</a>
                                                            <meta itemprop="position" content="2"> </li>-->
                                                    </ol>
                                                </div>
                                            </div>
                                            <div id="module31" class="ModuleWrapper" modulerootid="1628194">
                                            
											
											   <div id="module17" class="ModuleWrapper" moduleRootId="1636191">
											   		
                                
								
								
								
							
    <section id="download-list-default18" class="download-list-default">
        <div class="">
            <ul class="down-list">
                  <?php foreach($list_thongbao as $thongbao) { ?>
			   <li class="">
                    <div class="inline-dowload-Type4">
                        <h5 class="title">
<img alt="" class="" width="32" height="32" src="view/theme/default/image/note.png"><a href="index.php?module=thongbao&act=view&id=<?php echo $thongbao['id_thongbao'];?>" title="<?php echo $thongbao['tieu_de'];?>"><?php echo $thongbao['tieu_de'];?></a>
</h5>
                        <div class="date-download">
                            <i class="far fa-clock"></i>
                            <time class="post-date updated" datetime="<?php echo date_format(date_create($thongbao['time']),'d/m/Y');?>"><?php echo date_format(date_create($thongbao['time']),'d/m/Y');?></time>
                            <span> | </span>

                            <i class="fa fa-user" aria-hidden="true"></i> Administrator
                            <span> | </span>

                            <i class="fa fa-download" aria-hidden="true"></i> <?php echo $thongbao['luot_xem'];?>
                            <span> | </span>

                            <i class="fa fa-paperclip" aria-hidden="true"></i> 1 file đính kèm
                        </div>

                        <div class="readMore-download"><a href="index.php?module=thongbao&act=view&id=<?php echo $thongbao['id_thongbao'];?>" title="<?php echo $thongbao['tieu_de'];?>">Xem chi tiết &gt;</a>
                        </div>
                    </div>
 
                </li>
				<?php } ?>
				
				
				
            </ul>
        </div>
    </section>
    <div class="clear-both"></div>

								
								
								
	                   <style>
                        .inline-dowload-Type4 .readMore-download {
                            text-align: right;
                        }
                        
                        .inline-dowload-Type4 .readMore-download a {
                            color: #0199ed;
                        }
                        
                        .inline-dowload-Type4 .content-download {
                            margin-top: 10px;
                        }
                        
                        .inline-dowload-Type4 {
                            padding: 10px;
                            border: 1px solid #eaeaea;
                            margin-bottom: 15px;
                            background: white;
                        }
                        
                        .inline-dowload-Type4 .title img {
                            display: inline-block;
                            margin-right: 10px;
                        }
                        
                        .inline-dowload-Type4 .title a {
                            display: inline-block;
                            width: calc(100% - 45px);
                            font-weight: bold;
                        }
                        
                        .inline-dowload-Type4 .date-download {
                            color: #999;
                            font-size: 13px;
                        }
                    </style>							
								
								
								
                                   
                                </div>
											
											
											
											
											
											
											
                                            </div>
                                         
                                        </div>
                                      