<!-- start content--->
<div id="content"> 
<div class="portlet-borderless-container1" style="">
<div class="tt_header">
<div class="tt_header_title">
<a href="">Tin tức - Sự kiện » </a>
</div>
</div>

<div class="portlet-content" style="">
<div class="portlet-content-container" style="">
  
  <h1 class="componentheading"><?php echo $tintuc_detail['tieu_de'];?> </h1><span style="font-size: 11px; color: #FF6600;">(Thời gian: <?php echo $tintuc_detail['time'];?>)</span> 

  <table class="">
  <tr>
      <td>
      <div style="float:left; padding:0 5px 3px 0;">                 
      <?php if($tintuc_detail['hinh_anh']) {?>                  
      <img src ="<?php echo $tintuc_detail['hinh_anh'];?>" class="bimg" style="border: 1px solid #CCCCCC; box-shadow: 0 2px 10px #999999; margin: 4px; padding: 5px;" width="112" height ="100"/>
      <?php } else{?>
      <img src ="./data/images/no_image.jpg" class="bimg" width="112" height ="100"/>
      <?php } ?>
      </div>
      <b><?php echo $tintuc_detail['mo_ta'];?></b>
      </td>
      <br />      
  </tr>
                    
     </table>
        <?php echo $tintuc_detail['noi_dung'];?>         
           
    <!-- note for address-->
	<!--
    <hr />
    <h1 class="relate">
    Các bài viết liên quan
    </h1>
    <ul>
    <?php foreach($list_news as $tinlienquan) { ?>
     <li> <a href = "index.php?module=news&act=view&id=<?php echo $tinlienquan['id_news']; ?>"> <?php echo $tinlienquan['tieu_de'];?></a> </li>
    <?php } ?>
    </ul>
     -->
     <div class="pagination"><?php echo $pagination; ?></div> 
     </div> <!--end middle-->

    </div>
   
      
<!-- tu khoa -->
<?php if($tintuc_detail['tag']) { ?>
<div class="group">

<?php echo $tintuc_detail['tag'];?>

</div>
<?php } ?>
<!-- het tu khoa -->      
      

	  <table width="100%" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td width="25" height="24" align="left">
<img width="18" height="18" src="view/theme/default/image/b_6.gif">
</td>
<td class="head_6" align="left">
<span style="color: #0b3050; line-height: 21px; font-family: Tahoma; border-bottom: 2px; font-size: 14px; font-weight: bold"> Các tin khác</span>
</td>
</tr>
<tr>
<td height="2" style="background-color: #5a7185" colspan="2"> </td>
</tr>
</tbody>
</table>
<div>
 <?php foreach($list_news as $tinlienquan) { ?>
<table width="100%" cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td valign="top" style="padding-top: 10px;">
<img src="view/theme/default/image/icon_4.png">
<a style="color: #333" title="<?php echo $tinlienquan['tieu_de'];?>" href="index.php?module=news&act=view&id=<?php echo $tinlienquan['id_news']; ?>""> <?php echo $tinlienquan['tieu_de'];?></a>
<span style="color: Gray; font-size: 11px">
<em> (<?php echo $tinlienquan['time'];?>)</em>
</span>
</td>
</tr>
</tbody>
</table>
<?php } ?>
</div>

	  
</div><!-- end content -->
<script type="text/javascript"><!--
$.tabs('.tabs a'); 
//--></script>
