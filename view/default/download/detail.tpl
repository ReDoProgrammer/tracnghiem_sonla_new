<div class="row row-ex body">








<div class="col col-ex col-sm-9 col-12 pr-0 col-9">
<div class="container-fluid container-fluid-ex">

<div data-src="wow">

<div class="row row-ex">
<div class="col col-ex p-0">

 <div class="card card-box list-news-box">
                                <div class="card-header">
                                    <span><img src='view/theme/default/image/icon-phone.png'></span>
                                    <span class="title">Sách Khởi Nghiệp</span>
                                </div>
                                <div class="card-body">
                                    <div  data-src="wow">
 <div  data-src="wow">
<style>
    .col-ex.col-9 {
        max-width: 100%;

        padding-right: 13px!important;
    }
</style>
<div id="doc-view-row" class="row row-ex">
    <div class="col col-ex">
        <div id="doc-info">
		
		
		  <table class="table table-bordered blue">
                    <colgroup>
                      
                       
                    </colgroup>
                    <thead class="thead-blue">
                    <tr>
                        <th scope="col">Thông Tin</th>
                       
                       
                    </tr>
                    </thead>
       
				 <tbody id="list-legal-docs">
                    <tr>
                        <td colspan="4" class=""><?php if($ext == 'PDF' || $ext == 'pdf') { ?>
<iframe src = "view/javascript/ViewerJS/#<?php echo $download['file'];?>" width='720' height='800' allowfullscreen webkitallowfullscreen></iframe>
<?php } ?></td>
                    </tr>
                    </tbody>
            </table>
		
		
		
		
		
		
		
            <table class="table table-bordered blue">
                    <colgroup>
                        <col style="width:200px" />
                        <col style="width:auto" />
                       
                    </colgroup>
                    <thead class="thead-blue">
                    <tr>
                        <th scope="col">Thông Tin</th>
                        <th scope="col">Nội Dung</th>
                       
                    </tr>
                    </thead>
                <tbody id="list-legal-docs">
                                <tr>
                    <td scope="row" class="text-left">Tên tài liệu</td>
                    <td><?php echo $download['tieu_de'];?></td>
                </tr>
                                               
<!--											   <tr>
                    <td scope="row" class="text-left">Tên tập tin</td>
                    <td><?php echo $download['ten_tap_tin'];?></td>
                </tr>
                                
                <tr>
                                            <td scope="row" class="text-left">Loại tập tin</td>
                                                <td><?php echo $download['loai_tep_tin'];?></td>
                                                            </tr>
               
                <tr>
                    <td scope="row" class="text-left">Dung lượng</td>
                    <td><?php echo $download['dung_luong'];?></td>
                </tr>-->
                                <tr>
                    <td scope="row" class="text-left">Ngày chia sẻ</td>
                    <td><?php echo $download['time'];?></td>
                </tr>
                                                <tr>
                    <td scope="row" class="text-left">Lượt xem</td>
                    <td><?php echo $download['luot_xem'];?></td>
                </tr>
                <tr>
                    <td scope="row" class="text-left">Lượt tải</td>
                                        <td><?php echo $download['luot_tai'];?></td>
                                    </tr>
                <tr>
                    <td scope="row" class="text-left">Tập tin đính kèm</td>
                    <td>
                                                    <div id="attachments" style="text-align: center;">
													
                        
                                                                     <a href="<?php echo $download['file'];?>">
<img width="280" src="view/theme/default/image/download_button.png" style="text-align: center;">
</a>

                            </div>
                                            </td>
                </tr>
                </tbody>
				 <tbody id="list-legal-docs">
                    <tr>
                        <td colspan="4" class=""><?php echo $download['noi_dung'];?></td>
                    </tr>
                    </tbody>
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





<div class="card card-box list-news-box">
                                <div class="card-header">
                                    <span><img src='view/theme/default/image/word.png'></span>
                                    <span class="title">Tài liệu khởi nghiệp khác</span>
                                </div>
                                <div class="card-body">
                                    <div  data-src="wow">

<style>
    .col-ex.col-9 {
        max-width: 100%;
        flex: 100%;
        padding-right: 13px!important;
    }
</style>

 
 <div class="related-content">
<div class="row cat-content">
<?php foreach($list_download as $news) { ?>
<div class="col-xs-3 col-md-3 text-center">
<div class="thumbnail cw-item">
<a href="index.php?module=download&act=view&id=<?php echo $news['id_download'];?>">
<div class="cwi-thumb">
<img title="12 chủ đề giáo dục trẻ vị thành niên" src="view/theme/default/image/download.png" width="100">
</div>
</a>
<div class="cwi-caption">
<h2 class="cwi-title">
<a href="index.php?module=download&act=view&id=<?php echo $news['id_download'];?>"><?php echo $news['tieu_de'];?></a>
</h2>
<p class="cwi-download">
<i class="fa fa-download"></i>
<label>57</label>
lượt tải
</p>
</div>
</div>
</div>

<?php } ?>



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






</div></div>


</div>

</div>


</div>

