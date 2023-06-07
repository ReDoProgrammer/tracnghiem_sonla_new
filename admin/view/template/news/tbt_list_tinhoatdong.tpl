<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($_SESSION['success']) { ?>
<div class="success"><?php echo $_SESSION['success']; ?></div>
<?php } unset($_SESSION['success']); ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/order.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="location = '<?php echo $link_add; ?>'" class="button"><span><?php echo $button_add; ?></span></a><a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
  </div>

 <div class="search">
    <form action="" method="post" enctype="multipart/form-data" id="form">
    <table>
    <tr><br/>
    <td width="100"><b><?php echo ten_tin_hoat_dong;?></b></td>  <td><input type="text" name="ten_tin_hoat_dong"  class="validate[required] text-input tk timkiem_" id="ten_tin_hoat_dong" /></td>   <td rowspan="2">  <input type="submit" onclick="$('#form').submit();"  value="<?php echo tim_kiem; ?>" class="btntk_" id="form" />  </td>
     </tr>
    <!--
     <tr>
     <td><b><?php echo $cot_dia_chi;?></b> </td>  <td><input type="text" name="thon_ban" size="150" /></td> 
     </tr>
    -->
    </table>
    </form>
    
   </div>

  <div class="content">
  <form action="" method="post" enctype="multipart/form-data" id="form">
     
    <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            
             <td class="center">
              <a href="<?php echo $sort_name; ?>"><?php echo $ten_tin_hoat_dong; ?></a></td>
              <td class="center"> Danh mục</td>
              <td class="center"> Tác giả</td>
               <td class="center">Ngày đăng</td>
               <td class="center">Lần sửa cuối</td>
               <td class="center"> Trạng thái </td>
             <td class="center">
              <a href="<?php echo $sort_name; ?>"><?php echo $thao_tac; ?></a></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach($list_chuyenmuc as $chuyen_muc){ ?>
 
               <?php $list_tinhoatdong =  getlisttinhoatdong_tbt($chuyen_muc['cm_id'], 0, 100); ?>
                <?php if ($list_tinhoatdong) { ?>
          <?php foreach ($list_tinhoatdong as $tinhoatdong) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $tinhoatdong['tin_hoat_dong_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $tinhoatdong['tin_hoat_dong_id']; ?>" />
              <?php } ?></td>
              

           <td class="left"><?php echo  $tinhoatdong['ten_tin_hoat_dong']; ?></td>
           <td class="left"><?php echo  $tinhoatdong['ten_danh_muc']; ?></td>
            <td class="left" width="150"> <?php echo $tinhoatdong['ten_can_bo']; ?></td>
            <td class="left" width="120"><?php echo  $tinhoatdong['add_date']; ?></td>
            <td class="left" width="120"><?php echo  $tinhoatdong['edit_date']; ?></td>
           <td class="center" width="120">  
           <?php if($tinhoatdong['kiem_duyet']=="gui") { ?>
               Đang chờ duyệt
           <?php } ?>

           <?php if($tinhoatdong['kiem_duyet']=="chua") { ?>
               Bản thảo
           <?php } ?>

           <?php if($tinhoatdong['kiem_duyet']=="btv_nhan") { ?>
               Nhận bản thảo
           <?php } ?>

          <?php if($tinhoatdong['kiem_duyet']=="btv_gui") { ?>
              Chờ TBT nhận duyệt
           <?php } ?>

           <?php if($tinhoatdong['kiem_duyet']=="xuat_ban") { ?>
              Đã xuất bản
           <?php } ?>

          <?php if($tinhoatdong['kiem_duyet']=="tbt_tra_ve") { ?>
           Trả về cấp dưới 
           <?php } ?>
           </td>

             <td class="center" width="150">
           <?php if($tinhoatdong['kiem_duyet']=="btv_nhan") { ?>
            [ <a href="index.php?module=tinhoatdong&act=<?php echo "edit";?>&id=<?php echo $tinhoatdong['tin_hoat_dong_id']; ?>"><?php echo "Sửa"; ?></a> ]
           
           <?php } ?>

           <?php if($tinhoatdong['kiem_duyet']=="tbt_nhan") { ?>
            [ <a href="index.php?module=tinhoatdong&act=<?php echo "edit";?>&id=<?php echo $tinhoatdong['tin_hoat_dong_id']; ?>"><?php echo "Sửa"; ?></a> ]
           
           <?php } ?>

          <?php if($tinhoatdong['kiem_duyet']=="btv_sua") { ?>
            [ <a href="javascript:confirmDelete('index.php?module=tinhoatdong&act=btv_gui_duyet&id=<?=$tinhoatdong['tin_hoat_dong_id']?>')"  ><?php echo "Gửi duyệt"; ?></a> ]
            [ <a href="index.php?module=tinhoatdong&act=<?php echo "edit";?>&id=<?php echo $tinhoatdong['tin_hoat_dong_id']; ?>"><?php echo "Sửa"; ?></a> ]
        
           <?php } ?>

            <?php if($tinhoatdong['kiem_duyet']=="tbt_sua") { ?>
            [ <a href="javascript:confirmDelete('index.php?module=tinhoatdong&act=xuat_ban&id=<?=$tinhoatdong['tin_hoat_dong_id']?>')"  ><?php echo "Xuất bản"; ?></a> ]
            
            [ <a href="index.php?module=tinhoatdong&act=<?php echo "edit";?>&id=<?php echo $tinhoatdong['tin_hoat_dong_id']; ?>"><?php echo "Sửa"; ?></a> ]
              [ <a href="index.php?module=tinhoatdong&act=tra_ve&id=<?=$tinhoatdong['tin_hoat_dong_id']?>"  ><?php echo "Trả về"; ?></a> ]
        
           <?php } ?>

           <?php if($tinhoatdong['kiem_duyet']=="btv_gui") { ?>
            [ <a href="javascript:confirmDelete('index.php?module=tinhoatdong&act=nhan_kiem_duyet&id=<?=$tinhoatdong['tin_hoat_dong_id']?>')"  ><?php echo "Nhận duyệt"; ?></a> ]
           <?php } ?>



          <?php if($tinhoatdong['kiem_duyet']=="gui") { ?>
     
            [ <a href="javascript:confirmDelete('index.php?module=tinhoatdong&act=nhan_kiem_duyet&id=<?=$tinhoatdong['tin_hoat_dong_id']?>')" title="Nhận kiểm duyệt"><?php echo "Nhận kiểm duyệt"; ?></a>]
           <?php } ?>

             <?php if($tinhoatdong['kiem_duyet']=="tbt_tra_ve") { ?>
           [ <a href="index.php?module=tinhoatdong&act=<?php echo "tien_do";?>&id=<?php echo $tinhoatdong['tin_hoat_dong_id']; ?>"><?php echo "Xem tiến độ xử lý"; ?></a> ]
           <?php } ?>

          
           <?php if($tinhoatdong['kiem_duyet']=="xuat_ban") { ?>
          Đã xuất bản
           <?php } ?>



            </td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>


         <?php } ?>


         
        </tbody>
      </table>
    </form>
    <div class="pagination"><?php echo $pagination; ?></div>
  </div>
</div>
<?php include('view/template/common/footer.tpl'); ?>