<div id="content_right">
<div class="box">
  <div class="box-heading">Thông báo</div>
  <div class="box-content">

<div class="success"> <font size="3"><?php echo $mess;?></font></div>

 <div style="margin: 0 auto; width: 400px;">



           



       </div></div>

</div><!-- end content -->
</div>

       <script>
            $(document).ready(function() {
                 // nap the
                $("#fnapthe").ajaxForm({
                    dataType : 'json',
                    url: 'index.php?module=member&act=card',
                    beforeSubmit : function() {
                        $("#loading_napthe").show();
                    },
                    success: function(data) {
                        if(data.code == 0) {
                            $("#fnapthe").resetForm();
                            $("#msg_success_napthe").html(data.msg);
                            $("#msg_err_napthe").html('');
                        }
                        else {
                            $("#msg_err_napthe").html(data.msg);
                            $("#msg_success_napthe").html('');
                        }
                        $("#loading_napthe").hide();
                        $("#captcha").attr('src', 'system/gb_api/captcha/CaptchaSecurityImages.php?' + Math.random());
                    }
                });
            });
        </script>