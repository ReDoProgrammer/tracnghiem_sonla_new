<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>




        <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh sách tiêu chí NTM
    </h1>
    <ol class="breadcrumb">
        <li><a href="">Tiêu chí nông thôn mới</a></li>
        <li class="active">Danh sách</li>
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        



<div class="box box-warning">
    <div class="box-body">
        <div class="row">
            <div class="col-sm-12 text-right">
                <a onclick="location = '<?php echo $link_add; ?>'" class="btn bg-aqua btn-flat btn-margin"><i class="fa fa-floppy-o"></i>&nbsp;&nbsp;Thêm mới</a>
            </div>
        </div>

<p></p>
    

			
            <div id="result" class="col-xs-12 table-responsive">


	<?php if ($error_warning) { ?>
	<div class="panel panel-success">			
			<div class="panel-heading">
<h3 class="panel-title">Kết quả tìm kiếm</h3>
</div>
</div>
	<?php } ?>

<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0">
    <tbody><tr>
	
	<th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
        <th class="text-center">
            STT
        </th>
      
        <th class="text-center">
            Tiêu Đề
        </th>
		
        <th class="text-center" style="white-space:nowrap">
            Ngày Đăng
        </th>
		 <th class="text-center" style="white-space:nowrap">
            Lượt Xem
        </th>
        <th class="text-center">
           Danh Mục
        </th>
       
         <th class="text-center">
           Sửa
        </th>
		 <th class="text-center">
          Xóa
        </th>
    </tr>
	
	   <?php if ($list_tieuchi) { ?>
          <?php foreach ($list_tieuchi as $tieuchi) { ?>
            <tr>
			       <td style="text-align: center;"><?php if ($tieuchi['id_sp']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $tieuchi['id_sp']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $tieuchi['id_sp']; ?>" />
              <?php } ?></td>
			  
                <td class="text-center">
                    <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
				
			
               
                <td>
                    <?php echo $tieuchi['tieu_de']; ?>
                </td>
				
                <td class="text-center">

					<?php echo date_format(date_create($tieuchi['time']),'d/m/Y');?>
				
                </td>
				 <td class="text-center">

					<?php echo $tieuchi['luot_xem_id']; ?>
				
                </td>
                <td class="text-center">
                        <span class="label label-success">	<?php echo $tieuchi['ten_dm']; ?></span>
                </td>
               
              
                 <td class="text-center" style="white-space:nowrap">
                    <a href="index.php?module=tieuchi&act=<?php echo "edit";?>&id=<?php echo $tieuchi['id_tieuchi']; ?>"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a>
			
                </td>
                <td class="text-center">
                    <a href="javascript:confirmDelete('index.php?module=tieuchi&act=del&id=<?=$tieuchi['id_tieuchi']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a>
                </td>
            </tr>
		  <?php } ?>
   <?php } else { ?>
    <tbody>
            <tr>
                <td colspan="9" class="text-center text-red text-bold">Không tồn tại dữ liệu</td>
            </tr>
    </tbody>
   <?php } ?>
         
         
          
          
</tbody></table>

	</form> 

<p class="text-right">
         <div class="pagination1"><?php echo $pagination; ?></div>
    </p>
            </div>
			
		
   </div>
</div>


                    </div>
                </div>
            </section>
        </div>
        
  

<?php include('view/template/common/footer.tpl'); ?>