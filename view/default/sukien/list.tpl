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
<span class="title">Danh Sách Sự Kiện</span>
</div>


 <div class="card-body p-2">
               
			   
<div class="s-content">
<div class="cat-content">

     <?php foreach($list_sukien as $sukien) { ?>

	 <div class="view view-admin-su-kien view-id-admin_su_kien view-display-id-page_4 block-view-su-kien-country list-su-kien view-dom-id-5fef9613270f38f942018740404b964a">
<div class="view-content">
	 
	<div class="row">
	
<div class="col col-xs-12 col-lg-12">
<div class="views-field views-field-field-thoi-gian">
<div class="field-content">
<div class="bg_calandar">
<span class="times"> <?php echo date_format(date_create($sukien['time']),'H:i');?></span>
<span class="day">
<span><?php echo date_format(date_create($sukien['time']),'d');?></span>
<span class="month">
tháng
<span ng-bind="item.location[1].month"><?php echo date_format(date_create($sukien['time']),'m');?></span>
</span>
</span>
</div>
</div>
</div>
<div class="views-field views-field-title">
<span class="field-content">
<a href="index.php?module=sukien&act=view&id=<?php echo $sukien['id_sukien']; ?>"> <?php echo $sukien['tieu_de'];?></a>
</span>
</div>

<div class="views-field views-field-field-mo-ta">
<div class="field-content">
<p><?php echo $sukien['mo_ta'];?></p>
</div>
</div>
</div>

</div> 
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

