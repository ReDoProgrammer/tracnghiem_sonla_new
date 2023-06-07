
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
                                            <li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Tin tức" itemprop="item">Lịch Công Tác</a>
                                                <meta itemprop="position" content="1" /> </li>
												<li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Tin tức" itemprop="item"><?php echo $tendanhmuc['title'];?></a>
                                                <meta itemprop="position" content="1" /> </li>
                                        </ol>
                                    </div>
                                </div>
                                <div id="module17" class="ModuleWrapper" moduleRootId="1636191">
                                    <div class="listNewsType1 Article-News">
                                     
										  <?php foreach($list_lct as $lct) { ?>
                                        <article itemscope itemtype="http://schema.org/NewsArticle" data-id="17" class="item-block listNewSmall">
                                            <div class="post-item row">
<?php if($lct['hinh_anh']){?>
                                                <div class="col-xs-12 col-sm-4 col-md-3">
                                                    <figure class="post-image"> <a href="index.php?module=lct&act=view&id=<?php echo $lct['id_lich']; ?>" title="<?php echo $lct['tieu_de'];?>"><img class="post-image relative-height lazy" data-size-ratio="16:9" src="<?php echo $lct['hinh_anh'];?>" data-original="<?php echo $lct['hinh_anh'];?>" alt="<?php echo $lct['tieu_de'];?>" itemprop="image"></a>
                                                    </figure>
                                                </div>
<?php } ?>
                                                <div class="col-xs-12 col-sm-8 col-md-9">
                                                    <div class="post-title">
                                                        <h4 class="entry-title" itemprop="headline"><a href="index.php?module=lct&act=view&id=<?php echo $lct['id_lich']; ?>"><?php echo $lct['tieu_de'];?></a><span class="date"><time class="post-date updated" datetime="2018-08-07T17:23:00+07:00" style="font-size: 12px;">&nbsp(<?php echo date_format(date_create($lct['time']),'d/m/Y');?>)</time></span></h4> </div>
                                                    <div class="post-content" itemprop="description"><?php echo $lct['mo_ta'];?></div>
                                                </div>
                                            </div>
                                        </article>
                                    <?php } ?>
                                       <!-- <div id="pagination17" class="default-pagination" style="text-align:center"></div>-->
	<div class="default-pagination" style="text-align:center"><?php echo $pagination; ?></div> 
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
                            </div>
                         
					