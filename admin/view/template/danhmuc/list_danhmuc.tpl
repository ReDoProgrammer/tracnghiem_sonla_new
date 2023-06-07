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
                   
				   
				   
				   
				       <div class="input-group input-group-sm">
                <input type="text" class="form-control">
                    <span class="input-group-btn">
                      <button type="button" class="btn btn-info btn-flat">Go!</button>
                    </span>
              </div>
				   
				   
				   
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
            Trạng thái
        </th>
        <th class="text-center">
            Sắp Xếp
        </th>
       <th class="text-center text-green">Sửa</th>
<th class="text-center text-red">Xóa</th>
    </tr>
           
        
         
           
         
           
          <?php if ($list_danhmuc) { ?>
          <?php foreach ($list_danhmuc as $danhmuc) { ?>
            <tr>
                <td class="text-center">
                      <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
               
                <td>
                   <?php echo $danhmuc['ten_danh_muc']; ?>
                </td>
				
			
				
            
			
				
				
                <td class="text-center">
				<?php if($danhmuc['trang_thai']=='0') { ?>
				<span class="label label-success">Không Hiện Thị</span> 
					<?php } else { ?>
				<span class="label label-danger">Hiện Thị</span> 
					<?php } ?>
                </td> 
			
					
	
		  
                <td class="text-center">
                    <a href="./index.php?module=danhmuc&act=up&id=<?=$danhmuc['ma_danh_muc']?>"  ><?php echo "Lên"; ?></a>    
			<a href="./index.php?module=danhmuc&act=down&id=<?=$danhmuc['ma_danh_muc']?>"  ><?php echo "Xuống"; ?></a>  
            <?php echo $danhmuc['sap_xep']; ?>
                </td>
                <td class="text-center" style="white-space:nowrap">
                    <a href="index.php?module=danhmuc&act=<?php echo "edit";?>&id=<?php echo $danhmuc['ma_danh_muc']; ?>"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a>
			
                </td>
                <td class="text-center">
                    <a href="javascript:confirmDelete('index.php?module=danhmuc&act=del&id=<?=$danhmuc['ma_danh_muc']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a>
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