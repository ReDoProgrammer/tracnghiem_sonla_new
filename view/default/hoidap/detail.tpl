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
                                                            <a href="index.php?module=hoidap&act=view" title="">Danh sách câu hỏi</a>
                                                            <meta itemprop="position" content="1"> </li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div id="module31" class="ModuleWrapper" modulerootid="1628195">
                                                <section id="section31" class="intro-type1">
                                                    <article id="article31" class="intro-content">

                                                        <div class="post-content">
                                  
								  
								  
								       <div class="listNewsType1 Article-News">
                                      
										  
										  
										   <div class="admission-faq-list-content">
                                                                <ul class="list-items">
                                                                    <li class="item">
                                                                        <div class="item-inner">
                                                                            <div class="title"><span class="tit-label text-bold">Câu hỏi:</span><a class="title-faq" href="javascript:;" title="<?php echo $hoidap['title'];?>"> <?php echo $hoidap['title'];?></a>
                                                                            </div>
                                                                            <div class="content"><span class="text-bold">Nội dung: </span>
                                                                                <p><?php echo $hoidap['noi_dung'];?></p>
                                                                            </div>
                                                                            <div class="clearfix">
                                                                               <!-- <div class="support pull-right" style="margin-top:6px;"><a class="btn btn-sm btn-info" onclick="chatSupporter('590af09357b6fb656d16a955');"><i class="fa fa-commenting-o" style="margin-right:6px;"></i>Chat với support</a>
                                                                                </div>-->
                                                                                <div class="fullname"><b>Người gửi</b>: <span><?php echo $hoidap['author'];?></span>
                                                                                </div>
                                                                                <div class="address"><b>Địa chỉ</b>: <span><?php echo $hoidap['dia_chi'];?></span>
                                                                                </div>
                                                                                <div class="time"><span class="createdTime">Ngày gửi: <?php echo $hoidap['time'];?></span><span class="lastUpdateTime"> - Ngày trả lời: <?php echo $hoidap['edit_time'];?></span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li class="item answer">
                                                                        <div class="title"><span class="tit-label text-bold">Trả lời:</span><a class="title-answer-faq" href="javascript:;" title="Quản trị viên"> Quản trị viên</a>
                                                                        </div>
                                                                        <div class="answer-content">
                                                                            <div class="answer-content-tit">Nội dung trả lời</div>
                                                                            <div class="answer-content-desc">
                                                                                <p class="fon33 mt1 sapo" style="text-align:justify;"><span style=""><strong><?php echo $hoidap['tra_loi'];?></strong></span>
                                                                                </p>
                                                                            
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
										  
										  
										  
										  
                                        <!--<div id="pagination17" class="default-pagination" style="text-align:center"></div>-->
                                    </div>
                                    <style>
                                        .listNewsType1 {
                                            margin-bottom: 30px;
                                        }
                                        
                                        .listNewsType1 .listNewBig {
                                            border-top: 1px solid #eaeaea;
                                            padding-bottom: 22px;
                                            padding-top: 22px;
                                        }
                                        
                                        .listNewsType1 .listNewBig .post-title .entry-title {
                                            margin-top: 0;
                                            margin-bottom: 0;
                                        }
                                        
                                        .listNewsType1 .listNewBig .post-title .entry-title a {
                                            font-size: var(--font-size-base);
                                            font-weight: bold;
                                            text-transform: uppercase;
                                            color: #262626;
                                        }
                                        
                                        .listNewsType1 .listNewBig .date {
                                            font-size: 12px;
                                            color: #999999;
                                        }
                                        
                                        .listNewsType1 .listNewBig .post-content {
                                            font-size: var(--font-size-base);
                                            color: #626262;
                                            padding-top: 10px;
                                        }
                                        
                                        .listNewsType1 .listNewBig .hasViewMore {
                                            color: #262626;
                                            text-decoration: none;
                                            font-size: 12px;
                                            margin-top: 15px;
                                            font-weight: bold;
                                            padding-right: 15px;
                                            position: relative;
                                            display: inline-block;
                                        }
                                        
                                        .listNewsType1 .listNewBig .hasViewMore:hover {
                                            text-decoration: none;
                                        }
                                        
                                        .listNewsType1 .listNewBig .hasViewMore:after {
                                            content: "";
                                            position: absolute;
                                            top: 4px;
                                            right: 0;
                                            width: 8px;
                                            height: 8px;
                                            background: url("/App/Corporate/images/News/viewmorearrow.png") top left no-repeat;
                                        }
                                        
                                        .listNewsType1 .listNewSmall {
                                            border-top: 1px solid #eaeaea;
                                            padding-bottom: 22px;
                                            padding-top: 22px;
                                        }
                                        
                                        .listNewsType1 .listNewSmall .post-title .entry-title {
                                            margin-top: 0;
                                            margin-bottom: 0;
                                        }
                                        
                                        .listNewsType1 .listNewSmall .post-title .entry-title a {
                                            font-size: var(--font-size-base);
                                            font-weight: bold;
                                            color: #262626;
                                        }
                                        
                                        .listNewsType1 .listNewSmall .date {
                                            font-size: ceil(var(--font-size-base) * 0.85);
                                            color: #999999;
                                        }
                                        
                                        .listNewsType1 .listNewSmall .post-content {
                                            font-size: var(--font-size-base);
                                            color: #626262;
                                            padding-top: 10px;
                                        }
                                    </style>
								  
								  
								  
								  
								  
								  
								  
								  
								  
								  
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
                                      