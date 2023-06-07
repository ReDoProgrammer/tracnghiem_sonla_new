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
                                            <li class="first-item" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="index.php?module=home" title="Trang chủ" itemprop="item">Trang chủ</a> </li>
                                        </ol>
                                    </div>
                                </div>
                                <div id="module17" class="ModuleWrapper" moduleRootId="1636191">
                                    <article id="article17" class="news-detail-layout-type-2 mb-20" itemscope itemtype="http://schema.org/NewsArticle">
                                        <meta itemprop="datePublished" content="2018-08-07T17:23:45+07:00" />
                                        <header class="clearfix"> <span class="post-date left"> <?php echo date_format(date_create($tintuc_detail['time']),'H:i:s | d/m/Y');?> </span>
                                            <div class="block_share pull-right"> <a href="javascript:void(0);" class="custom-font" onclick="fontCustom('small');" style="font-size:12px;">A<sup>-</sup></a> <a href="javascript:void(0);" class="custom-font" onclick="fontCustom('medium');">A</a> <a href="javascript:void(0);" class="custom-font" onclick="fontCustom('large');" style="font-size:16px;">A<sup>+</sup></a> <span class="drash"> | </span>
                                                <a href="javascript:void(0);" onclick="printArticle('5b6bb91d92186525bc21bd9c');" title="In" rel="nofollow"><img src="view/theme/default/image/icon_print.gif" alt="">
                                                </a>
                                                <a class="btn_email login_5 open-popup-link" rel="nofollow" href="#email-popup" id="email_content" title="Email" onclick="sendMail('5b6bb91d92186525bc21bd9c');"><img src="view/theme/default/image/icon_letter.gif" alt="">
                                                </a>
                                                <a class="hide" href="javascript:void(0);" id="tangtuongphan" title="Giảm tương phản"><img src="view/theme/default/image/nhat.png" alt="Tăng tương phản">
                                                </a>
                                                <a class="hide" href="javascript:void(0);" id="giamtuongphan" title="Tăng tương phản"><img src="view/theme/default/image/dam.png" alt="Giảm tương phản">
                                                </a>
                                            </div>
                                        </header>
                                        <div class="article-content">
                                            <div class="block-core-a3">
                                                <h1 class="title-detail" itemprop="headline"><?php echo $tintuc_detail['tieu_de'];?></h1>
                                                <div class="social-connect clearfix mb-15">
                                                    <div class="pull-left mt-5"> </div>
                                                    <div class="network-share pull-right" style="height:30px;line-height:10px;">
                                                        <div class="zalo-share-button" data-href="http://templatesotc.vhv.vn/tin-tuc/hoat-dong-san-xuat-cong-nghiep-thang-2-2018.html" data-oaid="579745863508352884" data-layout="1" data-color="blue" data-customize=false></div>
                                                        <div class="facebook" style="margin-right:5px;display:inline-block;">
                                                            <div class="fb-like data-href" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
                                                        </div> <a href="javascript:void(0);" style="margin-top:-10px;" class="btn btn-xs btn-primary" onclick="readArticle('5b6bb91d92186525bc21bd9c',$(this));">Đọc bài</a>
                                                        <a href="javascript:void(0);" style="margin-top:-10px;" class="btn btn-xs btn-info" onclick="VHV.alert('Bạn chưa đăng nhập hệ thống',{ type: 'error' })"><span class="icon fa fa-bookmark mr-5"></span><span class="text-mobile">Lưu</span></a>
                                                    </div>
                                                </div>
                                                <div class="brief font-size-text mb-10" style=" text-align: justify;">
                                                    <p><?php echo $tintuc_detail['mo_ta'];?></p>
                                                </div>
                                            </div>
                                            <div id="audio17">
                                                <audio></audio>
                                            </div>
                                            <div class="block-core-a5"  style="text-align: justify;">
                                                <div class="content-detail font-size-text mb-20" itemprop="articleBody">
                                                    
												<p>  <?php echo $tintuc_detail['noi_dung'];?></p>
                                          
												</div>
                                                <hr>
                                                <div class="clearfix mt-10"> </div>
                                            </div>
                                            <div class="rating mt-10 ">
                                                <div id="star-rating">
                                                    <div id="stringrating17">Tổng số điểm của bài viết là: <span class="totalStar">0</span> trong <span class="totalRating">0</span> đánh giá</div>
                                                    <div style="padding: 5px;">
                                                        <input class="hover-star" type="radio" value="1" title="bài viết rất kém" />
                                                        <input class="hover-star" type="radio" value="2" title="bài viết kém" />
                                                        <input class="hover-star" type="radio" value="3" title="bài viết đạt" />
                                                        <input class="hover-star" type="radio" value="4" title="bài viết tốt" />
                                                        <input class="hover-star" type="radio" value="5" title="bài viết rất tốt" /> <span id="rating-label17" style="margin: 0 0 0 20px;">Click để đánh giá bài viết</span> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <div class="modal fade" id="modal17" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div id="loadDetailLayout17" class="loadDetailLayout"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <style>
                                        .block_share > * {
                                            display: inline-block;
                                            vertical-align: middle;
                                        }
                                        
                                        .block_share >.custom-font {
                                            padding-top: 6px;
                                            padding: 6px 2px 0 2px;
                                        }
                                        
                                        .block_share >.drash {
                                            padding: 0 3px;
                                        }
                                        
                                        .videoWrapper {
                                            position: relative;
                                            padding-bottom: 56.25%;
                                            padding-top: 25px;
                                            height: 0;
                                        }
                                        
                                        .videoWrapper iframe,
                                        .videoWrapper object,
                                        .videoWrapper embed {
                                            position: absolute;
                                            top: 0;
                                            left: 0;
                                            width: 100%;
                                            height: 100%;
                                        }
                                        
                                        .news-detail-layout-type-2 {
                                            overflow: hidden;
                                        }
                                        
                                        .news-detail-layout-type-2 .brief {
                                            border-left: 2px solid #ccc;
                                            padding-left: 10px;
                                            color: #777;
                                        }
                                        
                                        .news-detail-layout-type-2 .post-date {
                                            color: #777;
                                            font-size: 12px;
                                        }
                                        
                                        .news-detail-layout-type-2 h1.title-detail {
                                            margin-top: 15px;
                                            font-size: 24px;
                                        }
                                        
                                        @media(max-width: 767px) {
                                            .news-detail-layout-type-2 .table-responsive {
                                                border: 0;
                                            }
                                        }
                                        
                                        .news-detail-layout-type-2 .relatedArticles ul.relatedArticles-list li .time-relatedArticles {
                                            color: #999;
                                            font-size: 12px;
                                            padding-left: 5px;
                                        }
                                        
                                        .news-detail-layout-type-2 ul.relatedArticles-list li {
                                            margin-bottom: 10px;
                                        }
                                        
                                        .news-detail-layout-type-2 a.print-items {
                                            background: url('/App/Corporate/images/News/print.gif') no-repeat left center;
                                            padding-left: 20px;
                                            margin-right: 10px;
                                        }
                                        
                                        .news-detail-layout-type-2 a.share-items {
                                            background: url('/App/Corporate/images/News/share.gif') no-repeat left center;
                                            padding-left: 20px;
                                        }
                                        
                                        .news-detail-layout-type-2 h1.title-detail {
                                            margin-top: 0;
                                            font-size: 24px;
                                        }
                                        
                                        .news-detail-layout-type-2 .relatedArticles .title-relatedArticles {
                                            background-color: transparent;
                                            border: none;
                                            background-image: url('/App/Corporate/images/News/bg-relatedArticles.jpg');
                                            background-repeat: repeat-x;
                                            background-position: left center;
                                            margin-bottom: 10px;
                                        }
                                        
                                        .news-detail-layout-type-2 .relatedArticles .title-relatedArticles span {
                                            display: inline-block;
                                            line-height: 30px;
                                            padding: 0 15px;
                                            padding-left: 0;
                                            background-color: #fff;
                                            font-family: "UTMBEBAS";
                                            font-size: 24px;
                                            text-transform: uppercase;
                                            color: var(--link-color);
                                        }
                                        
                                        .news-detail-layout-type-2 .list-relatedArticles {
                                            background: #f8f8f8;
                                            padding: 10px;
                                        }
                                        
                                        .news-detail-layout-type-2 .list-relatedArticles .title a {
                                            color: #0778b7;
                                            font-weight: bold;
                                        }
                                        
                                        .news-detail-layout-type-2 .social-connect .network-share {
                                            height: 25px;
                                        }
                                    </style>
                                </div>
                                <div class="panel panel-default frame564175037f8b9a474e8b4567 frameOption0957bb710c frame-general frame-involve" id="frameBoundB5b6d11dd587650">
                                    <div class="panel-heading">
                                        <div class="panel-title">Tin liên quan</div>
                                    </div>
                                    <div class="panel-body">
                                        <div id="module18" class="ModuleWrapper" moduleRootId="2">
                                            <section id="section18" class="section-list Article-News-Detail-default">
                                                <?php foreach($list_tinlienquan as $news) { ?>
												<article class="list-news-one" itemscope itemtype="http://schema.org/NewsArticle">
                                                    <h2 class="h4 title" itemprop="headline"><a href="index.php?module=news&act=view&id=<?php echo $news['id_news'];?>" title="<?php echo $news['tieu_de'];?>"><?php echo $news['tieu_de'];?></a></h2>

                                                </article>
                                              <?php } ?>
                                                <div class="clearfix"></div>
                                                <div id="pagination18" class="default-pagination" style="text-align:center"></div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
								
								                                <div class="panel panel-default frame564175037f8b9a474e8b4567 frameOption0957bb710c frame-general frame-involve" id="frameBoundB5b6d11dd587650">
                                    <div class="panel-heading">
                                        <div class="panel-title">Bài viết khác</div>
                                    </div>
                                    <div class="panel-body">
                                        <div id="module18" class="ModuleWrapper" moduleRootId="2">
                                            <section id="section18" class="section-list Article-News-Detail-default">
                                              <?php foreach($list_news as $news) { ?>
												<article class="list-news-one" itemscope itemtype="http://schema.org/NewsArticle">
                                                    <h2 class="h4 title" itemprop="headline"><a href="index.php?module=news&act=view&id=<?php echo $news['id_news'];?>" title="<?php echo $news['tieu_de'];?>"><?php echo $news['tieu_de'];?></a></h2>

                                                </article>
                                              <?php } ?>
                                                <div class="clearfix"></div>
                                                <div id="pagination18" class="default-pagination" style="text-align:center"></div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
								
								
                            </div>