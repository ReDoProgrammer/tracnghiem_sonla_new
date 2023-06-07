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
                                            <li class="" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="/gioi-thieu" title="Giới thiệu" itemprop="item">Lịch công tác</a>
                                                <meta itemprop="position" content="1" /> </li>
                                            <li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="<?php echo $lct['tieu_de'];?>" itemprop="item"><?php echo $lct['tieu_de'];?></a>
                                                <meta itemprop="position" content="2" /> </li>
                                        </ol>
                                    </div>
                                </div>
                                <div id="module17" class="ModuleWrapper">
                                    <div class="widget-space" style="height:10px" class="clearfix"></div>
                                </div>
                                <div id="module18" class="ModuleWrapper" moduleRootId="1636187">
                                    <section id="section18" class="intro-type1">
                                        <article id="article18" class="intro-content">

                                            <div class="post-content" itemprop="description">
                                             
											 
											   <?php echo $lct['noi_dung'];?>
											 
                                            </div>
											<div style="padding-bottom: 10px;">
  <b>File đính kèm:</b> 
  <?php if($lct['file']){?>
  <a href="<?php echo $lct['file'];?>">Tải tại đây</a>
  <?php } ?> 

  </div>

                                        </article>
                                        <ul class="share-social hidden-print mb-15">
                                            <li>Chia sẻ:</li>
                                            <li>
                                                <a class="btn_facebook" href="" title="Chia sẻ bài viết lên facebook"><img alt="Chia sẻ bài viết lên facebook" src="view/theme/default/image/f.jpg">
                                                </a>
                                            </li>
                                            <li>
                                                <a class="btn_twitter" rel="nofollow" href="" data-title="Chức năng, nhiệm vụ" title="Chia sẻ bài viết lên twitter"><img alt="Chia sẻ bài viết lên twitter" src="view/theme/default/image/t.jpg">
                                                </a>
                                            </li>
                                            <li class="khoangcach">|</li>
                                            <li>
                                                <a href="javascript:void(0);" onclick="$('#article18').printArea()" title="In" rel="nofollow"><img src="view/theme/default/image/print.jpg" alt="">&nbsp;In bài viết</a>
                                            </li>
                                        </ul>
                                    </section>
									
									 <div class="panel panel-default frame564175037f8b9a474e8b4567 frameOption0957bb710c frame-general frame-involve" id="frameBoundB5b6d11dd587650">
                                    <div class="panel-heading">
                                        <div class="panel-title">Bài viết khác</div>
                                    </div>
                                    <div class="panel-body">
                                        <div id="module18" class="ModuleWrapper" moduleRootId="2">
                                            <section id="section18" class="section-list Article-News-Detail-default">
                                             <?php foreach($list_lct as $news) { ?>
												<article class="list-news-one" itemscope itemtype="http://schema.org/NewsArticle">
                                                    <h2 class="h4 title" itemprop="headline"><a href="index.php?module=lct&act=view&id=<?php echo $news['id_lich'];?>" title="<?php echo $news['tieu_de'];?>"><?php echo $news['tieu_de'];?></a><span class="date"><time class="post-date updated" datetime="2018-08-07T17:23:00+07:00" style="font-size: 12px; color: red;">&nbsp(<?php echo date_format(date_create($news['time']),'d/m/Y');?>)</time></span></h2>

                                                </article>
                                              <?php } ?>
                                                <div class="clearfix"></div>
                                                <div id="pagination18" class="default-pagination" style="text-align:center"></div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
									
									
                                </div>
                            </div>