<div id="content_right">
<div class="box">
  <div class="box-heading">Các giao dịch gần đây nhất</div>
  <div class="box-content">


      
             
               <table class="list_tb">
               
               <thead>
               <tr><td>STT</td><td>Ngày tháng</td> <td>Tên giao dịch</td> <td>Phí</td> </tr>
               </thead>
               
               <tbody>
               <?php if($list_giaodich){  ?>
                  <?php foreach ($list_giaodich as $giaodich) {  $s=$s+1;  ?>
               <tr><td><?php echo $s; ?></td><td class="center"><?php echo $giaodich['date']; ?></td> <td><?php echo $giaodich['ten_giao_dich']; ?></td> <td class="right"><?php echo number_format($giaodich['phi'],0,'.','.'); ?> đ</td> 
                </tr>
                  <?php } ?>
              <?php } ?>
               </tbody>
                </table> 
      

   
    
</div></div>
</div>
 <!-- and main -->
