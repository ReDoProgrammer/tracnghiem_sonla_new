<div id="title"> <?php echo $text_heading; ?> </div>
 <!-- begin address -->	
<div class="middle" style="text-align: center;"> 
  	<table class="list">
         <?php echo $quanlity; ?>  <?php echo $text_result; ?>  '<?php echo $kw;?>''
       <?php if($search_rs){?>
      	  <?php foreach($search_rs as $fa){?>
            <?php if($fa['ref']>0.5){?>
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
      </tr>
      <?php $dem+1; }?>
     <?php } ?>
     <?php } else{ ?>
     
      <tr>
      <td>Khong co</td>
      </tr>
     
     <?php }?>
</table>
<div class="pagination"><?php echo $pagination; ?></div>
</div>
<!-- and main -->
