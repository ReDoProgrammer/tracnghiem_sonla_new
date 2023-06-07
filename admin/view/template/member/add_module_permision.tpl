<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Chuyên Mục
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=home">Trang Chủ</a></li>
        <li class="active">Chuyên mục</li>
    </ol>

            </section>
            <section class="content animated fadeIn">
                <div class="row">
                    <div class="col-sm-12">
                        



    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onclick="return validate(this);">
<div class="box box-warning">
    <div class="box-body">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	
              
			<?php if ($_SESSION['success']) { ?>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo $_SESSION['success']; ?> </h3>
                    </div>
		
				
            <?php } unset($_SESSION['success']); ?>
    	
                    <div class="panel-body">
                               <div id="result" class="col-xs-12 table-responsive">
    	
          
             
						
						
					
               	<p class="text-right">
         <div class="pagination1"><?php echo $pagination; ?></div>
    </p>


	<div class="box-body">

		<div class="form-group">
<label>Họ Và Tên:  </label>
<span id="ctl00_phContent_lblNgaysinh" class="text-center"><?php echo $member['tai_khoan'];?></span>
</div>

<div class="form-group">
<label>Họ Và Tên:  </label>
<span id="ctl00_phContent_lblNgaysinh" class="text-center">          

                                      <select name="module_name">
             
               <?php foreach ($list_modules as $module){?> 
               <?php if ($module['gia_tri'] == $_SESSION['gia_tri']) { ?>
              <option value="<?php echo $module['gia_tri'] ; ?>" selected="selected"><?php echo $module['module_name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $module['gia_tri']; ?>"><?php echo $module['module_name']; ?></option>
              <?php } ?>

              <?php } ?>
            </select>
           - chọn quyền
              <select name="action">
			  <option value="view">Xem</option>
			  <option value="add">Thêm</option>
			  <option value="edit">Sửa</option>
			  <option value="del">Xóa</option>
              </select>



</span>
</div>


<table class="table table-bordered">
<tbody>
<tr>
<th style="width: 10px">#</th>
<th style="width: 10px">STT</th>
<th style="width: 20px">ID</th>
<th>Quyền Module</th>
<th style="width: 20px">UID</th>
<th style="width: 100px">Người dùng</th>
<th style="width: 100px">Ngày thêm</th>
<th style="width: 100px">Hành động được phép</th>
<th style="width: 100px">Tên cán bộ</th>
<th style="width: 100px">Thao Tác</th>
</tr>
     <?php if ($list_quyen_modul) { ?>
            <?php foreach ($list_quyen_modul as $quyen_modul) { ?>
<tr>
<td>   <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?></td>
					
					    <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quyen_modul['id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quyen_modul['id']; ?>" />
              <?php } ?></td>
					
<td style="width: 20px"><?php echo $quyen_modul['id']; ?></td>
<td><?php echo $quyen_modul['mo_ta']; ?> (<?php echo $quyen_modul['module_name']; ?>)</td>
<td width="20"><?php echo $quyen_modul['user_id']; ?></td>
<td width="100"><?php echo $quyen_modul['user_name']; ?></td>
  <td width="150"><?php echo date('d-m-Y h:m:s',$quyen_modul['add_date']); ?></td>
   <td><?php  if($quyen_modul['action']=='view'){ echo "Xem";} else if($quyen_modul['action']=='add'){echo "Thêm mới";} else if($quyen_modul['action']=='edit'){echo "Thay đổi";} else if($quyen_modul['action']=='del'){echo "Xóa";} ?></td>
     <td width="100"><?php echo $member['ho_ten']; ?></td>      

   <td class="text-center" style="white-space:nowrap; width: 10%;">
   
                      <!--   [ <a href="index.php?module=dmntm&act=<?php echo "edit";?>&id=<?php echo $danhmuc['id_dmntm']; ?>" title="Sửa bài viết"><i class="fa fa-pencil-square-o"></i></a> ]
						 [ <a href="javascript:confirmDelete('index.php?module=dmntm&act=del&id=<?=$danhmuc['id_dmntm']?>')" title="Xóa bài viết"><i class="fa fa-trash-o" style="color: red;"></i></a> ]
					-->
               
  [ <a title ="Thu hồi quyền này của người dùng" href="javascript:confirmDelete('index.php?module=member&act=del_module_permision&uid=<?php echo $quyen_modul['user_id']; ?>&id=<?=$quyen_modul['id']?>')"  ><?php echo "Thu hồi"; ?></a>]
          
			   </td>

</tr>
		  <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="3"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>


</tbody>
</table>

</div>
	
	
		<div class="box-footer text-center">

<button class="btn btn-sm btn-primary btn-flat" onclick="location = '<?php echo $link_list; ?>';" style="margin-top:4px">
<i class="fa fa-check-square-o"></i>
Thêm Mới
</button>
<a class="btn btn-sm btn-primary btn-flat" onclick="history.go(-1);" style="margin-top:4px">
<i class="fa fa-arrow-left"></i>
Hủy
</a>
</div>	
	
	
	
	
	
	
	
	


                        </div>
						<div class="pagination-container"><ul class="pagination"><li class="active"><a>Tổng Số:  <?php echo $total; ?></a></li></ul></div>


                   
                            <hr style=" border: 1px solid #ccc; border-top: none">
                           
                            <div class="form-group text-right groupbutton">
                                <button onclick="quay_lai_trang_truoc()" type="button" class="btn bg-green print"><i class="fa fa-backward" aria-hidden="true"></i>  Back</button>
                                <button onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" type="button" class="btn bg-red close-form"><i class="fa fa-times" aria-hidden="true"></i>&nbsp;Xóa Lựa Chọn</button>
                            </div>
                  
                    </div>
                </div>
            </div>

      
    </div>
</div>
</form>
             
                </div>
            </section>
        </div>
<?php include('view/template/common/footer.tpl'); ?>

  <script>
      function quay_lai_trang_truoc(){
          history.back();
      }
  </script>
  
   <script type="text/javascript">
function confirmDelete(delUrl) {
   if (confirm("Thu hoi quyen chuyen muc nay")) {
     document.location = delUrl;
}
}
</script>