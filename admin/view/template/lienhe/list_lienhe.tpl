<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Liên Hệ
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=home">Trang Chủ</a></li>
        <li class="active">Liên Hệ</li>
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        




<div class="box box-warning">
    <div class="box-body">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              
				
				
              
                   
                    <div class="panel-body">
                        <div id="result" class="col-xs-12 table-responsive">


<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
    <thead>
        <tr>
		<th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
            <th class="text-center" style="padding-top: 20px;padding-bottom: 20px">
                STT
            </th>
            <th class="text-center">
                Tiêu Đề
            </th>
            <th class="text-center">
                Họ Và Tên
            </th>
            <th class="text-center">
                Điện Thoại
            </th>
           
            <th class="text-center">
                Email
            </th>
			  <th class="text-center">
                Nội Dung
            </th>
			 <th class="text-center">
                Thao Tác
            </th>
        </tr>
    </thead>
    <tbody>
  
        <?php if ($list_lienhe) { ?>
          <?php foreach ($list_lienhe as $lienhe) { ?>         
<tr>
<td style="text-align: center;"><?php if ($lienhe['id_news1']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $lienhe['ma_lien_he']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $lienhe['ma_lien_he']; ?>" />
              <?php } ?></td>

<td class="text-center" style="width: 2%;"> <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?> </td>
<td style="width: 20%"> <?php echo $lienhe['tieu_de']; ?> </td>
<td style="width: 12%"> <?php echo $lienhe['ten']; ?> </td>
<td class="text-center" style="width: 10%;"> <?php echo $lienhe['dien_thoai']; ?> </td>

<td class="text-center" style="width: 13%;"><?php echo $lienhe['email']; ?> </td>


 <td class="text-center" style="white-space:nowrap">
           <?php echo $lienhe['time']; ?>
                </td>
				
				 <td class="text-center" style="white-space:nowrap; width: 10%;">
                         [ <a href="index.php?module=lienhe&act=<?php echo "edit";?>&id=<?php echo $lienhe['ma_lien_he']; ?>"><i class="fa fa-pencil-square-o"></i></a> ]
						 [ <a href="javascript:confirmDelete('index.php?module=lienhe&act=del&id=<?=$lienhe['ma_lien_he']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a> ]
						 [	<a data-toggle="modal" data-target="#modal-default" href="index.php?module=lienhe&act=<?php echo "view";?>&id=<?php echo $lienhe['ma_lien_he']; ?>"><i class="fa fa-file" aria-hidden="true"></i> </a> ]
						 
<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
                Launch Default Modal
              </button>
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



                        </div>

                        
                    </div>
                </div>
            </div>

        </div>
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
            </section>
        </div>
		
								 	   <!-- /.popup -->
  <div class="modal fade" id="modal-default">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><?php echo $lienhe['tieu_de'];?></h4>
              </div>
              <div class="modal-body">
            
			
							<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<tbody>
								<tr class="bg-green">
									<th class="">Thông Tin</th>
								
							
								</tr>
<div>
<tr>
	<td>Họ và Tên: <?php echo $lienhe['ten'];?></td>
</tr>
<tr>
	<td>Địa chỉ: <?php echo $lienhe['ten'];?></td>
</tr>
<tr>
	<td>Điện thoại: <?php echo $lienhe['dien_thoai'];?></td>
</tr>
<tr>
	<td>Email: <?php echo $lienhe['email'];?></td>
</tr>
<tr>
	<td>Thời gian gửu: <?php echo $lienhe['time'];?></td>
</tr>
<tr>
	<td>Tiêu đề: <?php echo $lienhe['tieu_de'];?></td>
</tr>
</div>
	<tr class="bg-green">
									<th class="">Nội dung liên hệ</th>
								
							
								</tr>
								<tr>
	<td><?php echo $lienhe['noi_dung'];?></td>
</tr>
						
								</tbody>
								</table>
								</div>
			
			
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.end popup -->
<?php include('view/template/common/footer.tpl'); ?>