<div class="center_panel">


<div class="news_box_skhvdt">

<div class="news_box_title">
<span class="right_title"></span>
<a href="">Trang chủ<div class="ArrowRoad"></div></a> <a href="">Album ảnh</a>
<span class="left_title"></span>
</div>


<div class="cont_skhvdt" style="">

<!-- bat dau -->
<div class="list">
   <?php foreach($list_album as $album) { ?>
<div class="albums" style="margin-bottom:5px">
<div class="mod_title">
<a title="" href="index.php?module=album&act=view&id=<?php echo $album['ma_ten_album']; ?>"><?php echo $album['tieu_de'];?> </a>
<a style="float:right; padding-right: 10px; font-style: italic; font-size: 10px; color:red;" title="" href="index.php?module=album&act=view&id=<?php echo $album['ma_ten_album']; ?>">Xem tất cả album</a>
<span style="font-size:11px; color:#999; font-weight:normal"><?php echo $total;?> photos |  <?php echo $album['view_id'];?> view</span>
</div>
<div class="mod_content">
<div class="items_rows">

<?php 
$list_hinhanh = getListhinhanh($album['ma_ten_album'], $start, $limit);
?>

<?php foreach($list_hinhanh as $hinhanh) { ?>
<div class="items_cell">
<a class="" title="<?php echo $hinhanh['tieu_de'];?>" href="<?php echo $hinhanh['hinh_anh'];?>" rel="prettyPhoto[pp_gal]">
<img width="100" height="100" alt="" src="<?php echo $hinhanh['hinh_anh'];?>">
</a>
<a href="">
<span class="title_links" style="padding-left: 10px;"><?php echo "Tải về";?></span></a>
<br>
</div>
<?php } ?>
<div style="clear: both;"></div>
</div>
</div>
</div>
<?php } ?>
</div>
<!-- ket thuc -->


</div>
<div class="pagination"><?php echo $pagination; ?></div>


 </div>  
</div>