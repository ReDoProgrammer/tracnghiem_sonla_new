
<div id="content">

<!-- begin mom and kid  -->	
	<div class="zdnew" style="">
		<h1><a href="">Album Ảnh</a></h1>
			<div class="zdmid">

<?php foreach ($list_album as $anhcuoi) { ?> 
<div class="show1">
<div class="show_item">
<div class="container_image">
<a title="<?php echo $anhcuoi['tieu_de'];?>" href="index.php?module=album&act=view&id=<?php echo $anhcuoi['ma_ten_album']; ?>">
<samp>
<img src="<?php echo $anhcuoi['hinh_anh'];?>" width="235">
</samp>
</a>
</div>
<p class="selected"><?php echo $anhcuoi['tieu_de'];?></p>
<a title="<?php echo $anhcuoi['tieu_de'];?>" href="index.php?module=album&act=view&id=<?php echo $anhcuoi['ma_ten_album']; ?>">
<span>Love is a symbol of eternity...</span>
</a>
</div>
</div>

<?php } ?>

<div class="pagination"><?php echo $pagination; ?></div> 
</div>
</div>




<!-- end feature -->


	</div>
<!-- and main -->
