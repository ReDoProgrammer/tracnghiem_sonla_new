<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách tài liệu văn bản
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=vanban&act=list">Danh Sách</a></li>
        <li class="active">Văn Bản</li>
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

<form novalidate="novalidate" action="" method="post">            

<div class="row" style="margin-bottom: 10px">
                <div class="col-sm-4">
                    <label>Trích Yếu</label>
                    <input class="form-control" name="ten" type="text" value="<?php echo $_SESSION['ten'];?>">
                </div>
                <div class="col-sm-4">
                    <label>Số Hiệu Văn Bản</label>
                    <input class="form-control" name="so_hieu" type="text" value="<?php echo $_SESSION['sohieu'];?>">
                </div>
				 <div class="col-sm-4">
                    <label>Ngày Ban Hành</label>
                    <input class="form-control" name="ngay_ban_hanh" type="text">
                </div>
              
            </div>
            <div class="row" style="margin-bottom: 10px">
               
                <div class="col-sm-4">
                    <label>Nơi Ban Hành</label>
                           <select name="noi_ban_hanh_id" class="form-control">
            <option value="">Tất cả</option>
           
            <?php foreach ($list_noibanhanh as $nbh) { ?>
	    <?php if($_SESSION['noi_ban_hanh_id']== $nbh['noi_ban_hanh_id']) { ?>
              <option value="<?php echo $nbh['noi_ban_hanh_id'];?>" selected><?php echo $nbh['ten_noi_ban_hanh']; ?></option>
            <?php } else { ?>
	     <option value="<?php echo $nbh['noi_ban_hanh_id'];?>"><?php echo $nbh['ten_noi_ban_hanh']; ?></option>
	     <?php } ?>        
	    <?php } ?>
           
            </select>
                </div>
                <div class="col-sm-4">
                    <label>Loại Văn Bản</label>
                   <select name="loai_van_ban_id" class="form-control">
<option value="">Tất cả</option>

   <?php foreach ($list_loaivanban as $loaivb) { ?>
	    <?php if ($loaivb['loai_van_ban_id'] == $_SESSION['loai_van_ban_id']) { ?>
	     <option value="<?php echo $loaivb['loai_van_ban_id'];?>" selected><?php echo $loaivb['ten_loai_van_ban']; ?></option>
	              <?php } else { ?>
	    <option value ="<?php echo $loaivb['loai_van_ban_id']; ?>"><?php echo $loaivb['ten_loai_van_ban']; ?></option>
	    <?php }} ?>
</select>
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px">
                <div class="col-sm-12" style="margin-top: 10px; margin-bottom: 10px">
                    <div class="form-inline">
                      
                       
                        <button type="submit" class="btn bg-blue  btn-flat pull-right "><i class="fa fa-search"></i>&nbsp;&nbsp;Tìm kiếm</button>
                        <button type="reset" class="btn bg-orange btn-flat pull-right" style="margin-right: 10px"><i class="fa fa-eraser"></i>&nbsp;&nbsp;Reset</button>
                    </div>
                </div>
            </div>
            <div id="result" class="col-xs-12 table-responsive">
			
			
				<?php if ($_SESSION['success']) { ?>
				
					<div class="panel panel-success">			
			<div class="panel-heading">
<h3 class="panel-title"><?php echo $_SESSION['success']; ?></h3>
</div>

<?php } unset($_SESSION['success']); ?>


	
	

	
<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0">
    <tbody><tr>
        <th class="text-center">
            STT
        </th>
       
        <th class="text-center">
            File
        </th>
		<th class="text-center">
            Tên Tài Liệu
        </th>
		
        <th class="text-center" style="white-space:nowrap">
            Số Hiệu VB
        </th>
		 <th class="text-center" style="white-space:nowrap">
            Ngày Ban Hành
        </th>
		<th class="text-center" style="white-space:nowrap">
            Nơi Ban Hành
        </th>
        <th class="text-center">
            Loại Văn Bản
        </th>
        <th class="text-center">
            Lượt Xem
        </th>
		 <th class="text-center">
            Lượt Tải
        </th>
       <th class="text-center text-green">Sửa</th>
<th class="text-center text-red">Xóa</th>
    </tr>
           
        
         
           
         
        <?php if ($list_vanban) { ?>
          <?php foreach ($list_vanban as $vanban) { ?>  
            <tr>
                <td class="text-center">
                      <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
               
                <td>
                   <?php echo $vanban['tieu_de']; ?>
                </td>
				
				<td class="">

                  <?php echo  $vanban['ten']; ?>
                </td>
				
                <td class="text-center">

                    <?php echo $vanban['so_hieu'];?>
                </td>
				
				<td class="text-center">

                  <?php echo $vanban['ngay_ban_hanh']; ?>
                </td>
				
				<td class="text-center">

                    <?php echo $vanban['ten_noi_ban_hanh']; ?>
                </td>
				
               <td class="text-center">

                    <?php echo $vanban['ten_loai_van_ban']; ?>
                </td>
				
				<td class="text-center">

                    <?php echo $vanban['luot_xem']; ?>
                </td>
				
				<td class="text-center">

                    <?php echo $vanban['luot_tai']; ?>
                </td>
				<!--
                <td class="text-center">
                    <a href=""><i class="fa fa-download" aria-hidden="true"></i></a>
                </td>-->
                <td class="text-center" style="white-space:nowrap">
                    <a href="index.php?module=vanban&act=<?php echo "edit";?>&id=<?php echo $vanban['van_ban_id']; ?>"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a>
			
                </td>
                <td class="text-center">
                    <a href="javascript:confirmDelete('index.php?module=vanban&act=del&id=<?=$vanban['van_ban_id']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a>
                </td>
            </tr>
		  <?php } ?>
		    <?php } else { ?>
    <tbody>
            <tr>
                <td colspan="11" class="text-center text-red text-bold">Không tồn tại dữ liệu</td>
            </tr>
    </tbody>
   <?php } ?>
   
          
</tbody></table>
<p class="text-right">

       <div class="pagination1"><?php echo $pagination; ?></div>
   </p>
            </div>
</form>    </div>
</div>


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