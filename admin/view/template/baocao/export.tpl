<div id="noidungin" class="box-body table-responsive no-padding">
<h3 style="text-align:center;">BÁO CÁO TÌNH HÌNH XỬ LÝ CHỨNG THƯ SỐ</h3>
<h5 class="ng-binding" style="text-align:center; font-weight:normal;margin-top: -10px;">
Thời điểm xuất báo cáo 

<?php echo $today = date("d-m-Y H:i:s");  ?>
<br>
(Từ ngày <?php echo  $_SESSION['startday'];?> đến ngày <?php echo  $_SESSION['endday'];?>)
</h5>
<table id="bc_vbnb" cellpadding="10" border="1" style="border: 1px solid black;border-collapse: collapse !important;">
<tbody>
<tr style="border-top-width: 0px;border-left-width: 0px; padding: 10px !important;">
<th style="width:5%; text-align:center; padding: 10px !important;">STT</th>
<th style="width:15%; text-align:center;">Địa Chỉ Email</th>
<th style="width:15%; text-align:center;">Họ Và Tên</th>
<th style="width:10%; text-align:center;">Ngày Sinh</th>
<th style="width:10%; text-align:center;">Chứng minh thư</th>
<th style="width:15%; text-align:center;">Cơ quan / Đơn vị</th>
<th style="width:10%; text-align:center;">Tình trạng</th>
<th style="width:10%; text-align:center;">Đối tượng</th>
<th style="width:10%; text-align:center;">Thời gian</th>
<th style="width:10%; text-align:center;">Thao tác</th>

</tr>

<br>
    
       <?php if ($list_baocao) { ?>
          <?php foreach ($list_baocao as $cts) { ?>  

		  
		  <tr class="ng-scope">
<td class="ng-binding" style="text-align:center;padding: 10px !important;"> <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?></td>
<td class="ng-binding" style="text-align:center;"> <?php echo $cts['email'];?> </td>
<td class="ng-binding" style="text-align:center;">
<?php echo $cts['ho_ten'];?>
<span class="ng-binding ng-scope" ng-if="item.di_dong_nguoi_nhan != null">
<br>
<?php echo $cts['dien_thoai'];?>
</span>
</td>
<td class="ng-binding" style="text-align:center;"> <?php echo $cts['ngay_sinh'];?> </td>
<td class="ng-binding" style="text-align:center;">
<?php echo $cts['so_cmt'];?>
<span class="ng-binding ng-scope" ng-if="item.di_dong_nguoi_nhan != null">
<br>
<?php echo $cts['ngay_cap'];?>
</span>
</td>
	<td class="text-center">
				 <?php echo $cts['ten_co_quan']; ?>
				
</td>
	<td class="text-center">
				 <?php if($cts['view']=='0') { ?>
<span class="badge bg-red ng-scope">Chưa xem</span>

		 <?php } else 
			   if($cts['view']=='1') { ?>
				<span class="badge bg-green ng-scope">Đã Xem</span>
		   <?php } ?>				
</td>

 <td class="text-center" style="color: red;">
                  <?php if($cts['tochuc_canhan_id']=='1') {echo "Cá Nhân" ;}
            else if($cts['tochuc_canhan_id']=='2'){echo "Tổ Chức" ;}
			?>
                </td>
				 <td class="text-center" style="color: red;">
               <?php echo time_stamp_to_date($cts['publish_date']); ?>
                </td>
				
				 <td class="text-center" style="white-space:nowrap">
                       
						 [	<a href="index.php?module=cts&act=view&cm=<?php echo $cts['tochuc_canhan_id'] ?>&id=<?php echo $cts['id_cts']; ?>" title="Xem"><i class="fa fa-file" aria-hidden="true"></i> </a> ]
                </td>
				
				  
		
       
 
    
           <?php } ?>
  <?php } else { ?> 

<tr class="ng-scope">
<td style="color:#848484; text-align:center;" colspan="10">
<br>
Không có dữ liệu
<br>
<br>
</td>
</tr>
</tr>
		  
		  
		
        
  
		  
	  <?php } ?>	
		
		
<br>
<br>

</tbody>
</table>
</div>