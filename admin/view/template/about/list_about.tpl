<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh sách các bài giới thiệu
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=home">Trang Chủ</a></li>
        <li class="active">Giới Thiệu</li>
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
               
				
            
                   
                    <div class="panel-body">
                        <div id="result">


<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
    <thead>
        <tr>
	
            <th class="text-center" style="padding-top: 20px;padding-bottom: 20px">
                STT
            </th>
            <th class="text-center">
                Tiêu bài viết
            </th>
            <th class="text-center">
                Trạng Thái
            </th>
            <th class="text-center">
                Sắp Xếp
            </th>
           
         					
			 <th class="text-center">
                Thao Tác
            </th>
        </tr>
    </thead>
    <tbody>
  
        
           <?php foreach ($list_about as $about) { ?>         
<tr>


<td class="text-center" style="width: 2%;"> 1 </td>
<td style="width: 20%"> <?php echo $about['tieu_de']; ?> </td>
<td style="width: 12%">  <?php if($about['lua_chon_id']=='1') {echo "Trên - Top" ;}
            else if($adv['lua_chon_id']=='2'){echo "Trung tâm khối 1" ;}
            else if($adv['lua_chon_id']=='3'){echo "Trung tâm khối 2" ;}
			else if($adv['lua_chon_id']=='4'){echo "Trung tâm khối 3" ;}
			else if($adv['lua_chon_id']=='5'){echo "Liên kết Trái" ;}
			else if($adv['lua_chon_id']=='6'){echo "Liên kết Phải" ;}
            ?> </td>


<td class="text-center" style="width: 13%;"><?php echo $about['time']; ?> </td>

			
				 <td class="text-center" style="white-space:nowrap; width: 10%;">
                         [ <a href="index.php?module=about&act=<?php echo "edit";?>&id=<?php echo $about['id_about']; ?>"><i class="fa fa-pencil-square-o"></i></a> ]
						 [ <a href="javascript:confirmDelete('index.php?module=about&act=del&id=<?=$about['id_about']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a> ]
			
                </td>

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