<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách tin bài
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
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Tìm kiếm</h3>
                    </div>
                    <div class="panel-body">
<form action="" method="post" enctype="multipart/form-data" id="form">
                          <div class="row" style="margin-bottom: 10px">
                               
                                <div class="col-sm-4">
                                    <label>Tìm kiếm</label>
                                 
				       <div class="input-group input-group-sm">
                <input type="text" class="form-control" name="title" value="<?php echo $_SESSION['tieude'];?>"/>
                    <span class="input-group-btn">
                      <button type="submit" class="btn btn-info btn-flat">Tìm Kiếm!</button>
                    </span>
              </div>
				   
								   
                                </div>
                            </div>
                       
                   </div>
  
                </div>
				
				
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
                        <div id="result" class="col-xs-12 table-responsive">


<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
    <thead>
        <tr>
            <th class="text-center" style="padding-top: 20px;padding-bottom: 20px">
                STT
            </th>
			<th class="text-center">
                Hình ảnh
            </th>
            <th class="text-center">
                Tiêu đề
            </th>
            <th class="text-center">
                Họ Và Tên
            </th>
            <th class="text-center">
                Địa Chỉ Email
            </th>
			 <th class="text-center">
                Điện thoại
            </th>
            <th class="text-center">
               Địa chỉ
            </th>
         
			  <th class="text-center">
                Thời gian hỏi
            </th>
			 <th class="text-center">
                Thao Tác
            </th>
        </tr>
    </thead>
    <tbody>
    <?php if ($list_bbt) { ?>
          <?php foreach ($list_bbt as $bbt) { ?>         
<tr>
 <td class="text-center">
                      <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
				<td style="width: 6%"> <a href ="<?php echo $bbt['files']; ?>"class="thickbox" rel="shadowbox" title="<?php echo $bbt['tieu_de']?>"> 
            <img src ="<?php echo $bbt['files'];?>" class="bimg" width="80" height ="80"/>
            </a> </td>
<td style="width: 30%"> <?php echo $bbt['tieu_de']; ?> </td>
<td style="width: 15%"> <?php echo $bbt['ho_ten']; ?> </td>
<td class="text-center" style="width: 15%;"> <?php echo $bbt['email']; ?> </td>
<td class="text-center" style="width: 15%;"> <?php echo $bbt['dien_thoai']; ?> </td>

<td class="text-center"><?php echo $bbt['dia_chi']; ?> </td>


 <td class="text-center" style="white-space:nowrap">
           <?php echo date_format(date_create($bbt['time']),'d/m/Y'); ?>
                </td>
				
				 <td class="text-center" style="white-space:nowrap">
                         [ <a href="index.php?module=bbt&act=<?php echo "edit";?>&id=<?php echo $bbt['id_bbt']; ?>"><i class="fa fa-pencil-square-o"></i></a> ]
						 [ <a href="javascript:confirmDelete('index.php?module=bbt&act=del&id=<?=$bbt['id_bbt']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a> ]
						 [	<a href="index.php?module=bbt&act=<?php echo "view";?>&id=<?php echo $bbt['id_bbt']; ?>"><i class="fa fa-file" aria-hidden="true"></i> </a> ]
                </td>

</tr>
  <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>


    </tbody>
</table>




               	<p class="text-right">
         <div class="pagination1"><?php echo $pagination; ?></div>
    </p>
	
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