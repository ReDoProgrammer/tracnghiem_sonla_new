<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Video - Clip
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=home">Trang Chủ</a></li>
        <li class="active">Video - Clip</li>
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        




<div class="box box-warning">
    <div class="box-body">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              
				 <div class="row" style="margin-bottom: 5px;">
            <div class="col-sm-12 text-right">
               <a onclick="location = '<?php echo $link_add; ?>'" class="btn bg-aqua btn-flat btn-margin"><i class="fa fa-floppy-o"></i>&nbsp;&nbsp;Thêm mới</a>
            </div>
        </div>
				
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Danh Sách Video Clip: </h3>
                    </div>
				
            
                   
                    <div class="panel-body">
                        <div id="result">


<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
    <thead>
        <tr>
		<th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
            <th class="text-center" style="padding-top: 20px;padding-bottom: 20px">
                STT
            </th>
            <th class="text-center">
                Hình Ảnh
            </th>
            <th class="text-center">
                Tiêu Đề
            </th>
            <th class="text-center">
                Video Nổi Bật
            </th>
           
            <th class="text-center">
                Lượt Xem
            </th>
			  <th class="text-center">
                Thời Gian Đăng </th>
				
								
			 <th class="text-center">
                Thao Tác
            </th>
        </tr>
    </thead>
    <tbody>
  
        
          <?php if ($list_quayphim) { ?>
          <?php foreach ($list_quayphim as $quayphim) { ?>       
<tr>
<td style="text-align: center;"><?php if ($adv['id_adv']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quayphim['ma_quay_phim']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quayphim['ma_quay_phim']; ?>" />
              <?php } ?></td>

<td class="text-center" style="width: 2%;"> 1 </td>
<td style="width: 20%"> <a href ="<?php echo $quayphim['hinh_anh']; ?>"class="thickbox" rel="shadowbox" title="<?php echo $quayphim['tieu_de']?>"> 
            <img src ="<?php echo $quayphim['hinh_anh'];?>" class="bimg" width="80" height ="80"/>
            </a> </td>
<td style="width: 12%">  <?php echo $quayphim['tieu_de']; ?></td>
<td class="text-center" style="width: 10%;">   <?php if($quayphim['noi_bat']=='0') {echo "Video" ;}
            else if($quayphim['noi_bat']=='1'){echo "Video nổi bật" ;}
         ?> </td>

<td class="text-center" style="width: 13%;"><?php echo $adv['view_id']; ?> </td>


 <td class="text-center" style="white-space:nowrap">
           <?php echo date_format(date_create($adv['time']),'H:i:s | d-m-Y');?>; ?>
                </td>
			
				 <td class="text-center" style="white-space:nowrap; width: 10%;">
                         [ <a href="index.php?module=adv&act=<?php echo "edit";?>&id=<?php echo $adv['id_adv']; ?>"><i class="fa fa-pencil-square-o"></i></a> ]
						 [ <a href="javascript:confirmDelete('index.php?module=adv&act=del&id=<?=$adv['id_adv']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a> ]
						 [	<a href="index.php?module=adv&act=<?php echo "account";?>&id=<?php echo $adv['id_adv']; ?>"><i class="fa fa-file" aria-hidden="true"></i> </a> ]
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


                    </div>
                </div>
            </section>
        </div>
<?php include('view/template/common/footer.tpl'); ?>