<?php
/**
* Simple example script using PHPMailer with exceptions enabled
* @package phpmailer
* @version $Id$
*/

require '../class.phpmailer.php';

try {
	$mail = new PHPMailer(true); //New instance, with exceptions enabled

	$body             = file_get_contents('contents.html');
	$body             = preg_replace('/\\\\/','', $body); //Strip backslashes

	$mail->IsSMTP();                           // tell the class to use SMTP
	$mail->SMTPAuth   = true;     	// enable SMTP authentication
	              // enable SMTP authentication
	$mail->SMTPSecure = "ssl";  
	$mail->Port       = 465;                    // set the SMTP server port
	$mail->Host       = "mail.sonla.gov.vn"; // SMTP server
	$mail->Username   = "liempv@sonla.gov.vn";     // SMTP server username
	$mail->Password   = "@DtPm2019";            // SMTP server password

	//$mail->IsSendmail();  // tell the class to use Sendmail

	$mail->AddReplyTo("liempv@sonla.gov.vn","First Last");

	$mail->From       = "liempv@sonla.gov.vn";
	$mail->FromName   = "DTPM";

	$to = "liempv@sonla.gov.vn";

	$mail->AddAddress($to);

	$mail->Subject  = "First PHPMailer Message";

	$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test
	$mail->WordWrap   = 80; // set word wrap

	$mail->MsgHTML($body);

	$mail->IsHTML(true); // send as HTML

	$mail->Send();
	echo 'Message has been sent.';
} catch (phpmailerException $e) {
	echo $e->errorMessage();
}
?>