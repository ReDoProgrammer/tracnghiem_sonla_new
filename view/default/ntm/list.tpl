
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
                                            <li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Tin tức" itemprop="item">Dữ Liệu NTM</a>
                                                <meta itemprop="position" content="1" /> </li>
												<li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Tin tức" itemprop="item"><?php echo $danhmuc_detail['ten_dm'];?></a>
                                                <meta itemprop="position" content="1" /> </li>
                                        </ol>
                                    </div>
                                </div>
                                <div id="module17" class="ModuleWrapper" moduleRootId="1636191">
                                    <div class="listNewsType1 Article-News">
                                     
		 							 <div class="row">
								
                                           
											
											<section id="approved" class="category">
												<?php echo $danhmuc_detail['ten'];?>

<div class="showcase">
<ul class="phal-list row" style="padding: 10px;">


<?php foreach($list_ntm as $ntm) { ?>
<?php if(($ntm['dm_id']=='1')) {?> 	
<li class="col-xs-12 col-sm-4 col-md-6">				
<article>
<div>
<img class="cover" src="view/theme/default/image/xantm.png">
</div>
<header>
<h1><?php echo $ntm['tieu_de'];?></h1>
</header>
<header>
<h2>
<a class="modal1" style="padding-right: 15px;" href="<?php echo $ntm['quyet_dinh'];?>" rel="{handler: 'iframe', size: {x: 900, y: 570}}">
<i class="fa fa-list-alt" aria-hidden="true" style="font-size:13px;"></i>
 Quyết định
</a>
<a class="modal1" href="<?php echo $ntm['bao_cao'];?>" rel="{handler: 'iframe', size: {x: 900, y: 570}}">
<i class="fa fa-comment-o" aria-hidden="true" style="font-size:13px;"></i>
 Báo cáo
</a>
</h2>
</header>
</article>
</li>

<?php } ?>

<?php if(($ntm['dm_id']=='2')) {?> 	
<li class="col-xs-12 col-sm-4 col-md-6">				
<article>
<div>
<img class="cover" src="view/theme/default/image/muctieu.png">
</div>
<header>
<h1><?php echo $ntm['tieu_de'];?></h1>
</header>
<header>
<h2>
<a class="modal1" style="padding-right: 15px;" href="<?php echo $ntm['de_an'];?>" rel="{handler: 'iframe', size: {x: 900, y: 570}}">
<i class="fa fa-list-alt" aria-hidden="true" style="font-size:13px;"></i>
Đề Án
</a>

</h2>
</header>
</article>
</li>


<?php } ?>
<?php } ?>

</ul>

</div>	 
		
 
										 
</div>											 
	
</section>	
                                      <!--  <div id="pagination17" class="default-pagination" style="text-align:center"></div>-->
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
                         
					