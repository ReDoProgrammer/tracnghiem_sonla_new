


<div class="center_panel">
    
<div class="news_box_skhvdt">

<div class="nav">
<h1>
<a class="home" href="index.php?module=home">Trang chủ</a>
<a class="arr" target="_self" href="index.php?module=home"><?php echo $hinhanh['tieu_de'];?></a>
</h1>
</div>



<!-- begin mom and kid  -->	
    <div class="article-listing" style="padding-top:5px;">
        <div class="list">
            <span class="lblresult"></span>
            
                
         
<!-- bat dau -->
<div class="albums" style="margin-bottom:5px">
<div class="mod_title">
<a title="" href="index.php?module=album&act=view&id=<?php echo $album['ma_ten_album']; ?>"> </a>
<span style="font-size:11px; color:#999; font-weight:normal"><?php echo $hinhanh1;?> photos | <?php echo $hinhanh['view_id'];?> view</span>
</div>
<div class="mod_content">
<div class="items_rows">

<?php foreach($list_hinhanh1 as $hinhanh) { ?>
<div class="items_cell">
<a class="" title="<?php echo $hinhanh['tieu_de'];?>" href="<?php echo $hinhanh['hinh_anh'];?>" rel="prettyPhoto[pp_gal]">
<img width="100" height="100" alt="" src="<?php echo $hinhanh['hinh_anh'];?>">
</a>
<br>
<a class="btn btn-ios" title="t?i v?" href="<?php echo $hinhanh['hinh_anh'];?>">
<span class="text-ios"><b>Tải về</b></span>
</a>


<br>
</div>
<?php } ?>
<div style="clear: both;"></div>
</div>
</div>
</div>

  <!-- ket thuc -->          


        </div>
  
    
    </div>
</div>

   
</div>