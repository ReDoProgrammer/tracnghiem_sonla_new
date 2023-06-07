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
                                                            <a href="/hcc0010/van-ban" title="Văn bản">Văn bản</a>
                                                            <meta itemprop="position" content="1"> </li>
                                                      <!--  <li class="last-item" typeof="v:Breadcrumb">
                                                            <a href="" title="Công báo">Công báo</a>
                                                            <meta itemprop="position" content="2"> </li>-->
                                                    </ol>
                                                </div>
                                            </div>
                                            <div id="module31" class="ModuleWrapper" modulerootid="1628197">
                                                <div class="legal-document-detailLayout-default">
                                                    <div class="table-responsive">
                                                        <table class="table" border="1" width="100%" style="margin-bottom:0;">
                                                            <tbody>
                                                                <tr rowspan="2">
                                                                    <td width="25%" class="td-title">Tiêu đề văn bản</td>
                                                                    <td colspan="3" class="title"><?php echo $vanban_detail['ten'];?></td>
                                                                </tr>
                                                                <tr rowspan="4">
                                                                    <td width="25%" class="td-title">Số hiệu</td>
                                                                    <td width="25%"><?php echo $vanban_detail['so_hieu'];?></td>
                                                                    <td width="25%" class="td-title">Cơ quan ban hành</td>
                                                                    <td width="25%"><?php echo $vanban_detail['ten_noi_ban_hanh'];?></td>
                                                                </tr>
                                                                <tr rowspan="4">
                                                                    <td width="25%" class="td-title">Phạm vi</td>
                                                                    <td width="25%"></td>
                                                                    <td width="25%" class="td-title">Ngày ban hành</td>
                                                                    <td width="25%"><?php echo $vanban_detail['ngay_ban_hanh'];?></td>
                                                                </tr>
                                                                <tr rowspan="4">
                                                                    <td width="25%" class="td-title">Ngày hiệu lực</td>
                                                                    <td width="25%"><?php echo $vanban_detail['hieu_luc'];?></td>
                                                                    <td width="25%" class="td-title">Trạng thái</td>
                                                                    <td width="25%"><span class="has-hl">Đã có hiệu lực</span>
                                                                    </td>
                                                                </tr>
                                                                <tr rowspan="4">
                                                                    <td width="25%" class="td-title">Loại văn bản</td>
                                                                    <td width="25%"><?php echo $vanban_detail['ten_loai_van_ban'];?></td>
                                                                    <td width="25%" class="td-title">Người ký</td>
                                                                    <td width="25%"><?php echo $vanban_detail['nguoi_ky'];?></td>
                                                                </tr>
                                                                <tr rowspan="4">
                                                                    <td width="25%" class="td-title">Tài liệu đính kèm</td>
                                                                    <td width="25%">
																	 <?php if($vanban_detail['file']) {?> 
																	<a href="javascript:confirmDelete('index.php?module=vanban&act=download&id=<?php echo $vanban_detail['van_ban_id'];?>')" class="btn btn-primary btn-xs"><i class="fa fa-download" aria-hidden="true"></i> Tải về tại đây</a>
																	    <?php } else {?>
																		    File đính kèm không tồn tại
    <?php } ?>
																	
                                                                    </td>
                                                                    <td width="25%" class="td-title">File đính kèm</td>
                                                                    <td width="25%"> <a href="javascript:confirmDelete('index.php?module=vanban&act=download&id=<?php echo $vanban_detail['van_ban_id'];?>')">Tải xuống</a> </td>
                                                                </tr>
                                                                <tr rowspan="2">
                                                                    <td width="25%" class="td-title">Mô tả</td>
                                                                    <td colspan="3"><?php echo $vanban_detail['mo_ta1'];?></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>

                                                    <div class="detail-content">
  <?php if($ext == 'PDF' || $ext == 'pdf') { ?>
                                                        <div class="panel-default">
                                                            <div class="panel-heading">
                                                                <div class="panel-title"> <a id="show-content" class="" href="javascript:;">Xem chi tiết toàn văn</a> 

</div>
                                                            </div>
                                                            <div class="panel-body p-10">
                                                                <div class="content">
                                                                    <div class="mb-10 text-bold" style="color: #555;"><i class="fa fa-eye" aria-hidden="true"></i> Tập tin đính kèm</div>
                                                       
<iframe src = "view/javascript/ViewerJS/#<?php echo $vanban_detail['file'];?>" width='100%' height='800' allowfullscreen webkitallowfullscreen></iframe>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
<?php } ?>
                                                </div>

                                                <div id="pagination31" class="default-pagination" style="display: none;"></div>
                                                <style>
                                                    .detail-content .open {
                                                        display: block!important;
                                                    }
                                                </style>
                                            </div>
                                            <div class="panel panel-default frame564175037f8b9a474e8b4567 frameOptionb281376d75 frame-tinlienquan" id="frameBoundB5b237df51ee94">
                                                <div class="panel-heading">
                                                    <div class="panel-title">Văn bản liên quan</div>
                                                </div>
                                                <div class="panel-body">
                                                    <div id="module32" class="ModuleWrapper" modulerootid="2">
                                                        <div class="list-legal-document-table table-responsive">
                                                            <table class="table table-bordered table-striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col" class="text-center">STT</th>
                                                                        <th scope="col" class="tg-yw4l text-center" style="white-space: nowrap;">Tên văn bản</th>
                                                                       
                                                                        <th scope="col" class="text-center" style="white-space: nowrap;">Số hiệu</th>
                                                                        <th scope="col" class="text-center" style="white-space: nowrap;">Ngày ban hành</th>
                                                                        <th scope="col" class="text-center" style="white-space: nowrap;">File đính kèm</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                       <?php foreach ($list_vanban as $vanban) { ?>   
																 <tr>
                                                                        <td class="text-center">1</td>
                                                                        <td class="tg-yw4l"><a href="" title="<?php echo $vanban['ten'];?>"><?php echo $vanban['ten'];?></a>
                                                                        </td>
                                                              
                                                                        <td class="text-center" style="width: 20%;"><?php echo $vanban['so_hieu'];?></td>
                                                                        <td class="text-center"><?php echo $vanban['ngay_ban_hanh'];?></td>
                                                                         <td class="text-center" style="width: 5%;"> <a href="<?php echo $vanban['file'];?>" target="_blank"><span class="fa fa-download"></span></a> </td>
                                                                    </tr>
                                                              <?php } ?>
                                                                </tbody>
                                                            </table>
                                                            <div id="pagination32" class="default-pagination" style="display: none;"></div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <style>
                                                            .list-legal-document-table .tg-yw4l a:visited {
                                                                color: #609;
                                                            }
                                                            
                                                            .content-page {
                                                                min-height: calc(100vh - 170px);
                                                            }
                                                        </style>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
