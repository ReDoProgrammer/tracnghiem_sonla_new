 <!-- css -->
    

<div id="content">
<div class="box1">
<div class="box-heading1">Hệ Thống Nạp Thẻ</div>
<div class="box-content1">
<div class="middle1">

<div class="success"> <font size="3">Hệ thống nạp thẻ đã hoạt động trở lại, có vướng mắc xin vui lòng SMS đến tổng đài: 0916020488 or 01689241988 hoặc gửi mail dohoaol2013@gmail.com để được trợ giúp ngay 24/24h</font></div>

 <div style="margin: 0 auto; width: 400px;">


            <div style="margin: 25px 0px;">
<!--
                <a href="http://svtb.com.vn"><img src="view/theme/default/image/logo2.png"/></a>
-->
            </div>




   <form action="#" method="post" id="fnapthe">
                <table class="table table-condensed table-bordered">
                    <tbody>
                        <tr>
                            <td></td>
                            <td>
                                <div style="margin: 5px 0px;">
                                    <div class="label label-success" id="msg_success_napthe"></div>
                                    <div class="label label-danger" id="msg_err_napthe"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Loại thẻ</td>
                            <td>
                                <select name="card_type_id" style="width: 200px;">
                                    <option value="1">Viettel</option>
                                    <option value="2">Mobiphone</option>
                                    <option value="3">Vinaphone</option>
                                    <option value="4">Gate</option>
                                </select>
                            </td>
                        </tr>
						
                        <tr>
                            <td>Mệnh giá</td>
                            <td>
                                <select name="price_guest" style="width: 200px;">
								
									<option value="0">- Chọn mệnh giá -</option>
                                    <option value="10000">10.000</option>
                                    <option value="20000">20.000</option>
                                    <option value="30000">30.000</option>
                                    <option value="50000">50.000</option>
                                    <option value="100000">100.000</option>
                                    <option value="200000">200.000</option>
                                    <option value="300000">300.000</option>
                                    <option value="500000">500.000</option>
                                    <option value="1000000">1.000.000</option>
                                </select>
							</td>
                        </tr>
						
                        <tr>
                            <td>Mã thẻ</td>
                            <td><input type="text" value="" name="pin" style="width: 200px;"/></td>
                        </tr>
                        <tr>
                            <td>Seri</td>
                            <td><input type="text" value="" name="seri" style="width: 200px;"/></td>
                        </tr>
						
                        <tr>
                            <td>Ghi chú</td>
                            <td><textarea name="note" id="note" class="form-control" rows="2"></textarea></td>
                        </tr>
					
						
						
                        <tr>
                            <td>Mã bảo mật</td>
                            <td>
                                <input type="text" id="ma_bao_mat" name="ma_bao_mat" style="width: 100px;"/>
                                  <div style="position: absolute; margin-top: -28px; margin-left: 111px;" class="security_code">
                                    <img src="system/napthe/captcha/CaptchaSecurityImages.php?height=28" id="captcha"/>
                                    <img src="view/theme/default/image/refresh.gif" style="position: relative; left: 12px; top: -1px; cursor: pointer;" onclick="
                                                document.getElementById('captcha').src='system/napthe/captcha/CaptchaSecurityImages.php?height=28&'+Math.random();"/>
                                </div><!-- End .security_code -->
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input class="btn btn-info" type="submit" value="Nạp thẻ"/>
                                <div id="loading_napthe" style="display: none; float: right"><img src="view/theme/default/image/loading.gif"/> &nbsp;Xin mời chờ...</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>











             
            

       </div>
         <b style="margin-bottom: 2px; display: block; color: red;">NHẬT KÝ NẠP THẺ 50 LẦN GẦN ĐÂY NHẤT:</b>
          <table class="list_tb" style="">
               
               <thead>
               <tr style="font-weight: bold;"><td>STT</td><td>Ngày tháng</td> <td>Mã thẻ</td> <td>Seri</td> <td>Loại thẻ</td> <td>Kết quả</td></tr>
               </thead>
               
               <tbody>
               <?php if($list_nknt){  ?>
                  <?php foreach ($list_nknt as $nknt) {  $s=$s+1;  ?>
               <tr><td><?php echo $s; ?></td><td><?php echo $nknt['date'];?></td> <td><?php echo $nknt['code']; ?></td> <td><?php echo $nknt['seri']; ?></td> 
                 <td><?php  
                  if($nknt['type']==1){ echo 'Viettel'; } 
		  if($nknt['type']==2){ echo 'Mobiphone'; }
		  if($nknt['type']==3){ echo 'VinaPhone'; }
		  if($nknt['type']==4){ echo 'Gate'; }

		  ?></td> 
                <td><?php if($nknt['status']){ echo number_format($nknt['status'],0,'.','.');} else{ echo "Thẻ sai";} ?></td></tr>
                  <?php } ?>
              <?php } ?>
               </tbody>
                </table> 
       </div>
       

</div><!-- end content -->
</div>
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
                        $("#captcha").attr('src', 'system/napthe/captcha/CaptchaSecurityImages.php?' + Math.random());
                    }
                });
            });
        </script>
