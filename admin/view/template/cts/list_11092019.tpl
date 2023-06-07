<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Đăng Ký CTS OnLine
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=cts&act=list">Danh Sách CTS Online</a></li>
        <li class="active">Danh Sách</li>
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
            <div class="col-xs-12 col-md-4">
                <div class="form-group">

                    <input class="form-control" type="text" value="<?php echo $_SESSION['ten'];?>" maxlength="64" name="ho_ten" placeholder="Tìm kiếm theo họ tên" />
                </div>
            </div>
			
			  <div class="col-xs-12 col-md-3">
                <div class="form-group">

                    <input class="form-control" type="text" value="<?php echo $_SESSION['so_cmt'];?>" maxlength="64" name="so_cmt" placeholder="Tìm kiếm theo số CMTND" />
                </div>
            </div>
            <div class="col-xs-12 col-md-3">
		
                <div class="form-group">
		
                    <select class="form-control" name="tochuc_canhan_id">
          <option value="0">--Tổ Chức - Cá Nhân--</option>
		  
		  <?php if($_SESSION['tochuc_canhan_id']=='1'){ ?>
                        <option value="1" selected="selected" >Cá Nhân</option>
                      <?php } else { ?>
          <option value="1"><?php echo "Cá Nhân"; ?></option>
          <?php } ?>
		   <?php if($_SESSION['tochuc_canhan_id']=='2'){ ?>
                        <option value="2" selected="selected" >Tổ Chức</option>
                      <?php } else { ?>
          <option value="2"><?php echo "Tổ Chức"; ?></option>
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
      
        <label><em>Từ khóa tìm kiếm thông tin cá nhân tổ chức đăng ký chữ ký số</em></label>
    </form>
</div>

       
            <div id="result">
		
<div class="col-xs-12 table-responsive">
			
				<?php if ($_SESSION['ten']) { ?>
				
					<div class="panel panel-success">			
			<div class="panel-heading">
<h3 class="panel-title"><?php echo $_SESSION['ten']; ?></h3>
</div>

<?php } unset($_SESSION['ten']); ?>

<p class="text-right">

       <div class="pagination1"><?php echo $pagination; ?></div>
   </p>
	
	

	
<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0">
    <tbody><tr>
        <th class="text-center">
            STT
        </th>
       
        <th class="text-center">
            Họ Và Tên
        </th>
		<th class="text-center">
            Ngày Sinh
        </th>
		
        <th class="text-center" style="white-space:nowrap">
            Số CMTND
        </th>
		 <th class="text-center" style="white-space:nowrap">
            Ngày Cấp
        </th>
		<th class="text-center" style="white-space:nowrap">
            Điện Thoại
        </th>
		
		<th class="text-center" style="white-space:nowrap">
            Tình Trạng
        </th>
		
        <th class="text-center">
            Email
        </th>
        <th class="text-center">
            Đối Tượng
        </th>
       <th class="text-center text-green">Xem</th>
	   <th class="text-center text-green">Sửa</th>
<th class="text-center text-red">Xóa</th>
    </tr>

    </tr>
           
        
         
           
         
        <?php if ($list_cts) { ?>
          <?php foreach ($list_cts as $cts) { ?>  
            <tr>
                <td class="text-center">
                      <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
               
                <td>				
				<?php $v = $cts['view']; ?>				
				<?php if($v==0) { ?>
                  <b> <?php echo $cts['ho_ten']; ?></b>				
				  <?php } else if($v==1){ ?>				 
				  <?php echo $cts['ho_ten']; ?>				 
				  <?php } ?>
                </td>
				
				<td class="text-center">

                   <?php echo $cts['ngay_sinh']; ?>
                </td>
				
                <td class="text-center">

                        <?php echo $cts['so_cmt']; ?>
                </td>
				
				<td class="text-center">

                  <?php echo $cts['ngay_cap']; ?>
                </td>
				
				<td class="text-center">

                    <?php echo $cts['dien_thoai']; ?>
                </td>
				
				<td class="text-center">
				 <?php if($cts['view']=='0') { ?>
<span class="badge bg-red ng-scope">Chưa xem</span>

		 <?php } else 
			   if($cts['view']=='1') { ?>
				<span class="badge bg-green ng-scope">Đã Xem</span>
		   <?php } ?>				
</td>
				
				 
				
                <td class="text-center">
                        <?php echo $cts['email']; ?>
                </td>
                <td class="text-center" style="color: red;">
                  <?php if($cts['tochuc_canhan_id']=='1') {echo "Cá Nhân" ;}
            else if($cts['tochuc_canhan_id']=='2'){echo "Tổ Chức" ;}
			?>
                </td>
				
				<td class="text-center" style="white-space:nowrap">
           			  [ <a href="index.php?module=cts&act=view&cm=<?php echo $cts['tochuc_canhan_id'] ?>&id=<?php echo $cts['id_cts']; ?>" title="Xem"><i class="fa fa-file" aria-hidden="true"></i> </a>  ]  

					  
				</td>
				
                <td class="text-center" style="white-space:nowrap">
					[ <a href="index.php?module=cts&act=<?php echo "edit";?>&id=<?php echo $cts['id_cts']; ?>" title="Sửa"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a> ]
				 </td>
			   
			   <td class="text-center" style="white-space:nowrap">	
					[ <a href="javascript:confirmDelete('index.php?module=cts&act=del&id=<?=$cts['id_cts']?>')" title="Xóa"><i class="fa fa-trash-o" style="color: red;"></i></a>  ]   				
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
</form>    </div>
</div>

</div>
                
            </section>
        </div>
        


<?php include('view/template/common/footer.tpl'); ?>
 <script type="text/javascript">
function confirmDelete(delUrl) {
   if (confirm("Ban co chac chan la muon xoa bai viet nay")) {
     document.location = delUrl;
}
}
</script>