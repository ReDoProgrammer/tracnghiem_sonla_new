<!-- start content--->
<div id="content"> 
      <div class="top1">
            <div class="left"> </div>
            <div class="right"></div>
            <div class="center">
           <h1 class="heading"><?php echo $heading_title; ?> <?php echo $tintop['ten_tin_hoat_dong'];?></h1>
            </div>
      </div>
      <div class="middle"> <!--start miiddlwe -->
       <div class="box-product">
        <?php foreach ($list_albumanh as $album) { ?>
           <div>
            <?php if ($album['avatar']) { ?>
            <div class="image"><a href="index.php?module=albumanh&act=view&id=<?php echo $album['album_anh_id']; ?>" title="<?php echo $album['ten_album_anh']; ?>"><img src="<?php echo get_thumnai($album['avatar']); ?>" alt="<?php echo $album['ten_album_anh']; ?>" class="bimg" width ="150" /></a></div>
            <?php } else { ?>
             <div class="image"><a href="index.php?module=albumanh&act=view&id=<?php echo $album['album_anh_id']; ?>" title="<?php echo $album['ten_album_anh']; ?>"><img src="data/images/demo.jpg" alt="<?php echo $album['ten_album_anh']; ?>"  width ="150" /></a></div>
            <?php } ?>
            <div class="name"><a href="index.php?module=albumanh&act=view&id=<?php echo $album['album_anh_id']; ?>" title="<?php echo $album['ten_album_anh']; ?>"><?php echo $album['ten_album_anh']; ?></a></div>
           </div>
      <?php } ?>
    </div> 
 
    <div class="pagination"><?php echo $pagination; ?></div>
      </div> <!--end middle-->
      <div class="bottom"> <!-- bgin botom-->
          <div class="left"></div>
          <div class="right"></div>
          <div class="center"></div>
      </div><!-- end botom -->
</div><!-- end content -->
