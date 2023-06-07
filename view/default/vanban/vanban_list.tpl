<div id="whole-page">
    <div id="page-header">
        <div id="module32" class="ModuleWrapper">
            <div id="column1-32" class="column1 container ">
                <div class="foverlay"></div>
                <div class="columns-widget row">
                    <div class="col-md-12 col-xs-12 col-sm-12"></div>
                </div>
            </div>
            <style>
                /**/
            </style>
        </div>
    </div>
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
                                                            <a href="" title="Văn bản">Văn bản</a>
                                                            <meta itemprop="position" content="1"> </li>
                                                    </ol>
                                                </div>
                                            </div>


 <form action="index.php?module=vanban&act=list" method="post" enctype="multipart/form-data" id="form">
                                    <section id="section17" class="section-table-administrativeprocedure Article-AdministrativeProcedure-Detail-tableType1">

     <div class="filter-administrativeprocedure form-group mt-10 panel-primary panel-search-administrativeprocedure panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">Tìm kiếm văn bản tài liệu</div>
                                            </div>
                                            <div class="panel-body">
                                                <div class="note mb-15">Nhập tên văn bản trích yếu hoặc từ khóa liên quan đến văn bản tài liệu vào cửa sổ tìm kiếm dưới đây</div>
                                                <div class="row">
                                                    <div class="normal-search clearfix mb-15">
                                                        <div class="col-sm-9">
														 <?php if($_SESSION['ten']){?>
                                                            <input type="text" name="ten" class="search_init text_filter form-control wp-100" placeholder="Nhập từ khóa cần tìm" value="<?php echo $_SESSION['ten'];?>" style="margin-bottom:0;">
															<?php } else {?>
															      <input type="text" name="ten" class="search_init text_filter form-control wp-100" placeholder="Nhập từ khóa cần tìm" value="" style="margin-bottom:0;">
																  <?php } ?>
</div>
<div class="col-sm-3">
                                                            <button type="submit" class="btn btn-danger">Tìm kiếm</button>
</div>
                                                      
                                                      
                                                    </div>
                                                    <div id="advanced-search17" class="col-md-12 advanced-search">
                                                      
                                                        <div class="clearfix"></div>
                                                        <div class="div-left pull-left">
                                                            <span>Tìm theo: </span>
                                                        </div>
                                                        <div class="div-right pull-right">
                                                            <div class="row">
                                                                <div class="col-xs-6 col-sm-6 col-md-4 mb-10">

                                                                    <select class="form-control" name="noi_ban_hanh_id">
												 <option value="">Cơ quan ban hành</option>                                                                     
												 <?php foreach ($list_noibanhanh as $nbh) { ?>
													<?php if($_SESSION['noi_ban_hanh_id']== $nbh['noi_ban_hanh_id']) { ?>
														  <option value="<?php echo $nbh['noi_ban_hanh_id'];?>" selected><?php echo $nbh['ten_noi_ban_hanh']; ?></option>
														<?php } else { ?>
													 <option value="<?php echo $nbh['noi_ban_hanh_id'];?>"><?php echo $nbh['ten_noi_ban_hanh']; ?></option>
													 <?php } ?>        
													<?php } ?>

                                                                    </select>

                                                                </div>
                                                                <div class="col-xs-6 col-sm-6 col-md-4 mb-10">
                                                                    <input type="text" name="so_hieu" class="search_init text_filter form-control wp-100" placeholder="Số hiệu văn bản" value="<?php echo $_SESSION['so_hieu'];?>" style="margin-bottom:0;">
                                                                </div>
                                                                <div class="col-xs-6 col-sm-6 col-md-4 mb-10">
                                                                    <input type="text" name="ngay_ban_hanh" class="search_init text_filter form-control wp-100" placeholder="Ngày ban hành" value="<?php echo $_SESSION['ngay_ban_hanh'];?>" style="margin-bottom:0;">
                                                                </div>
                                                                <div class="col-xs-6 col-sm-6 col-md-4 mb-10">





                                                                    <select id="input88123" class="form-control wp-100" name="loai_van_ban_id">

                                                                    <option value="">Lĩnh vực</option>

   <?php foreach ($list_loaivanban as $loaivb) { ?>
	    <?php if ($loaivb['loai_van_ban_id'] == $_SESSION['loai_van_ban_id']) { ?>
	     <option value="<?php echo $loaivb['loai_van_ban_id'];?>" selected><?php echo $loaivb['ten_loai_van_ban']; ?></option>
	              <?php } else { ?>
	    <option value ="<?php echo $loaivb['loai_van_ban_id']; ?>"><?php echo $loaivb['ten_loai_van_ban']; ?></option>
	    <?php }} ?>

                                                                    </select>





                                                                </div>
                                                                <div class="col-xs-6 col-sm-6 col-md-4 mb-10">
                                                                    <input type="text" name="nguoi_ky" class="search_init text_filter form-control wp-100" placeholder="Người ký" value="<?php echo $_SESSION['nguoi_ky'];?>" style="margin-bottom:0;">
                                                                </div>
                                                                <div class="col-xs-6 col-sm-6 col-md-4 mb-10">

                                                                    <select class="form-control" name="hieu_luc">
                                                                        <option value="">Trạng thái</option>

                                                                        <option value="&lt;p>Tổ chức&lt;/p>">
                                                                            <p>Đã có hiệu lực</p>
                                                                        </option>
																		
                                                                        <option value="&lt;p>Tổ chức&lt;/p>">
                                                                            <p>Chưa có hiệu lực</p>
                                                                        </option>

                                                                    </select>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>








                                            <div id="module31" class="ModuleWrapper" modulerootid="1628197">
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
                                                                <td class="text-center"><?php $ia = $ia+1; ?>
							<span> <?php echo $ia;?>  </span>
					<?php  ?></td>
                                                                <td class="tg-yw4l"><a href="index.php?module=vanban&act=view&id=<?php echo $vanban['van_ban_id'];?>" title="<?php echo $vanban['ten'];?>"><?php echo $vanban['ten'];?></a>
                                                                </td>
                                                           
                                                                <td class="text-center"><?php echo $vanban['so_hieu'];?></td>
                                                                <td class="text-center"><?php echo $vanban['ngay_ban_hanh'];?></td>
                                                                <td class="text-center"> <a href="<?php echo $vanban['file'];?>" target="_blank"><span class="fa fa-download"></span></a> </td>
                                                            </tr>
                                                           <?php } ?>
                                                        </tbody>
                                                    </table>
                                                    <div id="pagination31" class="default-pagination" style="display: none;"></div>
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
                                      </from>