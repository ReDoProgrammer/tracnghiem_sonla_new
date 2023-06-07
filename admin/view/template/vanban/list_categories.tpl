<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Danh Mục Download
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Danh Sách file</a></li>
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

<form novalidate="novalidate" action="" method="post">            

<div class="row" style="margin-bottom: 10px">
                <div class="col-sm-4">
                    <label>Tiêu Đề</label>
                    <input class="form-control" name="tieu_de" type="text">
                </div>
                <div class="col-sm-4">
                    <label>Định Dạng</label>
                    <input class="form-control" name="_TrichYeu" type="text">
                </div>
                <div class="col-sm-4">
                    <label>Danh Mục</label>
                    <select class="form-control" name="pageSize">
				<option selected="selected">--Tất cả trạng thái--</option>
<option value="true">Còn hiệu lực</option>
<option value="false">Hết hiệu lực</option>
</select>
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px">
                <div class="col-sm-4">
                    <label>Dung Lượng</label>
                    <input class="form-control" name="tieu_de" type="text">
                </div>
                <div class="col-sm-4">
                    <label>Loại văn bản</label>
                    <select class="form-control" data-val="true" data-val-number="The field _IDLoaiVanBan must be a number." id="ddlLoaiVanBan" name="_IDLoaiVanBan"><option selected="selected" value=""></option>
<option value="1">Pháp lệnh</option>
<option value="2">Luật</option>
<option value="3">Nghị quyết</option>
<option value="4">Chỉ thị</option>
<option value="5">Nghị định</option>
<option value="6">Thông tư</option>
<option value="7">Công điện</option>
<option value="8">Thông báo</option>
<option value="9">Quyết định</option>
<option value="10">Công văn</option>
<option value="11">Kế hoạch</option>
<option value="12">Chương trình</option>
<option value="13">Hướng dẫn</option>
<option value="14">Thể lệ</option>
<option value="15">Văn bản</option>
<option value="16">Đảng, Nhà nước</option>
<option value="17">Thông tư liên tịch</option>
</select>
                </div>
                <div class="col-sm-4">
                    <label>Loại công việc</label>
                    <select class="form-control" data-val="true" data-val-number="The field _IDLoaiCongViec must be a number." id="ddlLoaiCongViec" name="_IDLoaiCongViec"><option selected="selected" value=""></option>
<option value="1">Công nghệ thông tin</option>
<option value="2">Bưu chính</option>
<option value="3">Viễn thông</option>
<option value="4">Báo chí xuất bản</option>
<option value="7">doanh nghiệp</option>
</select>
                </div>
            </div>
            <div class="row" style="margin-bottom: 10px">
                <div class="col-sm-12" style="margin-top: 10px; margin-bottom: 10px">
                    <div class="form-inline">
                        <label>Hiển thị</label><br>
                        <select class="form-control" id="ddlSudung" name="pageSize"><option selected="selected" value="10">10 dòng/trang</option>
<option value="20">20 dòng/trang</option>
<option value="30">30 dòng/trang</option>
<option value="50">50 dòng/trang</option>
<option value="70">70 dòng/trang</option>
<option value="100">100 dòng/trang</option>
</select>
                        <button type="submit" class="btn bg-blue  btn-flat pull-right "><i class="fa fa-search"></i>&nbsp;&nbsp;Tìm kiếm</button>
                        <button type="reset" class="btn bg-orange btn-flat pull-right" style="margin-right: 10px"><i class="fa fa-eraser"></i>&nbsp;&nbsp;Reset</button>
                    </div>
                </div>
            </div>
            <div id="result">
			
			
				<?php if ($_SESSION['success']) { ?>
				
					<div class="panel panel-success">			
			<div class="panel-heading">
<h3 class="panel-title"><?php echo $_SESSION['success']; ?></h3>
</div>

<?php } unset($_SESSION['success']); ?>

<p class="text-right">
        Đang hiển thị dòng <span style="font-weight: bold">1</span> đến <span style="font-weight: bold">8</span> của <span style="font-weight: bold">8</span> bản ghi
    </p>
	
	

	
<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0">
    <tbody><tr>
        <th class="text-center">
            STT
        </th>
       
        <th class="text-center">
            Tiêu Đề
        </th>
		<th class="text-center">
            Danh Mục
        </th>
		
        <th class="text-center" style="white-space:nowrap">
            Ngày Đăng
        </th>
		 <th class="text-center" style="white-space:nowrap">
            Định Dạng
        </th>
		<th class="text-center" style="white-space:nowrap">
            Dung Lượng
        </th>
        <th class="text-center">
            Trạng thái
        </th>
        <th class="text-center">
            Download
        </th>
       <th class="text-center text-green">Sửa</th>
<th class="text-center text-red">Xóa</th>
    </tr>
           
        
         
           
         
        <?php if ($list_categories) { ?>
          <?php foreach ($list_categories as $categories) { ?>  
            <tr>
                <td class="text-center">
                      <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
               
                <td>
                   <?php echo $categories['tieu_de']; ?>
                </td>
				
				<td class="text-center">

                   <?php echo $categories['ten_danh_muc']; ?>
                </td>
				
                <td class="text-center">

                    <?php echo date_format(date_create($categories['time']),'d/m/Y');?>
                </td>
				
				<td class="text-center">

                  <?php echo $categories['kieu_file']; ?>
                </td>
				
				<td class="text-center">

                    <?php echo $categories['mb']; ?>
                </td>
				
                <td class="text-center">
                        <span class="label label-success">Còn hiệu lực</span>
                </td>
                <td class="text-center">
                    <a href=""><i class="fa fa-download" aria-hidden="true"></i></a>
                </td>
                <td class="text-center" style="white-space:nowrap">
                    <a href="index.php?module=categories&act=<?php echo "edit";?>&id=<?php echo $categories['ma_cat']; ?>"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a>
			
                </td>
                <td class="text-center">
                    <a href="javascript:confirmDelete('index.php?module=categories&act=del&id=<?=$categories['ma_cat']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a>
                </td>
            </tr>
		  <?php } ?>
		    <?php } else { ?>
    <tbody>
            <tr>
                <td colspan="6" class="text-center text-red text-bold">Không tồn tại dữ liệu</td>
            </tr>
    </tbody>
   <?php } ?>
   
          
</tbody></table>
<div class="pagination-container"><ul class="pagination"><li class="active"><a><?php echo $pagination; ?></a></li></ul></div>
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