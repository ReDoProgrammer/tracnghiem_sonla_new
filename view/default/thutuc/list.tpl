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

<?php foreach($list_thutuc as $thutuc) { ?>
<div class="consItem">
<a href="index.php?module=thutuc&act=view&id=<?php echo $thutuc['id_thutuc'];?>">
<img title="<?php echo $thutuc['tieu_de'];?>" alt="picture" src="view/theme/default/image/arrow2.png">
</a>
<h3>
<a href="index.php?module=thutuc&act=view&id=<?php echo $thutuc['id_thutuc'];?>"><?php echo $thutuc['tieu_de'];?></a>
</h3>
<p><?php echo $thutuc['tieu_de'];?></p>
</div>
<?php } ?>
</div>
</div>

