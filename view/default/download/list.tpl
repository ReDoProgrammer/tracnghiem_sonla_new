  <div class="row row-ex body">
            <div class="col col-ex col-sm-9 col-12 pr-0 col-9">
                <div class="container-fluid container-fluid-ex">
                    <div class="row row-ex">
                        <div class="col col-ex p-0">
                            <div class="card card-box list-news-box">
                                <div class="card-header">
                                    <span><img src='view/theme/default/image/icon-hoi.png'></span>
                                    <span class="title">Tài Liệu Khởi Nghiệp</span>
                                </div>
                                <div class="card-body">
                                    <div  data-src="wow">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker3.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.vi.min.js"></script>
        <style>
    .search-form {
        padding: 13px;
    }
    .search-form input,
    .search-form textarea,
    .search-form select {
        padding: 6px 13px;
        font-size: 13px;
        line-height: 1;
        border-radius: 0;
        max-height: 30px;
    }
    .search-form button {
        padding: 4px 14px;
        font-size: 13px;
        border-radius: 0;
    }
</style>
<form id="basic-search-form" action='' onsubmit="beforeSubmit(this)">
    <div class="row row-ex search-form">
        <div class="col col-ex col-sm-10 pr-1">
            <input type="text" name="keyword" class="form-control" value="" placeholder="Từ khóa">
        </div>
        <div class="col col-ex col-sm-2 pl-1">
            <button type="submit" class="btn w-100 action-search">Tìm kiếm</button>
        </div>
        <input type="hidden" name="type" value="DRAFT" />
        <input type="hidden" name="expired" value="1" />
        <input type="hidden" name="pageSize" value="15" />
        <input type="hidden" name="pageNumber" value="0" />
    </div>
</form>
<div class="row row-ex item-box">
    <div class="col col-ex col-sm-12">
        <div class="card card-box">
            <div class="card-header title">
                Sách Khởi Nghiệp
            </div>
            <div class="card-body">
                <table class="table table-bordered blue">
                    <colgroup>
                        <col style="width:35px" />
                        <col style="width:90px" />
                        <col style="width:auto" />
						<col style="width:150px" />
						<col style="width:80px" />
				
                    </colgroup>
                    <thead class="thead-blue">
                    <tr>
                        <th scope="col">STT</th>
						<th scope="col">Hình ảnh</th>
                        <th scope="col">Tên tập tin</th>
						 <th scope="col">Loại tài liệu</th>
						
                        <th scope="col">Lượt Tải</th>
                    </tr>
                    </thead>
                      <?php if($list_download) { ?>  

     <?php foreach ($list_download as $download) { ?>
	  <tbody id="list-legal-docs">
                   <tr>
<td scope="row"> <?php $i = $i+1; ?>
	<a> <?php echo $i;?>  </a>
   <?php  ?></td>
<td>
 <?php if($download['hinh_anh']){?>
<div class="image-border1">
<a class="image1" href="index.php?module=download&act=view&id=<?php echo $download['id_download'];?>" style="display: table-cell;text-align: center; vertical-align: middle; width:102px; height:72px;" target="_self">
<img class="image1" width="102" height="72" src="<?php echo $download['hinh_anh'];?>" alt="">
</a>
</div>

<?php } else{?>
<div class="image-border1">
<a class="image1" href="index.php?module=download&act=view&id=<?php echo $download['id_download'];?>" style="display: table-cell;text-align: center; vertical-align: middle; width:102px; height:72px;" target="_self">
<img class="image1" width="102" height="72" src="view/theme/default/image/download.png" alt="">
</a>
</div>
<?php } ?>
</td>
<td><a href="index.php?module=download&act=view&id=<?php echo $download['id_download'];?>"><?php echo $download['tieu_de'];?></a></td>
<td><?php echo $download['loai_tep_tin'];?></td>
<td><?php echo $download['luot_tai'];?></td>
</tr>
                    </tbody>
	 <?php } ?>
	 
	 	<?php } else { ?>
                    <tbody id="list-legal-docs">
                    <tr>
                        <td colspan="5" class="text-center">Chưa có dữ liệu hiển thị</td>
                    </tr>
                    </tbody>
					<?php } ?>
				
                </table>
            </div>
        </div>
    </div>
</div>



</div>
                                    <div  data-src="wow">
<style>
    .pagination .paging {
        padding-left: 30px;
    }
</style>



</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>