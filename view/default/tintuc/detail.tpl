<!-- start content--->
<div id="content"> 
      <div class="top1">
            <div class="left"> </div>
            <div class="right"></div>
            <div class="center">
           <h1 class="heading"><?php echo $heading_title; ?> </h1>
            </div>
      </div>
      <div class="middle"> <!--start miiddlwe -->
             <div style="width: 100%; margin-bottom: 30px;"><!-- start group -->
                 <table style="width: 100%; border-collapse: collapse;">
                      <tr>
			<td>
                        <h1 class="componentheading"><?php echo $tintuc_detail['tieu_de'];?> </h1>Thoi gian: <?php echo $tintuc_detail['thoi_gian'];?>
                        <br /></br>
			 <b><?php echo $tintuc_detail['mo_ta_chung'];?></b>
                        <br />
                         <?php echo $tintuc_detail['chi_tiet'];?>
                         
			</td>
                      </tr>
                      
                 </table> 
     </div> <!-- end group -->
   
  
    <!-- note for address-->
    <h1 class="relate">
    Các bài viết liên quan
    </h1>
    <ul>
    <?php foreach($list_mevabelienquan as $tinlienquan) { ?>
     <li> <a href = "index.php?module=mevabe&act=view&id=<?php echo $tinlienquan['me_va_be_id']; ?>"> <?php echo $tinlienquan['ten_me_va_be'];?></a> </li>
    <?php } ?>
    </ul>
     <h1 class="relate">
     <b> Các bài viết mới </b>
     </h1>
     <ul>
      <?php foreach($list_mevabe as $mevabe) { ?>
      <li> <a href = "index.php?module=mevabe&act=view&id=<?php echo $mevabe['me_va_be_id'];?>"> <?php echo $mevabe['ten_me_va_be'];?></a> </li>
      <?php } ?>
      </ul>
   
     
     <div class="pagination"><?php echo $pagination; ?></div> 
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
