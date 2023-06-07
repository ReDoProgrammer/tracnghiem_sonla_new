<div id="content">
  <div class="top1">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center">
    <div class="heading"><?php echo $heading_title;?></div>
  </div>
</div>
<div class="middle">

      <p><?php echo $text_note; ?></p>
      <b style="margin-bottom: 2px; display: block;"><?php echo $content; ?></b>
       <div class ="success">
        <table>
        <tr><td> 
        <?php echo $detail; echo $_SESSION['np'];?>
        
        </td></tr>
       
       </table>
      </div>
     <!--
      <div class="buttons">
        <table>
          <tr>
            <td align="right"> <a href="?m=member&act=login">Dang Nhap</a> </td>
          </tr>
        </table>
      </div>
     -->
    </form>
</div>
        <div class="bottom">
	<div class="left"></div>
	<div class="right"></div>
	<div class="center"></div>
	</div>

 </div>
 
 <script type="text/javascript" src="./admin/theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#age').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
<!-- and main -->
