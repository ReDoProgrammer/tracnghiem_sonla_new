 <div id="section_content">
            


<div class="box740">
    <div class="box660">
        <ul class="mapPath">
            <li class="head"><a href="index.php?module=home" title="Trang chủ" class="south">Trang chủ</a></li>
            <li class="item"><a href="" title="<?php echo $tendanhmuc['title'];?>" class="south"><?php echo $tendanhmuc['title'];?></a></li>
            <li class="last">Bản tin công chứng</li>
        </ul>
    </div>
</div>

<div class="box660">

<div class="detail">
<h1><?php echo $thutuc['tieu_de'];?></h1>
<div class="sapo"> <?php echo $thutuc['tieu_de'];?> </div>

<div class="content" style="text-align: justify;">

<?php echo $thutuc['noi_dung'];?>

</div>


</div>






</div>
<div class="box660">
<ul class="mapPath">
<li class="first">Các thủ tục khác</li>

</ul>
<?php foreach($list_thutuc as $news) { ?>
<div class="consItems">
<a href="index.php?module=thutuc&act=view&id=<?php echo $news['id_news'];?>">
<img title="<?php echo $news['tieu_de'];?>" alt="" src="view/theme/default/image/arrow2.png">
<?php echo $news['tieu_de'];?>
</a>
</div>
<?php } ?>
</div>
</div>

