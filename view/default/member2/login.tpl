                                                        </div>
        <div class="col-md-6" id="mobile-1" style=" -webkit-box-ordinal-group: 1; -moz-box-ordinal-group: 1; box-ordinal-group: 1;">
           
			
			
			
			
			 <div class="panel panel-success ">
            <div class="panel-heading" style="background: linear-gradient(135deg, rgb(208, 228, 247) 0%, rgb(115, 177, 231) 24%, rgb(10, 119, 213) 50%, rgb(83, 159, 225) 79%, rgb(135, 188, 234) 100%);">
            <h6 class="panel-title title_head">Đăng Nhập Tài Khoản</h6>
        </div>
                <div class="panel-body2">
         

  <div class="module-art">
  
  <div class="form-container" data-reactid="42">
    <!-- react-empty: 43 -->
    <div class="form-title col-lg-12 col-md-12 col-xs-12">ĐĂNG NHẬP</div>
	
    <div class="errorMessage" style="display: none;">Số điện thoại không hợp lệ.</div>
     <form action="" method="post" enctype="multipart/form-data" id="create">
        <input placeholder="Tên đăng nhập" class="form-control" type="text" name="user_name"/>
		 <?php if ($_SESSION['error_user_name']) { ?>
              <span class="error"><?php echo $_SESSION['error_user_name'];?></span>
              <?php } ?>
        <input placeholder="Nhập mật khẩu" class="form-control" name="password" type="password"/>
		<?php if ($_SESSION['error_password']) { ?>
              <span class="error"><?php echo $_SESSION['error_password'];?></span>
              <?php } ?>
        <!-- <div class="form-group">
            <input id="rememberMe" value="on" checked="" type="checkbox" style="margin: 0px">
            <label for="rememberMe" style="margin: 0px 0px 0px 5px">Ghi nhớ tài khoản</label>
        </div> -->
        <div class="form-group">
            <div class="col-lg-12 col-md-12 col-xs-12" style="padding: 0px">
                <button type="submit" name="submit" class="btn btn-login" style="">ĐĂNG NHẬP</button>
            </div>
        </div>
        <button type="button" class="btn" onclick="window.location.href= &#39;https://raovat321.com/quen-mat-khau&#39;" style="background: #ebebeb; margin-bottom: 0; color: #000;">Quên mật khẩu?</button>
        <div class="form-separator" data-reactid="55"><span data-reactid="56">Bạn chưa là thành viên?</span>
        </div>
        <div class="form-group group-2">
            <div class="col-lg-6 col-md-6 col-xs-6">
                <button type="button" onclick="window.location.href=''" class="btn btn-fb">
                    <!-- react-text: 60 -->Đăng nhập<span class="hidden-xs"> bằng</span>
                    <!-- /react-text --><img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE2LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPgo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IgogICB3aWR0aD0iMTZweCIgaGVpZ2h0PSIxNnB4IiB2aWV3Qm94PSIwIDAgMjY2Ljg5MyAyNjYuODk1IiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCAyNjYuODkzIDI2Ni44OTUiCiAgIHhtbDpzcGFjZT0icHJlc2VydmUiPgo8cGF0aCBpZD0iQmx1ZV8xXyIgZmlsbD0iI0ZGRkZGRiIgZD0iTTI0OC4wODIsMjYyLjMwN2M3Ljg1NCwwLDE0LjIyMy02LjM2OSwxNC4yMjMtMTQuMjI1VjE4LjgxMgogIGMwLTcuODU3LTYuMzY4LTE0LjIyNC0xNC4yMjMtMTQuMjI0SDE4LjgxMmMtNy44NTcsMC0xNC4yMjQsNi4zNjctMTQuMjI0LDE0LjIyNHYyMjkuMjdjMCw3Ljg1NSw2LjM2NiwxNC4yMjUsMTQuMjI0LDE0LjIyNQogIEgyNDguMDgyeiIvPgo8cGF0aCBpZD0iZiIgZmlsbD0iIzNDNUE5OSIgZD0iTTE4Mi40MDksMjYyLjMwN3YtOTkuODAzaDMzLjQ5OWw1LjAxNi0zOC44OTVoLTM4LjUxNVY5OC43NzdjMC0xMS4yNjEsMy4xMjctMTguOTM1LDE5LjI3NS0xOC45MzUKICBsMjAuNTk2LTAuMDA5VjQ1LjA0NWMtMy41NjItMC40NzQtMTUuNzg4LTEuNTMzLTMwLjAxMi0xLjUzM2MtMjkuNjk1LDAtNTAuMDI1LDE4LjEyNi01MC4wMjUsNTEuNDEzdjI4LjY4NGgtMzMuNTg1djM4Ljg5NWgzMy41ODUKICB2OTkuODAzSDE4Mi40MDl6Ii8+Cjwvc3ZnPg=="/>
                </button>
            </div>
            <div class="col-lg-6 col-md-6 col-xs-6">
                <button type="button" class="btn btn-success" onclick="window.location.href='./index.php?module=member&act=register'">Đăng ký</button>
            </div>
        </div>
    </form>
    <!-- react-empty: 64 -->
</div>

  
  
 </div>
 </div>
    
     
  </div> 
  
        </div>