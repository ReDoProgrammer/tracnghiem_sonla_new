                                                        </div>
        <div class="col-md-6" id="mobile-1" style=" -webkit-box-ordinal-group: 1; -moz-box-ordinal-group: 1; box-ordinal-group: 1;">
           
			
			
			
			
			 <div class="panel panel-success ">
            <div class="panel-heading" style="background: linear-gradient(135deg, rgb(208, 228, 247) 0%, rgb(115, 177, 231) 24%, rgb(10, 119, 213) 50%, rgb(83, 159, 225) 79%, rgb(135, 188, 234) 100%);">
            <h6 class="panel-title title_head">Thông Tin Tài Khoản</h6>
        </div>
                <div class="panel-body2">
         

  <div class="module-art">
  
  
  
  <b style="margin-bottom: 2px; display: block;"><?php echo "Số dư tài khoản"; ?></b>
         <div class="group">
        <table>
            <tr>
            <td width="width: 50%"> <?php echo "Số dư tài khoản hiện tại: "; ?></td>
            <td class=""><?php echo number_format($meminfo['so_du_tk'],0,'.','.');?> đ</td>
          </tr>
          <tr> <td width=""> <a href ="./index.php?module=member&act=napthe" title="Nạp tiền vào tài khoản ngay"><?php echo "Nạp tiền cho tài khoản"; ?></a></td> </tr>
       </table>
      </div>


      <b style="margin-bottom: 2px; display: block;"><?php echo "Thông tin chung tài khoản cá nhân của tôi"; ?></b>
      <div class="group">
        <table>
          <tr>
            <td width="150"> <?php echo "Tổng số lần tải "; ?></td>
            <td><?php echo $tongdiachicuatoi;?> lần</td>
          </tr>
        
        <tr>
            <td width="150"> <?php echo "Điểm số tích lũy"; ?></td>
            <td><?php echo $meminfo['score'];?> điểm</td>
          </tr>
       
          <tr>
            <td width="150"> <?php echo "Lần đăng nhập cuối"; ?></td>
            <td><?php echo $meminfo['last_login'];?>  & ip <?php echo $meminfo['ip'];?></td>
          </tr>
        </table>
      </div>

    <b style="margin-bottom: 2px; display: block;">Thông tin cá nhân</b>
      <div class="group">
        <table>
           <tr><td width=""> <a href ="./index.php?module=member&act=edit"><?php echo "Sửa thông tin hồ sơ cá nhân"; ?></a></td></tr>
           <tr> <td width=""> <a href ="./index.php?module=member&act=napthe"><?php echo "Nạp thẻ"; ?></a></td> </tr>
       </table>
      </div>
      
     <b style="margin-bottom: 2px; display: block;">Các dịch vụ giá trị gia tăng của tôi</b>
      <div class="group">
        <table>
            <tr><td width=""> <a href ="./index.php?module=address&act=my_buy_list"><?php echo "Danh sách các dịch vụ đã sử dụng"; ?></a></td></tr>
        </table>
      </div>


           </div><!-- end botom -->


<div class="box1" style="padding: 10px;">

  <div class="box-content">
 
     
    
    
        <b style="margin-bottom: 2px; display: block;">Nhật ký 20 giao dịch gần đây nhất</b>
             
               <table class="list_tb">
               
               <thead>
               <tr><td>STT</td><td>Ngày tháng</td> <td>Tên giao dịch</td> <td>Phí</td> </tr>
               </thead>
               
               <tbody>
               <?php if($list_giaodich){  ?>
                  <?php foreach ($list_giaodich as $giaodich) {  $s=$s+1;  ?>
               <tr><td><?php echo $s; ?></td><td class="center"><?php echo date_format(date_create($giaodich[date]),'d/m/Y');?></td> <td><?php echo $giaodich['ten_giao_dich']; ?></td> <td style="width: 20%;" class=""><?php echo number_format($giaodich['phi'],0,'.','.'); ?> đ</td> 
                </tr>
                  <?php } ?>
              <?php } ?>
               </tbody>
                </table> 
   
   
   
   
   
</div>
  
  
  
  
  
  
  
  
  
    
                                                        
                                                    </div>



        </div>
    
     
  </div> 
  
        </div>