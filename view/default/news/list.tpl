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
                                                        <li class="first-item"> <a href="index.php?module=home" title="Trang chủ"><i class="fas fa-home"></i> Trang chủ</a> </li>
                                                        <li class="last-item" typeof="v:Breadcrumb">
                                                            <a href="/hcc0010/tin-tuc" title="Tin tức"><?php echo $tendanhmuc['title'];?></a>
                                                            <meta itemprop="position" content="1"> </li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div id="module31" class="ModuleWrapper" modulerootid="1628194">
                                                <section id="section31" class="section-list Article-Detail-default">
												
													   <?php foreach($list_theodanhmuc as $news) { ?>
                                                    <article data-id="5b277d8ce138233c8d7b4305" class="item-block detailType2 Article-News">
                                                        <div class="post-item row clearfix">
														
														<?php if($news['hinh_anh']){?>
                                                            <div class="col-xs-12 col-sm-5 col-md-4 left-type2-p">
                                                                <figure class="post-image">
                                                                    <div class="mask"></div>
                                                                    <a href="index.php?module=news&act=view&id=<?php echo $news['id_news']; ?>" title="<?php echo $news['tieu_de'];?>"> <img class="post-image relative-height" data-size-ratio="3:2" src="<?php echo $news['hinh_anh'];?>" data-original="<?php echo $news['hinh_anh'];?>" alt="<?php echo $news['tieu_de'];?>" style="height: 138px;">
                                                                    </a>
                                                                </figure>
                                                            </div>
															<?php } ?>
															
                                                            <div class="col-xs-12 col-sm-7 col-md-8 right-type2-p">
                                                                <div class="post-title">
                                                                    <h4 class="entry-title"><a href="index.php?module=news&act=view&id=<?php echo $news['id_news']; ?>"><?php echo $news['tieu_de'];?></a></h4>
                                                                </div>
                                                                <div class="post-meta post-meta-top mb-10 clearfix"> <span class="vcard author post-author"><i class="fa fa-user"></i> <span class="fn"><a href="">Administrator</a></span></span> <span class="date"><i class="far fa-clock"></i> <time class="post-date updated" datetime="2018-06-15T15:05:00+07:00"><?php echo date_format(date_create($news['time']),'d/m/Y');?></time></span> </div>
                                                                <div class="post-content mb-10"><?php echo $news['mo_ta'];?></div>
                                                                <div class="post-meta post-meta-bottom clearfix">
                                                                    <div class="post-links pull-right"><i class="fa fa-caret-right"></i> <a href="index.php?module=news&act=view&id=<?php echo $news['id_news']; ?>" class="post-more">Đọc thêm</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </article>
                                                  <?php } ?>
                                                 
                                                 
                                                   
                                                    <div class="clearfix"></div>
                                                    <div id="pagination31" class="default-pagination" style="text-align: center; display: none;"></div>
                                                </section>
                                            </div>
                                        </div>
                                     
									 
									 
									 
									 
                 
                   
                 
                   
              
                 
            
    
 



