<div id="content">
<?php  if($list_sub_cats){?>
  <div class="top">
  <div class="left"> <div class="heading"><?php echo $cat['category'];?></div></div>
  <div class="right"></div>
  <div class="center">
   
  </div>
</div>
<div class="middle">
  <table class="list_cat">
       <!-- hien thi dia diem -->
       <?php if($list_sub_cats) {?>
       <?php for ($i = 0; $i < sizeof($list_sub_cats); $i = $i + 2) { ?>
        <tr>
        <?php for ($j = $i; $j < ($i + 2); $j++) { ?>
         <td width="50%"> <?php if (isset($list_sub_cats[$j])) { ?>
         <a href="?m=cat&id=<?php echo $list_sub_cats[$j]['category_id'];?>">
         <?php if($list_sub_cats[$j]['icon']){?>
         <img src="images/cat/<?php echo $list_sub_cats[$j]['icon'] ?>" width="60" height ="60" title="" alt="" />
         <?php } else {?>
          <img src="view/theme/default/image/category.jpg" width="60" height ="60"title="" alt="" />
         <?php }?>
         </a>
   	     <h1><a href="./?m=cat&id=<?php echo $list_sub_cats[$j]['category_id'];?>"><?php echo $list_sub_cats[$j]['category'];?></a></h1>
         Co <?php echo total_address_in_cat($list_sub_cats[$j]['category_id'],1);?> dia chi
         <?php } ?> 
         </td>
         <?php } ?> 
         </tr>
         <?php }?> 
        
       <?php } else{?>
       <tr>
         <td> 
       	  Chua co dia diem trong danh muc nay 
         </td>
         </tr>
   <?php } ?>
    </table>
</div>

	<div class="bottom">
	<div class="left"></div>
	<div class="right"></div>
	<div class="center"></div>
	</div>
<?php }?>


	 <div class="top">
		 <div class="left">
         	<div class="heading"><?php echo $cat['category'];?> </div>
         </div>
		 <div class="right"></div>
	 	 <div class="center">
		
	  	 </div>
	</div>

<!-- begin address -->	
<div class="middle" style="text-align: center;"> 
  	
<table class="list">
         <?php if($all_address){?>
      	  <?php foreach($all_address as $fa){?>
            <tr>
            <td width="90"> 
             <?php if($ap['logo']){?>
            <a href="./?m=address&act=view&id=<?php echo $fa['info_address_id'];?>"><img src="images/logo/<?php echo $fa['logo'];?>" title="" alt="" width="90" height="90"/></a>
       	    <?php }else{?>
            <a href="./?m=address&act=view&id=<?php echo $fa['info_address_id'];?>"><img src="images/no-photo.jpg" title="" alt="" width="90" height="90"/></a>
           <?php }?>
              </td>
           <td>
	       <h1><a href="./?m=address&act=view&id=<?php echo $fa['info_address_id'];?>"><?php echo $fa['info_address_name'];?></a></h1>
	      <?php echo $fa['address1'];?>
	      <br>DT: <?php echo $fa['homephone'];?>  - DD:<?php echo $fa['mobilephone'];?>
	      <?php if($fa['yahoo']){?>
         <p>
         <a href="ymsgr:sendIM?<?php echo $fa['yahoo'];?>"> <img border="0" src="http://presence.msg.yahoo.com/online?u=<?php echo $fa['yahoo'];?>&amp;m=g&amp;t=1&amp;l=us"></a>
         </p>
         <?php }?>
         <p>
         <img src="view/theme/default/image/rating/stars_<?php echo $fa['rating'];?>.png"/>
         </p>
      </td>
      </tr>
     <?php } ?>
     <?php } ?>
         
   <?php if($all_address_in_paren_cat){?>
   <?php foreach($all_address_in_paren_cat as $ap){?>
           <tr>
           <td width="90" > 
           <?php if($ap['logo']){?>
           <a href="./?m=address&act=view&id=<?php echo $ap['info_address_id'];?>"><img src="images/logo/<?php echo $ap['logo'];?>" title="" alt="" width="90" height="90"/></a>
       	   <?php }else{?>
           <a href="./?m=address&act=view&id=<?php echo $ap['info_address_id'];?>"><img src="images/no-photo.jpg" title="" alt="" width="90" height="90"/></a>
           <?php }?>
              </td>
           <td>
	       <h1><a href="./?m=address&act=view&id=<?php echo $ap['info_address_id'];?>"><?php echo $ap['info_address_name'];?></a></h1>
	      <?php echo $ap['address1'];?> <br/>
          DT: <?php echo $ap['homephone'];?>  - DD:<?php echo $ap['mobilephone'];?><br/>
         <?php if($ap['yahoo']){?>
         <p>
         <a href="ymsgr:sendIM?<?php echo $ap['yahoo'];?>"> <img border="0" src="http://presence.msg.yahoo.com/online?u=<?php echo $ap['yahoo'];?>&amp;m=g&amp;t=1&amp;l=us"></a>
         </p>
          <?php }?>
         <p>
         <img src="view/theme/default/image/rating/stars_<?php echo $ap['rating'];?>.png"/>
         </p>
	  </td>
      </tr>
   
   <?php }}?>
   
</table>
<div class="pagination"><?php echo $pagination; ?></div>
</div>
<!-- end hang sx -->	

<div class="bottom">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center"></div>
</div>  
</div>
<!-- and main -->
