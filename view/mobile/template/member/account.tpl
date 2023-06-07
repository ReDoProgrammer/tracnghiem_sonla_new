<div id="heading"><?php echo $heading_title;?></div>
<div class="content"><?php echo "Xin chào ".$_SESSION['name']; ?></div>
   <div id ="title">Thông tin chung</div>
   <div class="bg">
        <table>
          <tr>
            <td> <?php echo "Tổng số bài viết"; ?></td>
            <td>30 bai</td>
             
          </tr>
          <tr>
            <td> <?php echo "Bài viết thảo luận"; ?></td>
            <td>30 bai</td>
          </tr>
        <tr>
            <td> <?php echo "Điểm số tích lũy"; ?></td>
            <td>30 bai</td>
          </tr>
 <tr>
            <td> <?php echo "Bài viết bổ sung"; ?></td>
            <td>30 bai</td>
          </tr>
          <tr>
            <td> <?php echo "Lần đăng nhập cuối"; ?></td>
            <td>30 bai</td>
          </tr>
        </table>
      </div>
 <div id="heading">Danh sách địa chỉ tôi chia sẻ</div>
    <div class="bg">
        <table>
         <tr>
            <td> <a href ="./?m=address&act=mylist"><?php echo "Danh sách địa chỉ"; ?></a></td>
            <td></td>
          </tr>
          <tr>
            <td> <a href ="./?m=address&act=add"><?php echo "Thêm địa chỉ mới"; ?></a></td>
            <td></td>
          </tr>
          <tr>
            <td><a href ="./?m=address&act=my_additional_list"><?php echo "Danh sách bài viết bổ sung";?></a></td>
            <td></td>
          </tr>

        <tr>
            <td> <a href ="./?m=member&act=edit"><?php echo "Sửa hồ sơ"; ?></a></td>
            <td></td>
          </tr>
       </table>
     

 <script type="text/javascript" src="./admin/theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#age').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
<!-- and main -->
