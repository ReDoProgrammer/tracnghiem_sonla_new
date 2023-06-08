<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
<div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
  <section class="content-header">
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
      Cấu hình thông tin đăng ký thành viên
    </h1>
    <ol class="breadcrumb">
      <li><a href="index.php?module=home">Trang Chủ</a></li>
      <li class="active">Cấu hình thành viên</li>
    </ol>
  </section>
  <section class="content animated fadeIn" id="site_configs">
    <div class="row">
      <div class="col-sm-12">
        <div class="box box-warning">
          <div class="container">
            <div class="row mt-5">
              <div class="col-md-2"></div>
              <div class="col-md-8">
                <div class="form-group">
                  <label>Tên site <span class="style2">(*)</span></label>
                  <input name="title_name" class="form-control" type="text" id="site_name"
                    value="Trang Thông tin điện tử Hội khuyến học tỉnh Sơn La">
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Site url<span class="style2">(*)</span></label>
                      <input name="url" class="form-control" type="text" id="site_url"
                      value="https://khuyenhoc.sonla.gov.vn">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Địa chỉ Email<span class="style2">(*)</span></label>
                      <input name="email" class="form-control" type="text" id="site_email" 
                      value="khuyenhocsonla@gmail.com">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>Meta keyword <span class="style2">(*)</span></label>
                  <textarea name="keywords" class="form-control" id = "site_meta"
                    style="height:70px; max-height:137px; max-width:100%"></textarea>
                </div>
                <div class="form-group">
                  <label>Description keyword <span class="style2">(*)</span></label>
                  <textarea name="description" class="form-control"
                    style="height:70px; max-height:137px; max-width:100%" id="site_description"></textarea>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Tác giả<span class="style2">(*)</span></label>
                      <input name="author" class="form-control" type="text" value="ICT" id="site_author">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Bản quyền tác giả<span class="style2">(*)</span></label>
                      <input name="web" class="form-control" type="text" value="" id="site_copyright">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>Máy Bàn:<span class="style2">(*)</span></label>
                      <input name="may_ban" class="form-control" type="text" value="02123.857.571" id="site_homephone">
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>Di Động:<span class="style2">(*)</span></label>
                      <input name="di_dong" class="form-control" type="text" value="" id="site_phone">
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>Máy Fax:<span class="style2">(*)</span></label>
                      <input name="fax" class="form-control" type="text" value="0212.3857.602" id="site_fax">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>Giấy Phép:<span class="style2">(*)</span></label>
                      <input name="giay_phep" class="form-control" type="text" value="12/GP-TTĐT" id="site_license">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>Cơ Quan Chủ Quản:<span class="style2">(*)</span></label>
                      <input name="chu_quan" class="form-control" type="text" value="" id="site_owner">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>Bản Đồ Goog Map:<span class="style2">(*)</span></label>
                      <input name="map" class="form-control" type="text" id="site_googlemap"
                        value="https://www.google.com/maps?ll=21.32752,103.9095&amp;z=15&amp;t=m&amp;hl=vi&amp;gl=US&amp;mapclient=embed&amp;cid=1570758637398736261">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>Link Facebook:<span class="style2">(*)</span></label>
                      <input name="facebook" class="form-control" type="text" value="" id="site_facebook">
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>Địa chỉ <span class="style2">(*)</span></label>
                  <textarea name="dia_chi" class="form-control" id="site_address"
                    style="height:70px; max-height:137px; max-width:100%">Số 06, ngõ 2A, phố Xuân Thủy, tổ 8, phường Chiềng Lề, thành phố Sơn La, tỉnh Sơn La</textarea>
                </div>                
              </div>
            </div>
          </div>
        </div>
        <div class="box-footer text-center">
            <button class="btn btn-sm btn-primary btn-flat" style="margin-top:4px" id="btnUpdateSiteConfigs">
              <i class="fa fa-save"></i> Cập nhật cấu hình
            </button>           
        </div>	
      </div>
    </div>
  </section>
</div>
<?php include('view/template/common/footer.tpl'); ?>
<script src="assets/js/customize/config/js-site.js"></script>