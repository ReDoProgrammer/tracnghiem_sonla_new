<div class="title">Địa chỉ mới</div>
<div class="middle">
  <table class="list">
       <!-- hien thi dia diem -->
      <?php foreach($lastest_address as $add){?>
                 <tr>
                 <?php if($add['logo']){ ?>
                 <td valign="top" style="width:1px"><a href="./?m=address&act=view&id=<?php echo $add['info_address_id'];?>"><img src="images/logo/<?php echo $add['logo'];?>" height ="30" width ="30" alt="<?php echo $add['info_address_name'];?>" title="<?php echo $add['info_address_name'];?>"/></a></td>
                 <?php } else {?>
                 <td valign="top" style="width:1px"><a href="./?m=address&act=view&id=<?php echo $add['info_address_id'];?>"><img src="images/no-photo.jpg" height ="30" width ="30" alt="<?php echo $add['info_address_name'];?>" title="<?php echo $add['info_address_name'];?>"/></a></td>
                 <?php } ?>
                 <td valign="top"><a href="./?m=address&act=view&id=<?php echo $add['info_address_id'];?>" title="<?php echo $add['info_address_name'];?>"><?php echo $add['info_address_name'];?></a>
                  <br /><span style="font-size: 11px; color: #900;"><?php echo $add['home_phone'];?></span>
                </td>
                 </tr>
 <?php }?>
</table>
</div>

	

<!-- begin feature -->	
<div class="title">Địa chỉ nổi bật</div>
<div class="middle" style="text-align: center;"> 
  	<table class="list">
      	  <?php foreach($feature_address as $fa){?>
            <tr>
                 <?php if($fa['logo']){ ?>
                 <td valign="top" style="width:1px"><a href="./?m=address&act=view&id=<?php echo $fa['info_address_id'];?>"><img src="images/logo/<?php echo $fa['logo'];?>" height ="30" width ="30" alt="<?php echo $fa['info_address_name'];?>" title="<?php echo $fa['info_address_name'];?>"/></a></td>
                 <?php } else {?>
                 <td valign="top" style="width:1px"><a href="./?m=address&act=view&id=<?php echo $fa['info_address_id'];?>"><img src="images/no-photo.jpg" height ="30" width ="30" alt="<?php echo $fa['info_address_name'];?>" title="<?php echo $fa['info_address_name'];?>"/></a></td>
                 <?php } ?>
                 <td valign="top"><a href="./?m=address&act=view&id=<?php echo $fa['info_address_id'];?>" title="<?php echo $fa['info_address_name'];?>"><?php echo $fa['info_address_name'];?></a>
                  <br /><span style="font-size: 11px; color: #900;"><?php echo $fa['home_phone'];?></span>
                </td>
                 </tr>
 <?php }?>
     </table>

</div>
<!-- end feature -->	

<div class="bottom">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center"></div>
</div>  </div>
<!-- and main -->
