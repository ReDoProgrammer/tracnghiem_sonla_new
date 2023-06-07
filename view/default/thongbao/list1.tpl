<div class="center_panel">

<div class="news_box_skhvdt">

<div class="news_box_title">
<span class="right_title"></span>
<a href="hoat-dong-cua-so.htm">THÔNG BÁO</a>
<span class="left_title"></span>
</div>


<div class="cont_skhvdt">


<!-- begin mom and kid  -->	

<?php foreach($list_thongbao as $thongbao) { ?>
<div style="padding:0px; line-height: 20px;">
<div class="tieude" style="padding-top: 10px; padding-bottom: 10px;">
<a class="featured" href="index.php?module=thongbao&act=view&id=<?php echo $thongbao['id_thongbao'];?>">
<img style="margin-right:5px; border:none" src="view/theme/default/image/icon_titlenews.png">
<?php echo $thongbao['tieu_de'];?> 
</a>
	<?php if($thongbao['thoi_gian']) {?>	
 <p class="field-content" style="padding-left: 30px;">Thời gian: <?php echo $thongbao['thoi_gian'];?></p>
 <?php } ?>
</div>
<div class="mota"></div>
</div>
<div class="clear"></div>
<?php } ?>



</div>
</div>

<!-- end thong bao --> 


	</div>
<!-- and main -->
