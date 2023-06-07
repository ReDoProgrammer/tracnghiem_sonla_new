<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        <?php echo $bbt['tieu_de'];?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="">Trang Chủ</a></li>
        <li class="active">Danh sách các tin bài</li>
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        



    <style>
    @media print {
        #tieude .col-sm-3 {
            width: 28%;
        }

        #tieude .col-sm-5 {
            width: 44%;
        }

        #tieude .col-sm-4 {
            width: 28%;
        }
    }
</style>
    <form action="" method="post" enctype="multipart/form-data" id="form">
<div class="box box-warning">
    <div class="box-body">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
             
				
				
					   	 <div class="row" style="margin-bottom: 5px;">
          <!--  <div class="col-sm-12 text-right">
               <a onclick="location = '<?php echo $link_add; ?>'" class="btn bg-aqua btn-flat btn-margin"><i class="fa fa-floppy-o"></i>&nbsp;&nbsp;Thêm mới</a>
            </div>-->
        </div>
				
                <div class="panel panel-success">
				<?php if($_SESSION['tieude']){?>
                    <div class="panel-heading">
                        <h3 class="panel-title">Kết quả tìm kiếm: <?php echo $_SESSION['tieude'];?></h3>
                    </div>
					<?php } ?>
                    <div class="panel-body">
    
	
								<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<tbody>
								<tr class="bg-green">
									<th>Thông Tin</th>
								
							
								</tr>
<div>

<tr>

	<td>Họ và Tên: <?php echo $bbt['ho_ten'];?></td>
</tr>
<tr>
	<td>Địa chỉ: <?php echo $bbt['dia_chi'];?></td>
</tr>
<tr>
	<td>Điện thoại: <?php echo $bbt['dien_thoai'];?></td>
</tr>
<tr>
	<td>Email: <?php echo $bbt['email'];?></td>
</tr>
<tr>
	<td>Thời gian gửu: <?php echo $bbt['time'];?></td>
</tr>
<tr>
	<td>Tiêu đề: <?php echo $bbt['tieu_de'];?></td>

</tr>
<tr>
	<td>File đính kèm: <?php echo $bbt['files'];?> | Tải file:  <a href= "<?php echo $bbt['files'];?>" class="btn btn-primary btn-xs"><i class="fa fa-download" aria-hidden="true"></i> Tải về tại đây</a></td>

</tr>

</div>
	<tr class="bg-green"><th class="">Mô tả bài viêt</th></tr>
								<tr>
	<td><?php echo $bbt['mo_ta'];?></td>
</tr>
	<tr class="bg-green"><th class="">Nội dung bài viêt</th></tr>
								<tr>
	<td><?php echo $bbt['noi_dung'];?></td>
</tr>
					
								</tbody>
								</table>
								
								</div>
	
	
	
	



                        <div id="ketqua">
                            <hr style=" border: 1px solid #ccc; border-top: none">
                            <div id="ketquabaocao">

                            </div>
                            <div class="form-group text-right groupbutton">
                                <button type="button" class="btn bg-green print"><i class="fa fa-print" aria-hidden="true"></i>&nbsp;In</button>
                                <button type="button" class="btn bg-red close-form"><i class="fa fa-times" aria-hidden="true"></i>&nbsp;Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</form> 

                    </div>
                </div>
            </section>
        </div>
<?php include('view/template/common/footer.tpl'); ?>