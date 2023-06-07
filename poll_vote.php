<?php

$vote = $_REQUEST['vote'];//get content of textfile
$filename = "poll_result.txt";
$content = file($filename);//put content in array
$array = explode("||", $content[0]);
$poll1 = $array[0];
$poll2 = $array[1];
$poll3 = $array[2];
$poll4 = $array[3];
$poll5 = $array[4];
if ($vote == 0)
 {
 $poll1 = $poll1 + 1;
 }
if ($vote == 1)
 {
 $poll2 = $poll2 + 1;
 }
if ($vote == 2)
 {
 $poll3 = $poll3 + 1;
 }
 if ($vote == 3)
 {
 $poll4 = $poll4 + 1;
 }
 if ($vote == 4)
 {
 $poll5 = $poll5 + 1;
 }
 //insert votes to txt file
$insertvote = $poll1."||".$poll2."||".$poll3."||".$poll4."||".$poll5;
$fp = fopen($filename,"w");
fputs($fp,$insertvote);
fclose($fp);
?><h2>Kết quả:</h2>
<table>
<tr>
<td>Qua internet:</td>
<td>
<img src="poll.gif"
width='<?php echo(100*round($poll1/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>'
height='20'>
<?php echo(100*round($poll1/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>% - [<?php echo $poll1; ?> votes]
</td>
</tr>
<tr>
<td>Qua báo chí:</td>
<td>
<img src="poll.gif" 
width='<?php echo(100*round($poll2/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>'
height='20'>
<?php echo(100*round($poll2/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>% - [<?php echo $poll2; ?> votes]
</td>
</tr>
<tr>
<td>Qua truyền hình:</td>
<td>
<img src="poll.gif" 
width='<?php echo(100*round($poll3/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>'
height='20'>
<?php echo(100*round($poll3/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>% - [<?php echo $poll3; ?> votes]
</td>
</tr>
<tr>
<td>Qua quần chúng:</td>
<td>
<img src="poll.gif" 
width='<?php echo(100*round($poll4/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>'
height='20'>
<?php echo(100*round($poll4/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>% - [<?php echo $poll4; ?> votes]
</td>
</tr>
<tr>
<td>Ý kiến khác	:</td>
<td>
<img src="poll.gif" 
width='<?php echo(100*round($poll5/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>'
height='20'>
<?php echo(100*round($poll5/($poll5+$poll4+$poll3+$poll2+$poll1),5)); ?>% - [<?php echo $poll5; ?> votes]
</td>
</tr>
</table>