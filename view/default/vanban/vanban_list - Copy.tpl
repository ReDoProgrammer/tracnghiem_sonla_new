<!-- BEGIN: content -->
			<div class="row portal-content">
				<div class="row-sm-height">
					<!-- BEGIN: main content -->
					<div class="col-xs-12 col-md-9" id="content-main">
						<table class="s4-wpTopTable" border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td valign="top">
									<div WebPartID="00000000-0000-0000-0000-000000000000" HasPers="true" id="WebPartWPQ3" width="100%" class="noindex" OnlyForMePart="true" allowDelete="false" style="">
										<div id="ctl00_ctl00_g_e9135551_6951_48d2_ad9f_8c5854226e02">

											<div id='ctl00_ctl00_g_e9135551_6951_48d2_ad9f_8c5854226e02_ctl00' class="rcrumbs">
												<ul class="breadcrumb">
													<li><a href='http://bttnmuongnhe.org.vn/portal/home/van-ban/search.aspx'>Hệ thống văn bản</a>
													</li>
												</ul>
												<a href="" class="trangto" style="float: right;margin-top: -23px;">
													<img src="/portal/_themes/default/img/" width="24" height="18" border="0">
												</a>
											</div>



										</div>
									</div>
								</td>
							</tr>
						</table>
						<div class="inside inside-full-height">



							<div class="content-container">
								<div class="page-header">
									<div class="form-horizontal">
										<div class="row">
											<div class="col-md-6">
												<div class="">
													<label class="control-label">Loại văn bản</label>
													<div class="controls">
														<select class="form-control" id="slt_cat">
															<option value="">-- Mọi loại --</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="">
													<label class="control-label">Đơn vị</label>
													<div class="controls">
														<select class="form-control" id="slt_dep">
															<option value="">-- Tất cả --</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="">
													<label class="control-label">Số hiệu</label>
													<div class="controls">
														<input type="text" class="form-control" id="txt-kh" value='' />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="">
													<label class="control-label">Trích yếu</label>
													<div class="controls">
														<input type="text" class="form-control" id="txt-ty" value='' />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="">
													<label class="control-label"><i class="fa fa-calendar"></i> Ngày ban hành từ</label>
													<div class="controls">
														<input type="text" class="form-control date-picker" id="txt-fr" value='' />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="">
													<label class="control-label"><i class="fa fa-calendar"></i> Đến</label>
													<div class="controls">
														<input type="text" class="form-control date-picker" id="txt-to" />
													</div>
												</div>
											</div>
										</div>
										<div class="form-actions">
											<div class="pull-right">
												<button class="btn btn-primary" type="button" onclick="__search()"><i class="fa fa-search"></i> Tìm kiếm</button>
											</div>
											<div class="clearer"></div>
										</div>
									</div>
								</div>

								<div class="table-wrapper">
								
								
								   <table class="table table-bordered blue">
                    <colgroup>
                        <col style="width:200px" />
                        <col style="width:auto" />
                        <col style="width:120px" />
                        <col style="width:120px" />
                    </colgroup>
                    <thead class="thead-blue">
                    <tr>
                        <th scope="col">Số ký hiệu</th>
                        <th scope="col">Trích yếu</th>
                        <th scope="col">Ngày ban hành</th>
                        <th scope="col">Ngày hiệu lực</th>
                    </tr>
                    </thead>
					   <?php if ($list_vanban) { ?>

     <?php foreach ($list_vanban as $vanban) { ?>
	  <tbody id="list-legal-docs">
                   <tr>
<td scope="row"><?php echo $vanban['so_hieu'];?></td>
<td>
<a href="index.php?module=vanban&act=view&id=<?php echo $vanban['van_ban_id'];?>"><?php echo $vanban['ten'];?></a>
</td>
<td><?php echo $vanban['ngay_ban_hanh'];?></td>
<td>23/09/2019</td>
</tr>
                    </tbody>
	 <?php } ?>
	 
	 	<?php } else { ?>
                    <tbody id="list-legal-docs">
                    <tr>
                        <td colspan="4" class="text-center">Chưa có dữ liệu hiển thị</td>
                    </tr>
                    </tbody>
					<?php } ?>
				
                </table>
								
								
								
								
								
								
								</div>
								<div class="pagination">
									<span id="ctl00_ctl00_Place_Main_Upper_Place_Main_Upper_DataList1_DataPager1"><a disabled="disabled" class="btn"><< Trước</a>&nbsp;<span class="btn disabled">1</span>&nbsp;<a class="btn" href="javascript:__doPostBack('ctl00$ctl00$Place_Main_Upper$Place_Main_Upper$DataList1$DataPager1$ctl01$ctl01','')">2</a>&nbsp;<a class="btn" href="javascript:__doPostBack('ctl00$ctl00$Place_Main_Upper$Place_Main_Upper$DataList1$DataPager1$ctl02$ctl00','')">Sau >></a>&nbsp;</span>
								</div>


								<script id="catOptTpl" type="text/x-jQuery-tmpl">
									<option value="${title}">${title}</option>
								</script>




							</div>





						</div>
					</div>
					<!-- END: main content -->