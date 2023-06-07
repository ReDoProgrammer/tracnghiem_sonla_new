<?php include('view/template/common/header.tpl'); ?>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">
    <div class="login-box">
      <div class="login-logo">
        <img class="logo" src="assets/images/logo-mt.png" width="140px"><br>
        <a href=""><b>Hệ Thống Đăng Nhập</b></a>
      </div>
      <!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg text-danger fw-bold" id="msgLogin">
            <span id="msgLoginTitle" style="font-weight-bold; color: red;"></span>
            <span id="msgLoginContent"></span>
        </p>
        <div>
          <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Tài Khoản" name="txtUsername" id="txtUsername">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Password" name="txtPassword" id="txtPassword">
            <span class="icon fa  fa-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox"> Remember Me
                </label>
              </div>
            </div>
            <!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat" id="btnLogin">Đăng Nhập</button>
            </div>
            <!-- /.col -->
          </div>
        </div>
      </div>
      <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->
  </div>
  <div id="sb-container">
    <div id="sb-overlay"></div>
    <div id="sb-wrapper">
      <div id="sb-title">
        <div id="sb-title-inner"></div>
      </div>
      <div id="sb-wrapper-inner">
        <div id="sb-body">
          <div id="sb-body-inner"></div>
          <div id="sb-loading">
            <div id="sb-loading-inner"><span>loading</span></div>
          </div>
        </div>
      </div>
      <div id="sb-info">
        <div id="sb-info-inner">
          <div id="sb-counter"></div>
          <div id="sb-nav"><a id="sb-nav-close" title="Close" onclick="Shadowbox.close()"></a><a id="sb-nav-next"
              title="Next" onclick="Shadowbox.next()"></a><a id="sb-nav-play" title="Play"
              onclick="Shadowbox.play()"></a><a id="sb-nav-pause" title="Pause" onclick="Shadowbox.pause()"></a><a
              id="sb-nav-previous" title="Previous" onclick="Shadowbox.previous()"></a></div>
        </div>
      </div>
    </div>
  </div>
</body>
<script src="assets/js/customize/member/admin_auth.js"></script>



