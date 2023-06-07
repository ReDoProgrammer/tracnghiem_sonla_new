<!-- start content--->
<div id="content"> 
      <!-- top-->
      <div class="top1">
            <div class="left"> </div>
            <div class="right"></div>
            <div class="center">
           <h1 class="heading"><?php echo $heading_title; ?> <?php echo $albumanh['ten_album_anh'];?></h1>
            </div>
      </div>
     <!-- conten info -->
      <div class="middle"> <!--start miiddlwe -->
             <div style="width: 100%; margin-bottom: 30px;"><!-- start group -->
                 <table style="width: 100%; border-collapse: collapse;">
                      <tr>
            			<td>
            			 <?php echo $albumanh['general'];?>
                      	</td>
                     </tr>
                </table> 
     </div> <!-- end content info -->
     Các album khác
     <hr />
     <div class="box-product">
        <?php foreach ($list_albumanh as $album) { ?>
           <div>
            <?php if ($album['avatar']) { ?>
            <div class="image"><a href="index.php?module=albumanh&act=view&id=<?php echo $album['album_anh_id']; ?>" title="<?php echo $album['ten_album_anh']; ?>"><img src="<?php echo get_thumnai($album['avatar']); ?>" width ="150" alt="<?php echo $album['ten_album_anh']; ?>" /></a></div>
            <?php } else { ?>
             <div class="image"><a href="index.php?module=albumanh&act=view&id=<?php echo $album['album_anh_id']; ?>" title="<?php echo $album['ten_album_anh']; ?>"><img src="data/images/demo.jpg" width ="150" alt="<?php echo $album['ten_album_anh']; ?>" /></a></div>
            <?php } ?>
            <div class="name"><a href="index.php?module=albumanh&act=view&id=<?php echo $album['album_anh_id']; ?>" title="<?php echo $album['ten_album_anh']; ?>"><?php echo $album['ten_album_anh']; ?></a></div>
           </div>
     <?php } ?>
   </div>
   
  <div class="pagination"><?php echo $pagination; ?></div> <!-- paging -->
    </div> <!--end middle-->
      <div class="bottom"> <!-- bgin botom-->
          <div class="left"></div>
          <div class="right"></div>
          <div class="center"></div>
      </div><!-- end botom -->
</div><!-- end content -->
<script type="text/javascript"><!--
$.tabs('.tabs a'); 
//--></script>
