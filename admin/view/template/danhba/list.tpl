<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>




        <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách 
    </h1>
    <ol class="breadcrumb">
        <li><a href="">Danh bạ</a></li>
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
   <!-- <form action="" method="post" enctype="multipart/form-data" id="form">
  
<div class="well">
 

        <div class="row">
            <div class="col-xs-12 col-md-6">
                <div class="form-group">
                    <input class="form-control" type="text" value="<?php echo $_SESSION['tieude'];?>" maxlength="104" name="tieu_de" placeholder="Từ khóa tìm kiếm" />
                </div>
            </div>
            <div class="col-xs-12 col-md-4">
                <div class="form-group">
                    <select class="form-control" name="dm_id">
                     <option value="">---Tìm kiếm theo danh mục---</option>
					 <?php foreach ($list_dmdanhba as $dm) { ?>
					
				<?php if($_SESSION['dm_id']== $dm['id']) { ?>
                         <option value="<?php echo $dm['id'];?>" selected><?php echo $dm['title']; ?></option>
				<?php } else { ?>
					<option value="<?php echo $dm['id'];?>"><?php echo $dm['title']; ?></option>
					  <?php } ?>
					    <?php } ?>
                    </select>
                </div>
            </div>
        
            <div class="col-xs-12 col-md-2">
                <div class="form-group">
              
                    <input class="btn btn-primary" type="submit" value="Tìm kiếm" />
              
                </div>
            </div>
           
        </div>
       
        <label><em>Từ khóa tìm kiếm không ít hơn 2 ký tự, không lớn hơn 64 ký tự, không dùng các mã html</em></label>
  
</div>

  </form> -->     
          

			
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
                Hình Ảnh
            </th>
			 <th class="text-center">
            Họ và tên
        </th>
        <th class="text-center" style="white-space:nowrap">
            Điện thoại
        </th>
		 <th class="text-center" style="white-space:nowrap">
            Email
        </th>
        <th class="text-center">
           Chức vụ
        </th>
        <th class="text-center">
         Phòng ban
        </th>
         <th class="text-center">
           Sửa
        </th>
		 <th class="text-center">
          Xóa
        </th>
    </tr>
	
	   <?php if ($list_danhba) { ?>
          <?php foreach ($list_danhba as $danhba) { ?>
            <tr>
			       <td style="text-align: center;"><?php if ($danhba['id_sp']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $danhba['id_sp']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $danhba['id_sp']; ?>" />
              <?php } ?></td>
			  
			  
			  
                <td class="left"><?php echo $danhba['stt']; ?></td>
				
				
                <?php if($danhba['hinh_anh']){?>
            <td class="left" width="50">
              <a href="<?php echo $danhba['hinh_anh']; ?>"class="thickbox" rel="shadowbox">
              <img src ="<?php echo $danhba['hinh_anh'];?>" class="bimg" width="50" height ="50"/>
             </a>
             </td>
            <?php } else{?>
              <td class="left" width="50">

              <img src ="../data/images/users/thanhvien.png" class="bimg" width="50" height ="50"/>

           </td>
            <?php } ?>
				
			   <td class="left"><?php echo $danhba['ho_ten']; ?></td>
            <td class="left"><?php echo $danhba['dien_thoai']; ?></td>
            <td class="left"><?php echo $danhba['email']; ?></td>
            <td class="left"><?php echo $danhba['chuc_vu']; ?></td>
            <td class="left"><?php echo $danhba['tieu_de']; ?></td>
               
                 <td class="text-center" style="white-space:nowrap">
                    <a href="index.php?module=danhba&act=<?php echo "edit";?>&id=<?php echo $danhba['id_danhba']; ?>"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a>
			
                </td>
                <td class="text-center">
                    <a href="javascript:confirmDelete('index.php?module=danhba&act=del&id=<?=$danhba['id_danhba']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a>
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
<div class="pagination-container"><ul class="pagination"><li class="active"><a>1</a></li></ul></div>
            </div>
			
		
   </div>
</div>


                    </div>
                </div>
            </section>
        </div>
        
  

<?php include('view/template/common/footer.tpl'); ?>