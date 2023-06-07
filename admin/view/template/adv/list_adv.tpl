<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



  <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Danh Sách Quảng Cáo
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=home">Trang Chủ</a></li>
        <li class="active">Quang Cáo</li>
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
                    <div class="panel-heading">
                        <h3 class="panel-title">Kết quả tìm kiếm: </h3>
                    </div>
				
            
                   
                    <div class="panel-body">
                        <div id="result">


<table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
    <thead>
        <tr>
		<th width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
            <th class="text-center" style="padding-top: 20px;padding-bottom: 20px">
                STT
            </th>
			 <th class="text-center">
                Hình Ảnh
            </th>
            <th class="text-center">
                Tiêu Đề
            </th>
            <th class="text-center">
                Lựa Chọn
            </th>
            <th class="text-center">
                Số Lần Click
            </th>
           
            <th class="text-center">
                Lần sửa cuối
            </th>
			  <th class="text-center">
                Liên Kết </th>
				
								
			 <th class="text-center">
                Thao Tác
            </th>
        </tr>
    </thead>
    <tbody>
  
        
          <?php foreach ($list_adv as $adv) { ?>         
<tr>
<td style="text-align: center;"><?php if ($adv['id_adv']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $adv['id_about']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $adv['id_about']; ?>" />
              <?php } ?></td>

<td class="text-center" style="width: 2%;"> 1 </td>
<td style="width: 6%"> <a href ="<?php echo $adv['hinh_anh']; ?>"class="thickbox" rel="shadowbox" title="<?php echo $adv['tieu_de']?>"> 
            <img src ="<?php echo $adv['hinh_anh'];?>" class="bimg" width="80" height ="80"/>
            </a> </td>
<td style="width: 20%"> <?php echo $adv['tieu_de']; ?> </td>
<td style="width: 14%">   <?php if($adv['lua_chon_id']=='2'){echo "Trung tâm khối 1" ;}
          
            else if($adv['lua_chon_id']=='3'){echo "Quảng Cáo Phải Trên" ;}
			else if($adv['lua_chon_id']=='4'){echo "Quảng Cáo Phải Dưới" ;}
			else if($adv['lua_chon_id']=='5'){echo "Trung tâm cuối trang" ;}

            ?> </td>
			
			
			
			   
          
			
			
			
<td class="text-center" style="width: 10%;"> <?php echo $adv['view_id']; ?> </td>

<td class="text-center" style="width: 13%;"><?php echo $adv['time']; ?> </td>


 <td class="text-center" style="white-space:nowrap">
           <?php echo $adv['link']; ?>
                </td>
			
				 <td class="text-center" style="white-space:nowrap; width: 10%;">
                         [ <a href="index.php?module=adv&act=<?php echo "edit";?>&id=<?php echo $adv['id_adv']; ?>"><i class="fa fa-pencil-square-o"></i></a> ]
						 [ <a href="javascript:confirmDelete('index.php?module=adv&act=del&id=<?=$adv['id_adv']?>')"><i class="fa fa-trash-o" style="color: red;"></i></a> ]
						 [	<a href="index.php?module=adv&act=<?php echo "account";?>&id=<?php echo $adv['id_adv']; ?>"><i class="fa fa-file" aria-hidden="true"></i> </a> ]
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