


<div class="center_panel">
    
<div class="news_box_skhvdt">

<div class="news_box_title">
<span class="right_title"></span>
<a class='home' href='index.php?module=home'>Trang chủ</a> <a href='index.php?module=home' target='_self' class='arr'>Tin tức</a><a href='index.php?module=home' target='_self' class='arr'><?php echo $tendanhmuc['title'];?></a>

<span class="left_title"></span>
</div>



<!-- begin mom and kid  -->	
    <div class="article-listing" style="padding-top:15px;">
        <div class="list">
            <span class="lblresult"></span>
            
                
           <?php if($list_theodanhmuc) { ?>    
         <?php foreach($list_theodanhmuc as $news) { ?>
                    <div class='item'>
                        
 		<?php if($news['hinh_anh']) {?>	
		<div class="image-border">
                            <a target='_self' style='display: table-cell;text-align: center; vertical-align: middle;   width:158px;   height:119px;' href='<?php echo $news['hinh_anh'];?>' class='image'><img alt='' src='<?php echo $news['hinh_anh'];?>' width='158'  height='119' class='image'/></a>
		</div>
		<?php } else{?>
                        
                         <?php } ?>

                        
                        <h2>
                            <a href="index.php?module=news&act=view&id=<?php echo $news['id_news']; ?>" class='title' target='_self'>
                                <?php echo $news['tieu_de'];?></a>
                        </h2>
                     
                        <span class="createdDate" style="paddin-top:5px;">[ <?php echo $news['add_date'];?> - <?php echo $news['luot_xem_id'];?> lượt xem]</span>
                        <span class="summary">
                            <?php echo $news['mo_ta'];?>.
                        </span>
                        <a href="index.php?module=news&act=view&id=<?php echo $news['id_news']; ?>" class='detail'>Xem chi tiết</a>
                        <div class="clear">
                        </div>
                    </div>
                <?php } ?>    
 <?php } else { ?>
 
<div class="warning">Chưa có nội dung ở mục này!</div>

<?php } ?>    
        </div>
  
    
    </div>
</div>
<div class="pagination"><?php echo $pagination; ?></div>
   
</div>