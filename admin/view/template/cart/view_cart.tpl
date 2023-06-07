<style>
.hoso {
	border-collapse: collapse;
	width: 100%;
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;
	margin-bottom: 20px;
}
.hoso td {
	border-right: 1px solid #DDDDDD;
	border-bottom: 1px solid #DDDDDD;
}
.hoso thead td {
	background-color: #EFEFEF;
	padding: 0px 5px;
}
.hoso thead td a, .hoso thead td {
	text-decoration: none;
	color: #222222;
	font-weight: bold;
}
.hoso tbody a {
	text-decoration: underline;
}

.hoso tbody td {
        vertical-align: middle;
	    padding: 5px 5px;
}

.tit{
    text-transform: uppercase;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    color: red;
}
</style>


<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
Chi tiet dat phong online
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      
      <table class="hoso">
      
      <tr>
     
      <td>ten </td> <td> <?php echo $lienhe['tieu_de'];?> </td> 

      </tr>
      <tr><td><?php echo $tieu_de; ?></td><td><?php echo $hotel['tieu_de'];?></td></tr>       
      
    
      </table>
      
      
      
    </form>
  </div><div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
</div>
<?php include('view/template/common/footer.tpl'); ?>