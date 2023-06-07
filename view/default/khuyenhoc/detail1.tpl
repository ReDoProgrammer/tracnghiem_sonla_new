<!-- start content--->
<div class="center_panel">

<div class="news_box_skhvdt">

<div class="news_box_title">
<span class="right_title"></span>
<a href="index.php?module=thongbao&act=list">THÔNG BÁO</a>
<span class="left_title"></span>
</div>


<div class="cont_skhvdt">
  <!-- bat dau -->
  
<!-- begin mom and kid  -->	

  <div class="TtlDetailND"><?php echo $thongbao['tieu_de'];?> </div>
  
  <div class="tool"> Cập nhật lúc: <?php echo date_format(date_create($thongbao['time']),'H:i:s d / m / Y'); ?>  | Lượt xem: <?php echo $thongbao['luot_xem'];?> </div>


  <div id="detail_content_middle" style="padding-top: 10px;">
  <?php echo $thongbao['noi_dung'];?>
  
  </div>
  
  <div style="padding-top: 10px;">
<?php if($ext == 'PDF' || $ext == 'pdf') { ?>
<iframe src = "view/javascript/ViewerJS/#<?php echo $thongbao['file'];?>" width='560' height='600' allowfullscreen webkitallowfullscreen></iframe>
<?php } ?></div>
  
  <div style="padding-top: 10px;">
  <b>File đính kèm:</b> 
  <?php if($thongbao['file']){?>
  <a href="<?php echo $thongbao['file'];?>">Tải tại đây</a>
  <?php } ?> 
  <?php if($thongbao['link']){?>
  <a href="<?php echo $thongbao['link'];?>">Tải tại đây</a>
  <?php } ?>
  </div>
  

  


  <div style="margin-bottom: 10px;"><hr /></div>
  
<!-- end feature -->
  
  <!-- ket thuc -->          
    <div class="pdNewOtherND">   
  <div class="TextTabNewOtherND">Thông báo cùng chuyên mục</div>
  <div class="cbh15"></div>
 <?php foreach($list_thongbao as $thongbao) { ?> 
  <div class="BgNewsOtherND">
<a class="TtlNewOtherND" href="index.php?module=thongbao&act=view&id=<?php echo $thongbao['id_thongbao'];?>" title="<?php echo $thongbao['tieu_de'];?> "><?php echo $thongbao['tieu_de'];?> </a>
<span class="TimeAndViewNewOtherND"> (<?php echo $thongbao['time'];?> - Lượt xem: <?php echo $thongbao['luot_xem'];?>) </span>
</div>
  <?php } ?>
    </div>
    
    
    
    
    
    
     
        </div>
  

    </div>
    </div>
    



