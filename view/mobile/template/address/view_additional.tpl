

  
    <div id="heading">
     <a href="?m=address&act=view&id=<?php echo $aid;?>"><?php echo $heading_title; ?></a>
    </div>
 
  <div class="middle">
    <div style="width: 100%; margin-bottom: 30px;">
      <table style="width: 100%; border-collapse: collapse;">
        <tr>
         <td style="text-align: center; width: 250px; vertical-align: top;">
         <a href="<?php echo $image;?>" title="<?php echo $heading_title; ?>" class="thickbox" rel="shadowbox[Vacation]">
          <img src="<?php echo $image;?>" width ="250" border="1"title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" style="margin-bottom: 3px;" /></a><br />
          <?php foreach($imgs as $img){?>
          <a href="images/address/<?php echo $img['image']; ?>" rel="shadowbox[Vacation]"></a>
          <?php } ?>
          <span style="font-size: 11px;"><?php echo "click xem to"; ?></span></td>
          <td style="padding-left: 15px; width: 296px; vertical-align: top;"><table width="100%">
             
              
              <tr class="dot">
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
              
                <tr>
                <td><b>Website</b></td>
                <td><?php echo $address['website'];?></td>
              </tr>
              
                <tr>
                <td><b>Yahoo</b></td>
                <td><?php echo $address['yahoo'];?></td>
              </tr>
              
			  <tr>
                <td><b>Danh gia</b></td>
              <td>
              <?php echo $address['rating'];?> diem
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
		 </table>
          <!-- AddThis Button BEGIN 
    <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
    <a class="addthis_button_preferred_1"></a>
    <a class="addthis_button_preferred_2"></a>
    <a class="addthis_button_preferred_3"></a>
    <a class="addthis_button_preferred_4"></a>
    <a class="addthis_button_compact"></a>
    </div>
    <script type="text/javascript">var addthis_config = {"data_track_clickback":true};</script>
    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4d94c1575c37062d"></script>
    <!-- AddThis Button END -->
         <img src ="view/theme/default/image/icon_share.png"/>
          <!-- khi offline -->
       </td>
      </tr>
  </table>
    </div>
   <div style="background: #F7F7F7; border: 1px solid #DDDDDD; padding: 10px; margin-bottom: 10px;">
   <li style="list-style:none;"> <b>Ten cong ty</b>: <?php echo $address['info_address_name'];?> </li>
   <li style="list-style:none;"> <b>Dia chi</b>:<?php echo $address['address1']; ?> - <?php echo $address['address2'];?></li>
   </div>
    <div class="tabs">
      <a tab="#tab_description">Mo ta</a>
      <a tab="#tab_map">Ban do</a>
     <a tab="#tab_comment">Danh gia</a>
     <!--
      <a tab="#tab_additional">Bai viet bo sung </a>
      -->
    </div>
    <div id="tab_description" class="tab_page">
    <b> <?php echo $bsd['title'];?></b><br />
    <hr />
   <p align="justify"> <?php echo $bsd['content'];?></p>
    <hr />
    Bai nay co <?php echo $bsd['view'];?> luot xem. Viet boi <?php echo $bsd['user_name'];?> - <?php echo $bsd['add_date'];?>
    </div>
 
    <div id="tab_comment" class="tab_page">
     <div id="review"></div>
      <div class="heading" id="review_title">Dang y kien danh gia cua ban</div>
      <div class="content"><b>Tieu de</b><br />
       <?php if((GUEST_COMMENT =='1')&&($_SESSION['user_id']=="")){?>
         <b>Email cua ban</b><br/>
        <input type="text" name="author" size="40"/>
        <?php }?>
        <input type="hidden" name="user_id" value="<?php echo $_SESSION['user_id'];?>" />
       <br />
        <b>Noi dung</b>
        <textarea name="text" style="width: 98%;" rows="8"></textarea>
        <?php if(GUEST_COMMENT =='1'){?>
        <b>Captcha</b><br />
        <input type="text" name="captcha" value="" autocomplete="off" />
        <br />
        <img src="<?php echo $captcha; ?>" id="captcha" /></div>
       <?php }?>
      <div class="buttons">
        <table>
          <tr>
            <td align="right"><a onclick="review();" class="button"><span><?php echo "Gui di"; ?></span></a></td>
          </tr>
        </table>
      </div>
     
    </div> <!-- end tab_comment -->
    
    
    <div id="tab_map" class="tab_page">
      
      <div style="display: inline-block;">
        
        <div style="display: inline-block; float: left; text-align: center; margin-left: 5px; margin-right: 5px; margin-bottom: 10px;">
        <?php if($address['map']){?>
        <a href="images/map/<?php echo $address['map']; ?>" title="<?php echo $heading_title; ?>" class="thickbox" rel="shadowbox"><img src="images/map/<?php echo $address['map']?>" width="520" height="330"title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" style="border: 1px solid #DDDDDD; margin-bottom: 3px;" /></a><br />
          <span style="font-size: 11px;"><?php echo $text_enlarge; ?></span></div>
        <?php } else {?>
          No map
        <?php } ?>
      </div>
     
    </div>
    <!--
    <div id="tab_additional" class="tab_page">
      <?php if ($address) { ?>
      <table class="list">
        <a href ="<?php echo $write; ?>">Viet bai bo sung</a>
      </table>
      <?php } else { ?>
      <div style="background: #F7F7F7; border: 1px solid #DDDDDD; padding: 10px; margin-bottom: 10px;"><?php echo $text_no_related; ?></div>
      <?php } ?>
    </div>
    -->
    <!-- cac bai lien quan -->
   <div style="background: #F7F7F7; border: 1px solid #DDDDDD; padding: 10px; margin-bottom: 10px;">
   <li style="list-style:none;"> <b>Cac bai lien quan den <a href="?m=address&act=view&id=<?php echo $aid;?>"><?php echo $address['info_address_name'];?></a> </b></li>
   <hr />
   <?php foreach($list_additionals as $bs){?>
   <li style="list-style:none;"><a href = "?m=address&act=view_more&id=<?php echo $bs['additional_id']; ?>" title="<?php echo $bs['title'];?>"><?php echo $bs['title'];?></a> - Viet boi <?php echo $bs['user_name'];?> vao ngay <?php echo $bs['add_date'];?></li>
   <?php }?>
    <hr />
     <a href ="<?php echo $write; ?>">Viet bai bo sung</a>
   </div>
    <!-- end cac bai lien quan -->
  </div>
  </div>
  </div>
 <div class="bottom">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center"></div>
  </div>
</div>

<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').slideUp('slow');
		
	$('#review').load(this.href);
	
	$('#review').slideDown('slow');
	
	return false;
});			

$('#review').load('?m=address&act=list_comment&id=<?php echo $address['info_address_id']; ?>');

function review() {
	$.ajax({
		type: 'POST',
		url: '?m=address&act=comment&id=<?php echo $address['info_address_id']; ?>',
		dataType: 'json',
		data: 'author=' + encodeURIComponent($('input[name=\'author\']').val()) + '&content=' + encodeURIComponent($('textarea[name=\'content\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#review_button').attr('disabled', 'disabled');
			$('#review_title').after('<div class="wait"><img src="view/theme/default/image/loading_1.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#review_button').attr('disabled', '');
			$('.wait').remove();
		},
		success: function(data) {
			if (data.error) {
				$('#review_title').after('<div class="warning">' + data.error + '</div>');
			}
			
			if (data.success) {
				$('#review_title').after('<div class="success">' + data.success + '</div>');
								
				$('input[name=\'author\']').val('');
				$('textarea[name=\'content\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
}
//--></script>
<script type="text/javascript"><!--
$.tabs('.tabs a'); 
//--></script>
