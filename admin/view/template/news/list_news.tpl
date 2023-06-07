<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh sách tin tức
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=news&act=list">Tin tức</a></li>
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

                    <input class="form-control" type="text" maxlength="104" name="tieu_de" placeholder="Tìm kiếm tiêu đề bài viết"  value="<?php echo $_SESSION['ten'];?>"/>
                </div>
            </div>
			
			
            <div class="col-xs-12 col-md-3">
		
                <div class="form-group">
		
                     <select class="form-control" name="dm_id">
                     <option value="">---Tìm kiếm theo danh mục---</option>
					 <?php foreach ($list_dm as $dm) { ?>
					
				 <?php if ($_SESSION['dmid'] == $dm['id']) { ?>
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
					
					<input class="btn btn-primary" name="search"  type="hidden" value="1" />
                    <input class="btn btn-primary" type="submit" value="Tìm kiếm" />
					
                </div> 
				</div>
            
        </div>
      
        <label><em>Từ khóa tìm kiếm tiêu đề bài viết tin tức</em></label>

</div>


 
            <div id="result">
		
<div class="col-xs-12 table-responsive">
			
				<?php if ($_SESSION['ten']) { ?>
				
					<div class="panel panel-success">			
			<div class="panel-heading">
<h3 class="panel-title"><?php echo $_SESSION['ten']; ?></h3>
</div>

<?php } unset($_SESSION['ten']); ?>


	

	
<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0">
    <tbody><tr>
	    <th><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
        <th class="text-center">
            STT
        </th>
       
       
	
	 <th class="text-center">
         Tiêu đề
        </th>
	
		
		<th class="text-center" style="white-space:nowrap; width: 20%;">
            Danh mục
        </th>
		  <th class="text-center">
           Đăng bởi
        </th>
       
        <th class="text-center">
           Ngày đăng
        </th>
       
		 <th class="text-center">
        Lượt xem
        </th>

	   <th class="text-center text-green">Sửa</th>
<th class="text-center text-red">Xóa</th>
    </tr>

    </tr>
           
        
        <form action="" method="post" enctype="multipart/form-data" id="form2">
           
         
       <?php if ($list_news) { ?>
          <?php foreach ($list_news as $news) { ?>  
            <tr>
		
			   <td><input type = "checkbox" value ="<?php echo $news['id_news'];?>"name="selected[]" /></td>
			  
                <td class="text-center">
                      <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
                </td>
				
				
               
                <td>				
			
                  <b> <?php echo $news['tieu_de']; ?></b>				
				
                </td>
				
			
				
               
			
			
				
				<td class="text-center">
				
<span class="" style=""><?php echo $news['title'];?></span>

				
</td>
				
				  <td class="text-center">
                        	<?php echo $news['tai_khoan'];?>
                </td>
				
                <td class="text-center">
                        	<?php echo date_format(date_create($news['time']),'d/m/Y');?>
                </td>
              
				
					<td class="text-center">
				
<span class="badge bg-red ng-scope"><?php echo $news['luot_xem_id'];?></span>

				
</td>
				
				
				
                <td class="text-center" style="white-space:nowrap">
					[ <a href="index.php?module=news&act=<?php echo "edit";?>&id=<?php echo $news['id_news']; ?>" title="Sửa"><i class="fa fa-pencil-square-o" style="color: teal;"></i></a> ]
				 </td>
			   
			   <td class="text-center" style="white-space:nowrap">	
					[ <a href="javascript:confirmDelete('index.php?module=news&act=del&id=<?=$news['id_news'];?>')" title="Xóa"><i class="fa fa-trash-o" style="color: red;"></i></a>  ]   				
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
	
<!--<div class="pagination-container"><ul class="pagination"><li class="active"><a><?php echo $pagination; ?></a></li></ul></div>-->
            </div>
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