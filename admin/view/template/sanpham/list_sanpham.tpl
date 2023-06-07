<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>




        <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Sản Phẩm OCOP
    </h1>
    <ol class="breadcrumb">
        <li><a href="">Tin Tức</a></li>
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
   <form action="" method="post" enctype="multipart/form-data" id="form">
  
<div class="well">
 

        <div class="row">
            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <input class="form-control" type="text" maxlength="104" name="tieu_de" placeholder="Từ khóa tìm kiếm" value="<?php echo $_SESSION['tieude'];?>"  />
                </div>
            </div>
            <div class="col-xs-12 col-md-4">
                <div class="form-group">
                    <select class="form-control" name="muc_id">
                     <option value="">---Tìm kiếm theo danh mục---</option>
					 <?php foreach ($list_dm as $dm) { ?>
					
				 <?php if ($_SESSION['mucid'] == $dm['id_danh_muc']) { ?>
                         <option value="<?php echo $dm['id_danh_muc'];?>" selected><?php echo $dm['ten_danh_muc_sp']; ?></option>
				<?php } else { ?>
					<option value="<?php echo $dm['id_danh_muc'];?>"><?php echo $dm['ten_danh_muc_sp']; ?></option>
					  <?php } ?>
					    <?php } ?>
                    </select>
                </div>
            </div>
        
            <div class="col-xs-12 col-md-2">
                <div class="form-group">
              
                  	<input class="btn btn-primary" name="search"  type="hidden" value="1" />
                    <input class="btn btn-primary" type="submit" value="Tìm kiếm" />
              
                </div>
            </div>
           
        </div>
       
        <label><em>Từ khóa tìm kiếm không ít hơn 2 ký tự, không lớn hơn 64 ký tự, không dùng các mã html</em></label>
  
</div>

     
          

			
            <div id="result">
		
<div class="col-xs-12 table-responsive">
			
				<?php if ($_SESSION['tieude']) { ?>
				
					<div class="panel panel-success">			
			<div class="panel-heading">
<h3 class="panel-title"><?php echo $_SESSION['tieude']; ?></h3>
</div>

<?php } unset($_SESSION['tieude']); ?>

<p class="text-right">

       <div class="pagination1"><?php echo $pagination; ?></div>
   </p>
	

<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0">
    <tbody><tr>
	
	<th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
        <th class="text-center">
            STT
        </th>
      
        <th class="text-center">
            Tiêu Đề
        </th>
		 <th class="text-center">
                Hình Ảnh
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
           Giá
        </th>
        <th class="text-center">
           Điện Thạo
        </th>
         <th class="text-center">
           Sửa
        </th>
		 <th class="text-center">
          Xóa
        </th>
    </tr>
	
	   <?php if ($list_sanpham) { ?>
          <?php foreach ($list_sanpham as $sanpham) { ?>
            <tr>
			       <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $sanpham['id_sp']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $sanpham['id_sp']; ?>" />
              <?php } ?></td>
			  
                <td class="text-center">
                    <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
				
				<td style="width: 4%"> <a href ="<?php echo $sanpham['hinh_anh']; ?>"class="thickbox" rel="shadowbox" title="<?php echo $sanpham['tieu_de']?>"> 
            <img src ="<?php echo $sanpham['hinh_anh'];?>" class="bimg" width="40" height ="40"/>
            </a> </td>
               
                <td>
                    <?php echo $sanpham['tieu_de']; ?>
                </td>
				
                <td class="text-center">

					<?php echo date_format(date_create($sanpham['time']),'d/m/Y');?>
				
                </td>
				 <td class="text-center">

					<?php echo $sanpham['luot_xem_id']; ?>
				
                </td>
                <td class="text-center">
                        <span class="label label-success">     <?php echo $sanpham['ten_danh_muc_sp']; ?></span>
                </td>
                <td class="text-center">
                     <?php if($sanpham['gia']) {?>
            <?php echo number_format($sanpham['gia'],0,',',','); ?><font size="2"> VNĐ</font>
            <?php } else{?>
           <span class="label label-success" style="color: red;"> <?php echo "Liên hệ";?></span>
            <?php } ?>
                </td>
                <td class="text-center" style="white-space:nowrap">
                    <a href=""><?php echo $sanpham['phone']; ?></a>
                </td>
                 <td class="text-center" style="white-space:nowrap">
                    <a href="index.php?module=sanpham&act=<?php echo "edit";?>&id=<?php echo $sanpham['id_sp']; ?>"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a>
			
                </td>
                <td class="text-center">
                    <a href="javascript:confirmDelete('index.php?module=sanpham&act=del&id=<?=$sanpham['id_sp']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a>
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


<div class="pagination-container"><ul class="pagination"><li class="active"><a><?php echo $pagination; ?></a></li></ul></div>
            </div>
			</form> 	
		
   </div>
</div>


                    </div>
                </div>
            </section>
        </div>
        
  

<?php include('view/template/common/footer.tpl'); ?>