<div class="row row-ex body">








<div class="col col-ex col-sm-9 col-12 pr-0 col-9">
<div class="container-fluid container-fluid-ex">

<div data-src="wow">

<div class="row row-ex">
<div class="col col-ex p-0">

 <div class="card card-box list-news-box">
                                <div class="card-header">
                                    <span><img src='view/theme/default/image/icon-phone.png'></span>
                                    <span class="title">Thông Tin : <font color="red"><?php echo $cts['email'];?></font></span>
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
                        <col style="width:200px" />
                        <col style="width:auto" />
                       
                    </colgroup>
                    <thead class="thead-blue">
                    <tr>
                        <th scope="col">Thông Tin</th>
                        <th scope="col">Tình Trạng</th>
                       
                    </tr>
                    </thead>
                <tbody id="list-legal-docs">
				    <tr>
                    <td scope="row" class="text-left">Tình Trạng</td>
                    <td><font color="red"> <?php if($cts['tinh_trang']=='0') { ?>
<span class="badge bg-red ng-scope">Đang chờ</span>

		 <?php } else 
			   if($cts['tinh_trang']=='1') { ?>
				<span class="badge bg-green ng-scope">Hoạt Động</span>
		   <?php } ?>			</font></td>
                </tr>
                                <tr>
                    <td scope="row" class="text-left">Mã Chứng Thư</td>
                    <td><?php echo $cts['ma_chung_thu'];?></td>
                </tr>
                                                <tr>
                    <td scope="row" class="text-left">Ngày kích hoạt</td>
                    <td><?php echo $cts['ngay_bat_dau'];?></td>
                </tr>
                                
                <tr>
                     <td scope="row" class="text-left">Ngày hết hạn</td>
                      <td><?php echo $cts['ngay_ket_thuc'];?></td>
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








</div></div>


</div>

</div>


<div class="container-fluid container-fluid-ex">

<div data-src="wow">

<div class="row row-ex">
<div class="col col-ex p-0">

 <div class="card card-box list-news-box">
                                <div class="card-header">
                                    <span><img src='view/theme/default/image/icon-phone.png'></span>
                                    <span class="title">Nội Dung Thông Tin :</font></span>
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
                    <td scope="row" class="text-left">Cá Nhân - Tổ Chức</td>
                    <td><?php if($cts['tochuc_canhan_id']=='1') {echo "Cá Nhân" ;}
											else if($cts['tochuc_canhan_id']=='2'){echo "Tổ Chức" ;}
									?></td>
                </tr>
                                <tr>
                    <td scope="row" class="text-left">Địa chỉ Email</td>
                    <td><?php echo $cts['email'];?></td>
                </tr>
                                                <tr>
                    <td scope="row" class="text-left">Họa và tên</td>
                    <td><?php echo $cts['ho_ten'];?></td>
                </tr>
                                
                <tr>
                                            <td scope="row" class="text-left">Ngày sinh</td>
                                                <td><?php echo $cts['ngay_sinh'];?></td>
                                                            </tr>
               
                <tr colspan=3>
                    <td scope="row" class="text-left">Số CMT</td>
				
                    <td>
					  <table>
                    <colgroup>
                        <col style="width:200px" />
                        <col style="width:auto" />
						<col style="width:auto" />
                       
                    </colgroup>
					
                                <tr>
                    <td><?php echo $cts['so_cmt'];?></td>
                    <td><?php echo $cts['ngay_cap'];?></td>
					   <td><?php echo $cts['noi_cap'];?></td>
                </tr>
                        
				
					
					 </table>
					</td>
				
			
                </tr>
                                <tr>
                    <td scope="row" class="text-left">Tên Cơ quan đơn vị</td>
                    <td><?php echo $cts['ten_co_quan'];?></td>
                </tr>
                                                <tr>
                    <td scope="row" class="text-left">Tỉnh thành phố</td>
                    <td><?php echo $cts['tinh_thanh'];?></td>
                </tr>
                <tr>
                    <td scope="row" class="text-left">Chức vụ</td>
                                        <td><?php echo $cts['chuc_vu'];?></td>
                                    </tr>
									   <tr>
                    <td scope="row" class="text-left">Chức danh thẩm quyền</td>
                                        <td><?php echo $cts['chuc_danh'];?></td>
                                    </tr>
									   <tr>
                    <td scope="row" class="text-left">Địa chỉ</td>
                                        <td><?php echo $cts['dia_chi'];?></td>
                                    </tr>
									   <tr>
                    <td scope="row" class="text-left">Điện thoại</td>
                                        <td><?php echo $cts['dien_thoai'];?></td>
                                    </tr>
									   <tr>
                    <td scope="row" class="text-left">Điện thoại bàn</td>
                                        <td><?php echo $cts['may_ban'];?></td>
                                    </tr>
              
                </tbody>
				 <tbody id="list-legal-docs">
                    <tr>
                        <td colspan="4" class=""><?php echo $cts['ghi_chu'];?></td>
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








</div></div>


</div>

</div>



</div>

