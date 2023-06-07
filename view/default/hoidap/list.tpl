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
                                                            <a href="index.php?module=about&act=view&id=1" title="">Gửu câu hỏi</a>
                                                            <meta itemprop="position" content="1"> </li>
                                                    </ol>
                                                </div>
                                            </div>
                                            <div id="module31" class="ModuleWrapper" modulerootid="1628195">
                                                <section id="section31" class="intro-type1">
                                                    <article id="article31" class="intro-content">

                                                        <div class="post-content">
                                  
								  
								  
								  
								  
								      <div class="panel-body">
                                        <div id="module17" class="ModuleWrapper">
                                            <div class="postQAList">
                                                <div class="box-search">
                                                    <div class="box-search-lbl">Tìm kiếm theo: <?php echo $_SESSION['title'];?></div>
                                                    <div class="form-group clearfix row">
                                                      
                                                        <div class="combobox pull-left filterCategory col-sm-6 col-xs-6 mb-10">
                                                         <form action="" method="post" enctype="multipart/form-data" id="form">
                        

<div class="form-group">
<div class="input-group">
<input class="form-control" type="text" value="<?php echo $_SESSION['title'];?>" name="title" aria-describedby="basic-addon2" placeholder="Tìm theo từ khóa">
<span class="input-group-btn">
<button class="submit-search btn btn-primary" title="Tìm kiếm" type="submit">Tìm kiếm</button>
</span>
</div>
</div>


</from>

							 </div>
                                                    </div>
                                                </div>
                                                <div class="total-quiz clearfix">
                                                    <div class="pull-left">Tổng số câu hỏi: <strong><?php echo $total;?></strong>
                                                    </div> 
								 
													<button onclick="window.location.href='index.php?module=hoidap&act=add'" type="button" class="btn btn-info pull-right">Gửi câu hỏi</button>
													</div>
                                            </div>
											
											 <ul class="list-items">
											 <?php foreach($list_hoidap as $hoidap) { ?>  
											 <?php if($hoidap['tra_loi']){?>
                                                                        <li class="item" style="border-bottom: 1px dashed #a7a9ac; padding-top: 10px; line-height: 25px;">
                                                                            <a class="title-faq hide" href="index.php?module=hoidap&act=view&id=<?php echo $hoidap['id_hoi']; ?>" title="<?php echo $hoidap['title'];?>"> <span class="qa-count mb-10 qa-count-zero">
 <span class="qa-count-data">0</span> <span class="qa-count-pad">Câu trả lời</span> </span>
                                                                            </a>
                                                                            <div class="item-inner">
                                                                                <div class="title"><span class=" qa-answer"><i class="fa fa-question-circle" aria-hidden="true"></i></span> <a class="title-faq" href="index.php?module=hoidap&act=view&id=<?php echo $hoidap['id_hoi']; ?>" title="<?php echo $hoidap['title'];?>"><?php echo $hoidap['title'];?></a>
                                                                                </div>
                                                                                <div class="time"> <span class="createdTime"><i class="fa fa-clock-o" aria-hidden="true"></i> <?php echo date_format(date_create($hoidap['time']),'H:i:s | d-m-Y');?> &nbsp;|&nbsp;</span><span class="fullname"><i class="fa fa-user" aria-hidden="true"></i> <?php echo $hoidap['author'];?></span> &nbsp;|&nbsp;</span><span class="fullname">  đã trả lời</span> </div>
                                                                                <div class="content clearfix" style="font-size: 13px;"><?php echo $hoidap['noi_dung'];?></div>
                                                                                <div class="mt-10"> <a style="color: dodgerblue;" href="index.php?module=hoidap&act=view&id=<?php echo $hoidap['id_hoi']; ?>"><i class="fa fa-angle-double-right mr-10" aria-hidden="true"></i>Xem câu trả lời</a> </div>
                                                                            </div>
                                                                        </li>
																		<?php } ?>
																			<?php } ?>
                                                                    </ul>
                                            <div id="loadDetailLayout17"></div>
                                            <style>
                                                .box-search-lbl {
                                                    font-size: var(--font-size-h3);
                                                    margin: 15px 0;
                                                }
                                                
                                                .postQAList .qaListItem .qaItem {
                                                    border: solid 1px #ccc;
                                                    padding: 20px;
                                                    margin-top: 20px;
                                                }
                                                
                                                .postQAList .postTitle a {
                                                    color: #337ab7;
                                                }
                                                
                                                .postTitle a:hover {
                                                    color: #2e6da4;
                                                }
                                            </style>
                                        </div>
								  
								  
								  
								  
								  
								  
								  
								  
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
                                      