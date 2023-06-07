<!-- start content--->
<div id="content"> 
      <div class="top1">
            <div class="left"> </div>
            <div class="right"></div>
            <div class="center">
           <h1 class="heading"><?php echo $heading_title; ?> <?php if($allow_edit){?><a href="?m=address&act=edit&id=<?php echo $address['info_address_id'];?>">  [Sua]</a><?php }?>  </h1>
            </div>
      </div>
      <div class="middle"> <!--start miiddlwe -->
             <div style="width: 100%; margin-bottom: 10px;"><!-- start group -->
                 <table style="width: 100%; border-collapse: collapse;">
                     <tr>
                          <td style="text-align: center; width: 90px; vertical-align: top; ">
                          <?php if($ext){ ?>
				<img src="view/theme/default/image/icon/giaoan/<?php echo $ext; ?>.png" width="90px" class="bimg" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" style="margin-bottom: 3px;" />
                          <?php } else {?>
				<img src="view/theme/default/image/icon/giaoan/document.png" width="90px" class="bimg" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" style="margin-bottom: 3px;" />
                         <?php } ?>
                          </td>
                         <td style="padding-left: 15px; width: 360px; vertical-align: top;">
                            <table width="100%" class=""><!--table2-->
                                  <tr>
                                      <td><b>Tên văn bản</b></td>
                                      <td><?php echo $vanban_detail['ten'];?></td>
                                  </tr>
                                  
                                  <tr>
                                      <td><b>Số hiệu văn bản</b></td>
                                      <td><?php echo $vanban_detail['so_hieu'];?></td>
                                  </tr>
                                  
                                  <tr>
                                        <td><b>Ngày ban hành</b></td>
                                        <td><?php echo $vanban_detail['ngay_ban_hanh'];?></td>
                                  </tr>

                                  <tr>
                                        <td><b>Lượt xem</b></td>
                                        <td><?php echo $vanban_detail['luot_xem'];?></td>
                                  </tr>
                                   
                                      <tr>
                                        <td><b>Tải về</b></td>
                                        <td><?php echo $vanban_detail['luot_tai'];?></td>
                                     </tr>
                                     
					      </table> <!-- end table2-->
                        </td>
                  </tr>
         </table> 
    </div> <!-- end group -->
   
   <div class="group">
   <li style="list-style:none;"><?php if($ext) {?> <b>Định dạng</b>: *.<?php echo $ext;?> <?php } ?> <?php if($path) {?> <br/><b>Dung lượng</b>:<?php echo filesize($path); ?><?php } ?> </li>
   <li style="list-style:none;">
   <?php if($vanban_detail['file']) {?> 
    <b>Tải về</b>: <a href= "javascript:confirmDelete('index.php?module=vanban&act=download&id=<?=$vanban_detail['van_ban_id'];?>')"  >Bấm  đây để tải về ngay</a>
    <?php } else {?>
    File đính kèm không tồn tại
    <?php } ?>
    <br/>
    <?php if($vanban_detail['link']) {?> 
    <b>Tải về</b>: <a href="<?php echo $vanban_detail['link'];?>">Tải về từ liên kết ngoài</a>
    <?php } ?>
    
    </li>
   <?php if($address['address2']) {?>
   <li style="list-style:none;"><?php echo $address['address2'];?></li>
   <?php } ?>
   </div>
   <?php if($vanban_detail['general']){?>
   <b>Giới thiệu:</b>
    <?php echo $vanban_detail['general'];?>
  <?php  } ?>
  <?php if($vanban_detail['mo_ta']){?>
   <b>Nội dung:</b>
   <?php echo $vanban_detail['mo_ta'];?>
   <?php  } ?> 
   
    <h1 class="relate">
    Các tài liệu khác:
    </h1>
    <ul>
      <?php if ($list_vanbanrand) { ?>
          <?php foreach ($list_vanbanrand as $vanban) { ?>
          <li>
            <a href="index.php?module=vanban&act=view&id=<?php echo $vanban['van_ban_id'];?>"><?php echo $vanban['ten'];?> - <?php echo $vanban['so_hieu'];?>. </a> 
          </li>
       <?php } }?> 
    </ul>   
       
    </div> <!--end middle-->
      
      <div class="bottom"> <!-- bgin botom-->
          <div class="left"></div>
          <div class="right"></div>
          <div class="center"></div>
      </div><!-- end botom -->
</div><!-- end content -->


