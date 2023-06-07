<!-- start content--->
<div id="content"> 
            <div id="heading">
          <?php echo $heading_title; ?> <?php if($allow_edit){?><a href="?m=address&act=edit&id=<?php echo $address['info_address_id'];?>">  [Sua]</a><?php }?>
            </div>
  
     <div class="middle"> <!--start miiddlwe -->
             <div style="width: 100%; margin-bottom: 30px;"><!-- start group -->
                 <table style="width: 100%; border-collapse: collapse;">
                     <tr>
<td style="text-align: left;">
                             <a href="<?php echo $image;?>" title="<?php echo $heading_title; ?>" class="thickbox" rel="shadowbox[Vacation]">
                             <img src="<?php echo $image;?>" width="250" border="1" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" style="margin-bottom: 3px;" /></a><br />
                             <?php foreach($imgs as $img){?>
                             <a href="images/address/<?php echo $img['image']; ?>" rel="shadowbox[Vacation]"></a>
                             <?php } ?>
                             <span style="font-size: 11px;"><?php echo "click xem to"; ?></span>
                         </td>
			
</tr>

 <tr>
                         <td style="padding-left: ">
                            <table width="100%"><!--table2-->
                                 <tr>
                                      <td><b>Khu vuc</b></td>
                                      <td><?php echo $address['location'];?></td>
                                 </tr>
              
                                 <tr>
                                    <td><b>Dai dien</b></td>
                                    <td><?php echo $address['contact_name'];?></td>
                                 </tr>
              
                                 <tr>
                                    <td><b>Dien thoai</b></td>
                                    <td><?php echo $address['homephone'];?></td>
                                 </tr>
                                  
                                  <tr>
                                    <td><b>Di dong</b></td>
                                    <td><?php echo $address['mobilephone'];?></td>
                                  </tr>
                                  
                                  <tr>
                                    <td><b>Email</b></td>
                                    <td><?php echo $address['email'];?></td>
                                  </tr>
                                   <?php if($address['website']){?>
                                    <tr>
                                    <td><b>Website</b></td>
                                    <td>
                                    <a href=" <?php echo $address['website'];?>"target="_blank" title="Tham website nay"><?php echo $address['website'];?></a></td>
                                    </tr>
                                  <?php }?>
                                  <?php if($address['yahoo']){?>
                                    <tr>
                                    <tr>
                                        <td><b>Yahoo</b></td>
                                    <td><a class="" href="ymsgr:sendIM?<?php echo $address['yahoo'];?>" title="Bam de chat ngay"> <img border="0" src="http://presence.msg.yahoo.com/online?u=<?php echo $address['yahoo'];?>&amp;m=g&amp;t=1&amp;l=us"></a></td>
                                   </tr>
                                  <?php }?>
                                    <tr>
                                        <td><b>Danh gia</b></td>
                                    <td>
                                        <!-- rating -->
                                        	<div id="rating_<?php echo $address['info_address_id']; ?>">
                                    			<span class="star_1"><img src="view/5star/star_blank.png" alt="" <?php if($rating > 0) { echo"class='hover'"; } ?> /></span>
                                    			<span class="star_2"><img src="view/5star/star_blank.png" alt="" <?php if($rating > 1.5) { echo"class='hover'"; } ?> /></span>
                                    			<span class="star_3"><img src="view/5star/star_blank.png" alt="" <?php if($rating > 2.5) { echo"class='hover'"; } ?> /></span>
                                    			<span class="star_4"><img src="view/5star/star_blank.png" alt="" <?php if($rating > 3.5) { echo"class='hover'"; } ?> /></span>
                                    			<span class="star_5"><img src="view/5star/star_blank.png" alt="" <?php if($rating > 4.5) { echo"class='hover'"; } ?> /></span>
                              	       	    </div>
                                            <div class="star_rating">
                                		      (<strong><?php echo number_format($point, 2, '.', ''); ?></strong>)
                                	        </div>
                                            <!-- end rating -->
                                    </td>
                                   </tr>
                                   <tr>
                                        <td><b>Xac thuc</b></td>
                                        <td><?php echo $auth;?></td>
                                   </tr>
                                    <tr>
                                        <td><b>Luot xem</b></td>
                                        <td><?php echo $address['view'];?></td>
                                     </tr>
                                     <tr>
                                        <td><b>Noi dung xau</b></td>
                                        <td>Bao cao <?php echo $address['info_address_id'];?></td>
                                     </tr>
		                       </table> <!-- end table2-->
                               <!-- AddThis Button BEGIN -->
                                <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                                <a class="addthis_button_preferred_1"></a>
                                <a class="addthis_button_preferred_2"></a>
                                <a class="addthis_button_preferred_3"></a>
                                <a class="addthis_button_preferred_4"></a>
                                <a class="addthis_button_compact"></a>
                                </div>
                                <script type="text/javascript">var addthis_config = {"data_track_clickback":true};</script>
                                <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4d94c1575c37062d"></script>
                                <!-- AddThis Button END --
                                     <img src ="view/theme/default/image/icon_share.png"/>
                                <!-- khi offline -->
                      </td>
                  </tr>
         </table> 
    </div> <!-- end group -->
   
   <div class="bg">
   <li style="list-style:none;"> <b>Ten cong ty</b>: <?php echo $address['info_address_name'];?> </li>
   <li style="list-style:none;"> <b>Dia chi</b>:<?php echo $address['address1']; ?> - <?php echo $address['location'];?></li>
   <?php if($address['address2']) {?>
   <li style="list-style:none;"><?php echo $address['address2'];?></li>
   <?php } ?>
   </div>
  
    <!-- note for address-->
    <div id="tab_description" class="tab_page">
     <p align="justify">   <?php echo $address['description_detail'];?></p>
     <hr />
    Bai nay co <?php echo $address['view'];?> luot xem. Viet boi <?php echo $member['full_name'];?> - <?php echo $address['add_date'];?>
    </div>
   <!-- end note for address-->
   <div id="tab_map" class="tab_page"><!-- b map -->
              <div style="display: inline-block;">
                    <div style="mapdiv">
                    <?php if($address['map']){?>
                    <a href="images/map/<?php echo $address['map']; ?>" title="<?php echo $heading_title; ?>" class="thickbox" rel="shadowbox"><img src="images/map/<?php echo $address['map']?>" width="520" height="330"title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" style="border: 1px solid #DDDDDD; margin-bottom: 3px;" /></a><br />
                    <span style="font-size: 11px;"><?php echo $text_enlarge; ?></span>
                    <?php }else{ ?>
                    Updating..
                    <?php } ?>
                    </div>
             </div>
        </div><!--end map -->
        
        <div class="group"><!-- cac bai lien quan -->
                   <p><b>Cac bai lien quan den <?php echo $address['info_address_name'];?> </b></p>
                    <ul class="additional">
                   <?php foreach($list_additionals as $bs){?>
                    <li><a href = "?m=address&act=view_more&id=<?php echo $bs['additional_id']; ?>" title="<?php echo $bs['title'];?>"><?php echo $bs['title'];?></a></li>
                   <?php }?>
                   </ul>
                   <hr /><ul class="w"><li><a href ="<?php echo $write; ?>" >Viet bai bo sung</a></li></ul>
        </div> <!-- end cac bai lien quan -->
        
      </div> <!--end middle-->
      
      
</div><!-- end content -->

