


<div class="box-border">
    
<div class="nav">
    <h1>
        <a class='home' href='index.php?module=home'>Trang chủ</a> <a href='index.php?module=home' target='_self' class='arr'>Tin tức</a><a href='index.php?module=home' target='_self' class='arr'><?php echo $tendanhmuc['title'];?></a>
    </h1>
</div>

    <div class="article-listing">
        <div class="list">
            <span id="ctl00_cphMain_ArticleListing1_lblResult" class="lblresult"></span>
            
                
         <?php foreach($list_theodanhmuc as $news) { ?>
                    <div class='item'>
                        <div class="image-border">
                            <a target='_self' style='display: table-cell;text-align: center; vertical-align: middle;   width:158px;   height:119px;' href='<?php echo $news['hinh_anh'];?>' class='image'><img alt='' src='<?php echo $news['hinh_anh'];?>' width='158'  height='119' class='image'/></a>
                        </div>
                        <h2>
                            <a href="index.php?module=news&act=view&id=<?php echo $news['id_news']; ?>" class='title' target='_self'>
                                <?php echo $news['tieu_de'];?></a>
                        </h2>
                     
                        <span class="createdDate" style="paddin-top:5px;">[<?php echo $news['time'];?> - <?php echo $news['luot_xem_id'];?> lượt xem]</span>
                        <span class="summary">
                            <?php echo $news['mo_ta'];?>.
                        </span>
                        <a href="index.php?module=news&act=view&id=<?php echo $news['id_news']; ?>" class='detail'>Xem chi tiết</a>
                        <div class="clear">
                        </div>
                    </div>
                <?php } ?>         
        </div>
        <div class='pager pager'></div>
    
    </div>
</div>

   
