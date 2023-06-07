<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>

<!-- hien thi hinh anh prettyPhoto-->
<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
   $('.content a').fancybox();
});
</script>

<style>

*{
   margin: 0px;
   padding: 0px;
}
.content{
   width: 1200px;
   margin: auto;
   margin-top: 50px;
   display: flex;
   justify-content: space-around;
}
.content a{
   display: block;
   width: 30%;
   padding: 5px;
}
.content a img{
   width: 100%
}

</style>



<!-- het hien thi hinh anh prettyPhoto-->
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
                                            <li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="Thư Viện" itemprop="item">Thư Viện </a>
                                                <meta itemprop="position" content="1" /> </li>
												<li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="" title="TAlbum Ảnh" itemprop="item">Album Ảnh </a>
                                                <meta itemprop="position" content="1" /> </li>
                                        </ol>
                                    </div>
                                </div>
                                <div id="module17" class="ModuleWrapper" moduleRootId="1636191">
                                    <div class="listNewsType1 Article-News">
                                      
									    <section id="photo-album-list-default16" class="photo-album-list-default" itemscope itemtype="http://schema.org/ItemList">
                                        <div class="">
                                            <ul class="phal-list row">
                                                  <?php foreach($list_hinhanh1 as $hinhanh) { ?>
												<li class="col-xs-12 col-sm-4 col-md-4">
                                                    <article class="post-item gridDefaultType3 Article-PhotoAlbum" itemscope itemtype="http://schema.org/NewsArticle" data-id="5b6a64829218656055433a04" data-animated="bounceIn">
                                                        <figure class="post-image">

                                                            <a data-fancybox="gallery" href="<?php echo $hinhanh['hinh_anh'];?>"><img class="post-image relative-height lazy" data-size-ratio="3:2" src="<?php echo $hinhanh['hinh_anh'];?>">
                                                            </a>
															

                                                        </figure>
														
                                                        <div class="post-desc-wrapper">
                                                            <div class="post-desc">
                                                                <div class="post-meta clearfix mt-10"> <span class="date"><time class="post-date updated" datetime="2018-08-07T14:48:00+07:00"></time></span> </div>
                                                             
                                                            </div>
                                                        </div>
                                                    </article>
                                                </li>
                                           <?php } ?>
                                            </ul>
                                            <div id="pagination16" class="default-pagination"></div>
                                            <div class="clear-both"></div>
                                        </div>
                                    </section>
									  
									  
									  
									  
                      
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
                         
					