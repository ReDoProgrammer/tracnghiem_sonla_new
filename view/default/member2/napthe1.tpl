<div id="content_right">
<div class="box">
  <div class="box-heading">Nạp thẻ</div>
  <div class="box-content">
<div class="middle">
                 <?php if($loi){?>
                  <div class ="warning">
                  <?php  echo  $loi; ?>
                  </div>
                 <?php }?>

                   <?php if($success){?>
                  <div class ="success">
                  <?php  echo  $success; ?>
                  </div>
                 <?php }?>
                               
 <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="create" onsubmit="return validate(this);">
     
      <b style="margin-bottom: 2px; display: block;"><?php echo $text_napthe; ?> <?php echo $_SESSION['name'];?> </b>
      <div class="group2">
        <table width="100%" border="0" cellpadding="3" cellspacing="3">
    	<tr>
        	<td colspan="2" align="center">
                <font size="4" color ="red"> Số dư hiện tại: <?php echo number_format($member['so_du_tk'],0,'.','.');?> đ </font>
            	<h2>Nạp thẻ điện thoại</h2>
              
            </td>
            
        </tr>
    <tr>
    	<td align="right" width="40%">
        	Nhà Mạng :
        </td>
        <td>
        	<select id="lstTelco" name="lstTelco">
            	<option value="1">Viettel</option>
                <option value="2">MobiFone</option>
                <option value="3">Vinaphone</option>
                <option value="4">Gate</option>
                <option value="5">Vcoin</option>
            </select>
        </td>
    </tr>
    <tr>
    	
            	<td align="right">
                	Số Seri :
                </td>
                <td>
                	<input type="text" id="txtSeri" name="txtSeri" />
                </td>
            </tr>
            <tr><td align="right">
                	Mã số :
                </td>
                <td>
                	<input type="text" id="txtCode" name="txtCode" />
                </td>
            </tr>
             <tr>
            	<td align="right">
                	
                </td>
                <td>
                	<input type="submit" value="Nạp thẻ"  />
                </td>
            </tr>
        </table>
        
          </div>
              <b style="margin-bottom: 2px; display: block;">Nhật ký 50 lần nạp thẻ gần đây nhất</b>
             
               <table class="list_tb">
               
               <thead>
               <tr><td>STT</td><td>Ngày tháng</td> <td>Mã thẻ</td> <td>Seri</td> <td>Loại thẻ</td> <td>Kết quả</td></tr>
               </thead>
               
               <tbody>
               <?php if($list_nknt){  ?>
                  <?php foreach ($list_nknt as $nknt) {  $s=$s+1;  ?>
               <tr><td><?php echo $s; ?></td><td><?php echo $nknt['date']; ?></td> <td><?php echo $nknt['code']; ?></td> <td><?php echo $nknt['seri']; ?></td> 
                 <td><?php  
                  if($nknt['type']==1){ echo 'Viettel'; } 
		  if($nknt['type']==2){ echo 'Mobiphone'; }
		  if($nknt['type']==3){ echo 'VinaPhone'; }
		  if($nknt['type']==4){ echo 'Gate'; }
		  if($nknt['type']==5){ echo 'VCoin'; }
		  ?></td> 
                <td><?php if($nknt['status']){ echo number_format($nknt['status'],0,'.','.');} else{ echo "Thẻ sai";} ?></td></tr>
                  <?php } ?>
              <?php } ?>
               </tbody>
                </table> 
            </form>
        </div>
      
         </div><!-- end botom -->
</div><!-- end content -->
</div>


<!-- and main -->
<script type="text/javascript">
	function validate(theform)
		{
	    	if(theform.txtSeri.value=="")
			{
			alert("Vui lòng nhập seri thẻ");
			theform.txtSeri.focus();
			return false;
			}
            
            else if(theform.txtCode.value=="")
			{
			alert("Vui lòng nhập mã thẻ cào");
			theform.txtCode.focus();
			return false;
			}   
            
          return true;
		}
</script> 