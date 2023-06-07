<div class="row row-ex body">
<div class="col col-ex col-sm-9 col-12 pr-0 col-9">
<div class="container-fluid container-fluid-ex">

<div data-src="wow">

<div class="row row-ex">
<div class="col col-ex p-0">
<div class="card card-box">
<div class="card-header">
<span>
<img src="view/theme/default/image/icon_cts.png">
</span>
<span class="title">Dự Án Khởi Nghiệp</span>
</div>


 <div class="card-body p-2">
               
			   
<div class="s-content">
<div class="cat-content">

     <?php foreach($list_duan as $duan) { ?>
<div class="cat-item">
 <?php if($duan['hinh_anh']) {?>	
<div class="cat-thumb">
<a href="index.php?module=duan&act=view&id=<?php echo $duan['id_duan']; ?>">
<img title="<?php echo $duan['tieu_de'];?>" alt="<?php echo $duan['tieu_de'];?>" src="<?php echo $duan['hinh_anh'];?>">
</a>
</div>
<?php } ?>
<div class="cat-caption">
<h4 class="title">
<a href="index.php?module=duan&act=view&id=<?php echo $duan['id_duan']; ?>"><?php echo $duan['tieu_de'];?></a>
</h4>
<div class="date cpost-info">
<p>
<span>
<i class="fa fa-user"></i>
<label>Quản trị</label>
</span>
<span>
<i class="fa fa-calendar-check-o"></i>
<label><?php echo $duan['time'];?></label>
</span>
<span>
<i class="fa fa-eye"></i>
Lượt xem:
<label><?php echo $duan['luot_xem_id'];?></label>
</span>
</p>
</div>
<div class="cat-des"><?php echo $duan['mo_ta']; ?></div>
</div>
</div>			   
<?php } ?>			   
			   
			   
</div>
</div>			   
			   
			   
			   
			   
			   
                
            </div>













</div>


</div></div>






</div>

</div>


</div>

