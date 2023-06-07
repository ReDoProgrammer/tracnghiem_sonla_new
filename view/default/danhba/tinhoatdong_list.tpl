<div class="portlet-borderless-container1" style="">
<div class="tt_header">
<div class="tt_header_title">
<a href="">Tin tức » <?php echo $tendanhmuc['title'];?></a>
</div>
</div>
<div style="clear: both;"></div>
<div class="portlet-content">
<?php foreach($list_theodanhmuc as $tintuc) { ?>
<div class="aset_show_panel">
<div class="abs_content">
<table>
<tbody>
<tr>
<td colspan="3">
<div style="font-size: 14px; padding-bottom: 5px;">
<a href="./index.php?module=news&act=view&id=<?php echo $tintuc['id_news'];?>&cat=<?php echo $tintuc['dm_id'];?>"><?php echo $tintuc['tieu_de'];?></a>
<span> (<?php echo $tintuc['time'];?>) </span>
</div>
</td>
</tr>
<tr>
<td valign="top">
<?php if($tintuc['hinh_anh']) {?>
<img class="img-outsite" width="160" height="120" align="left" src="<?php echo $tintuc['hinh_anh'];?>" alt="<?php echo $tintuc['ten_tin_hoat_dong'];?>">
<?php } else{?>
<a href ="./index.php?module=news&act=view&id=<?php echo $tintuc['id_news'];?>&cat=<?php echo $tintuc['cat_id'];?>" title="">
<img class="img-outsite" src ="view/theme/default/image/no-avatar.png" width="160" height ="120"/> </a>
                         <?php } ?>
</td>
<td width="0"></td>
<td valign="top" align="justify">
<div>
<b><?php echo $tintuc['mo_ta'];?></b>
</div>
</td>
</tr>
<tr style="">
<td align="" colspan="3" style="">
<a href="./index.php?module=news&act=view&id=<?php echo $tintuc['id_news'];?>&cat=<?php echo $tintuc['dm_id'];?>">
<span style="float: right;"> Đọc tiếp » </span>
</a>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<?php } ?>
</div>
<div class="pagination"><?php echo $pagination; ?></div> 

</div>
