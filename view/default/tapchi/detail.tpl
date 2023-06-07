
        
<div class="center_panel">
    
<div class="news_box_skhvdt">

<div class="news_box_title">
<span class="right_title"></span>
<a href="index.php?module=home">Trang chủ<div class="ArrowRoad"></div></a> <a href="index.php?module=tapchi&act=list">Tạp chí suối reo</a>
<span class="left_title"></span>
</div>
<div class="cont_skhvdt1">

    <div class="article-detail">
        <div class="title">
           
            <h1><span class="bullet-li" style="font-size:14px;"><?php echo $tapchi['tieu_de'];?></span></h1>
            
     
          
            
<div class="BottomToolbar">
    <div class="update">
        Cập nhật: <?php echo date_format(date_create($tapchi['time']),'H:i:s - d / m / Y');?>
    </div>
    <div class="pageview">
        Lượt xem: <?php echo $tapchi['view'];?>
    </div> 
       

</div>



        </div>
        </div>
        <div class="clear"></div>
<?php if($tapchi['mo_ta']){?>       
<div class="tomtat1" style="padding-bottom:10px;">
<?php echo $tapchi['mo_ta'];?>
</div>
<?php } ?>
<div class="text1" style="">
<p>
<?php if($ext == 'pdf') { ?>
<iframe src = "view/javascript/ViewerJS/#<?php echo $tapchi['file'];?>" width='775' height='900' allowfullscreen webkitallowfullscreen></iframe>
<?php } ?>
</div>

<a class="download" href= "javascript:confirmDownload('index.php?module=tapchi&act=download&id=<?=$tapchi['id'];?>')"  ></a>

<div class="article_reference">
<div class="caption" style="border-top: 1px solid #f0f0f0;">
<a class="Tin liên quan">Các thể loại tạp chí khác:</a>
</div>
<div class="list">
<ul>
<?php foreach($list_tapchi as $tapchi) { ?>
<li class="123">
<a target="_self" href="index.php?module=tapchi&act=view&id=<?php echo $tapchi['id']; ?>"> <?php echo $tapchi['tieu_de'];?></a>
</li>
<?php } ?>


</ul>
</div>
</div>

</div>
</div>
</div>