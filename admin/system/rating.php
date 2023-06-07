<?php
mysql_connect("localhost", "root", "huongliem") or die(mysql_error());
mysql_select_db("da") or die(mysql_error());
$rating = (int)$_POST['rating'];
$id = (int)$_POST['id'];

$query = mysql_query("SELECT * FROM info_address WHERE info_address_id = '".$id."'") or die(mysql_error());

while($row = mysql_fetch_array($query)) {

	if($rating > 5 || $rating < 1) {
		echo"Rating can't be below 1 or more than 5";
	}
	
	elseif(isset($_COOKIE['rated'.$id])) {
		echo"<div class='highlight'>Bạn đã cho điểm rồi..</div>";
	}
	else {

		setcookie("rated".$id, $id, time()+60*60*24*365);

		$total_ratings = $row['number'];
		$total_rating = $row['total'];
		$current_rating = $row['rating'];

		$new_total_rating = $total_rating + $rating;
		$new_total_ratings = $total_ratings + 1;
		$new_rating = $new_total_rating / $new_total_ratings;
		
	     // Lets run the queries. 

		mysql_query("UPDATE info_address  SET total = '".$new_total_rating."' WHERE info_address_id = '".$id."'") or die(mysql_error());
		mysql_query("UPDATE info_address  SET rating = '".$new_rating."' WHERE info_address_id = '".$id."'") or die(mysql_error());
		mysql_query("UPDATE info_address  SET number = '".$new_total_ratings."' WHERE info_address_id = '".$id."'") or die(mysql_error());

		echo"<div class='highlight'>Cho điểm thành công!</div>";

	}
}

?>