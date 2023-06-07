<?php

/**
 * @author honestphan
 * @copyright 2011
 * Basic on PHP_Mailer
*/
 
class send_email {
    public $mail_to;
    public $user_name;
    public $site_name;
    public $site_email;
    public $subject;
    public $content;
    public $send_type;
    public $auth = fasle;
    
    function send(){
       if($this->send_type == '0'){  //truong hop su dung function mail
        $to = $this->mail_to;
        $mail = new PHPMailer(true); // the true param means it will throw exceptions on errors, which we need to catch
        $mail->IsSendmail(); // telling the class to use SendMail transport
        try {
          $mail->AddReplyTo($to, $this->user_name);
          $mail->AddAddress($to, $this->user_name);
          $mail->SetFrom($this->site_email, $this->site_name);
          $mail->AddReplyTo($this->site_email, $this->site_name);
          $mail->Subject = $this->subject;
          $mail->Body = $this->content;
          $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
          $mail->MsgHTML($this->content);
          //$mail->AddAttachment('images/logo.gif');      // attachment
         // $mail->AddAttachment('images/icon.gif'); // attachment
          $mail->Send();
          echo "Message Sent OK php function</p>\n";
        } catch (phpmailerException $e) {
          echo $e->errorMessage(); //Pretty error messages from PHPMailer
        } catch (Exception $e) {
          echo $e->getMessage(); //Boring error messages from anything else!
        }
        }
        
        if($this->send_type == '1'){  //localhost smtp mail
        
            $mail = new PHPMailer(true); // the true param means it will throw exceptions on errors, which we need to catch

        $mail->IsSMTP(); // telling the class to use SMTP
        
        try {
          $mail->Host       = HOST_MAIL; // SMTP server
          //$mail->SMTPDebug  = 2;      // enables SMTP debug information (for testing)
          $mail->SMTPAuth   = $this->auth;  // enable SMTP authentication
          $mail->Host       = HOST_MAIL; // sets the SMTP server
          $mail->Port       = SMTP_PORT; // set the SMTP port for the GMAIL server
          $mail->Username   = SMTP_USER_NAME; // SMTP account username
          $mail->Password   = SMTP_PASSWORD; // SMTP account password
          $mail->AddReplyTo($this->site_email, $this->site_name);
          $mail->AddAddress($this->mail_receive, $this->user_name); // nguoi nhan
          $mail->SetFrom($this->site_email, $this->site_name);
          $mail->AddReplyTo($this->site_email, $this->site_name);
          $mail->Subject = $this->subject;
          $mail->Body = $this->content;
          $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
          $mail->MsgHTML($this->content);
          $mail->AddAttachment('images/logo.gif');      // attachment
          $mail->AddAttachment('images/icon.gif'); // attachment
          $mail->Send();
          echo "Message Sent OK smtp local</p>\n";
        } catch (phpmailerException $e) {
          echo $e->errorMessage(); //Pretty error messages from PHPMailer
        } catch (Exception $e) {
          echo $e->getMessage(); //Boring error messages from anything else!
        }
        
	}//end smtp mail
        
        if($this->send_type == '2'){  //gmail smtp
        
        $mail = new PHPMailer(true); // the true param means it will throw exceptions on errors, which we need to catch
        $mail->IsSMTP(); // telling the class to use SMTP
        try {
          $mail->Host       = HOST_MAIL; // SMTP server
          $mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)
          $mail->SMTPAuth   = $this->auth;                  // enable SMTP authentication
          $mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
          $mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
          $mail->Port       = 465;                   // set the SMTP port for the GMAIL server
          $mail->Username   = GMAIL_ACCOUNT;  // GMAIL username
          $mail->Password   = GMAIL_PASS;            // GMAIL password
          $mail->AddReplyTo($this->site_email, $this->site_name);
          $mail->AddAddress($this->mail_receive, $this->user_name); // nguoi nhan
          $mail->SetFrom($this->site_email, $this->site_name);
          $mail->AddReplyTo($this->site_email, $this->site_name);
          $mail->Subject = $this->subject;
          $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; // optional - MsgHTML will create an alternate automatically
          $mail->Body = $this->content;
          $mail->MsgHTML($this->content);
          $mail->AddAttachment('images/logo.gif');      // attachment
          $mail->AddAttachment('images/icon.gif'); // attachment
          $mail->Send();
          echo "Message Sent OK gmail</p>\n";
        } catch (phpmailerException $e) {
          echo $e->errorMessage(); //Pretty error messages from PHPMailer
        } catch (Exception $e) {
          echo $e->getMessage(); //Boring error messages from anything else!
        }
               
        }//end gmail  
        
        
        
    }//end function sent mail
    
    
}//end class

?>