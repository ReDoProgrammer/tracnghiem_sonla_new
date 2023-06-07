
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
                                            <li class="last-item" typeof="v:Breadcrumb" itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement"> <a href="index.php?module=danhba&act=list" title="Danh bạ" itemprop="item">Danh bạ</a>
                                                <meta itemprop="position" content="1" /> </li>
                                        </ol>
                                    </div>
                                </div>
                                <div id="module17" class="ModuleWrapper" moduleRootId="1636191">
                                    <div class="listNewsType1 Article-News">
                                     
										 
										 <div id="module22" class="ModuleWrapper" moduleRootId="1620532">
                                                                <div class="list-pdf-table table-responsive">
                                                                    <table class="table table-bordered table-striped">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="text-center">STT</th>
                                                                                <th class="tg-yw4l">Họ Và Tên</th>
                                                                                <th class="text-center">Chức Danh</th>
                                                                                <th class="text-center">Điện Thoại</th>
                                                                                <th class="text-center">Email</th>
                                                                            </tr>
                                                                        </thead>
																		   <?php foreach($list_dmdanhba as $dmdanhba) { ?>
                                                                        <tbody>
																			<tr>
																			<td colspan="5"><strong><a href=""><?php echo $dmdanhba['tieu_de'];?></a></strong></td></tr>
                                                                           </tbody>
																		       <?php $list_danhba = getListdanhba2($dmdanhba['id'],0, 10); ?>
     <?php foreach($list_danhba as $danhba) { ?>
																		   <tbody>
                                                                            <tr>
                                                                                <td class="text-center"><?php echo $danhba['stt'];?></td>
                                                                                <td class="tg-yw4l"><a href="#" title="<?php echo $danhba['ho_ten'];?>"><?php echo $danhba['ho_ten'];?></a>
                                                                                </td>
                                                                                <td class="text-center"><?php echo $danhba['chuc_vu'];?></td>
                                                                                <td class="text-center"><?php echo $danhba['dien_thoai'];?></td>
                                                                                <td class="text-center"> <a href="" target="_blank"><?php echo $danhba['email'];?></a> </td>
                                                                            </tr>
                                                                        </tbody>
																		<?php }} ?>
                                                                    </table>
                                                                    <div id="pagination22" class="default-pagination"></div>
                                                                </div>
                                                                <style>
                                                                    .list-pdf-table thead tr {
                                                                        color: white;
                                                                    }
                                                                    
                                                                    .list-pdf-table .fa-download:hover {
                                                                        transform: scale(1.2);
                                                                        -webkit-transform: scale(1.2);
                                                                        -moz-transform: scale(1.2);
                                                                        -o-transform: scale(1.2);
                                                                        -ms-transform: scale(1.2);
                                                                        transition: all 0.3s;
                                                                        -moz-transition: all 0.3s;
                                                                        -webkit-transition: all 0.3s;
                                                                        -o-transition: all 0.3s;
                                                                    }
                                                                    
                                                                    .list-pdf-table thead tr {
                                                                        background: var(--brand-primary);
                                                                    }
                                                                    
                                                                    .list-pdf-table .fa-download {
                                                                        color: var(--brand-primary);
                                                                    }
                                                                </style>
                                                            </div>
										 
										 
										 
										 
                                      
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
                         
					