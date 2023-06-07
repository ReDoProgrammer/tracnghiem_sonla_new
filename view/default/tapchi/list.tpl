<div class="center_panel">


<div class="news_box_skhvdt">

<div class="news_box_title">
<span class="right_title"></span>
<a href="index.php?module=home">Trang chủ<div class="ArrowRoad"></div></a> <a href="index.php?module=tapchi&act=list">Tạp chí suối reo</a>
<span class="left_title"></span>
</div>


<div class="cont_skhvdt">

   <div class="list_film">
<ul>
<?php foreach($list_tapchi as $tapchi) { ?>



<li>
<div class="status">
<span class="status_r">Số: <?php echo $tapchi['so'];?></span>
</div>
<div class="thumb_film">
<div class="poster">
<div class="img">
<a title="<?php echo $tapchi['tieu_de'];?>" href="index.php?module=tapchi&act=view&id=<?php echo $tapchi['id']; ?>">
<img src="<?php echo $tapchi['pic'];?>">
<?php echo $tapchi['tieu_de'];?>
</a>
</div>

</div>
</div>
<div class="name">
<a title=""><?php echo $tapchi['tieu_de'];?></a>
</div>
<div class="" style="font: 11px arial; color: #666666; float: left; padding-top: 5px; font-style: italic;"> Ngày đăng: <?php echo date_format(date_create($tapchi['time']),'d / m / Y'); ?></div>


</li>

<?php } ?>	
	</ul>
</div>	






</div>
<div class="pagination"><?php echo $pagination; ?></div>


 </div>  
</div>