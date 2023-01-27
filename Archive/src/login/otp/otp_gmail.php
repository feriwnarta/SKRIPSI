<?php

use PHPMailer\PHPMailer\PHPMailer;

require_once("../../../PHPMailer/src/PHPMailer.php");
require_once("../../../PHPMailer/src/Exception.php");
require_once("../../../PHPMailer/src/SMTP.php");
require_once("../../../file/function_proses.php");

$db = new db;

if (!empty($_POST['no_telp']) && !empty($_POST['email'])) {
    $otp = random_int(100000, 999999);
    $no_telp = mysqli_real_escape_string($db->query, $_POST['no_telp']);
    $email = mysqli_real_escape_string($db->query, $_POST['email']);
    
    // kirim Email
    $mail = new PHPMailer();

    //Enable SMTP debugging. 
    $mail->SMTPDebug = 0;
    //Set PHPMailer to use SMTP.
    $mail->isSMTP();
    //Set SMTP host name                          
    $mail->Host = "smtp.gmail.com";
    //Set this to true if SMTP host requires authentication to send email
    $mail->SMTPAuth = true;
    //Provide username and password     
    $mail->Username = "noreply@next-g.website";
    $mail->Password = "51n4r54kt1";
    //If SMTP requires TLS encryption then set it
    $mail->SMTPSecure = "tls";
    //Set TCP port to connect to 
    $mail->Port = 587;

    $mail->From = "noreply@next-g.website";
    $mail->FromName = "rw05bgmpik";

    $mail->addAddress($email, $email);

    $mail->isHTML(true);
    
    // select data user
    $data_user = $db->select('tb_user', 'email="'.$email.'"', 'id_user', 'DESC');
    $data_user = mysqli_fetch_assoc($data_user);

    $mail->Subject = "HI, " . $data_user['username'];
    $mail->Body = "We're Happy you register for RW05 BGM PIK apps. To start using this app please insert your OTP code  :  <u>$otp</u> ";


    if (!$mail->send()) {
        echo json_encode("format email wrong");
    } else {
        // save no otp
        $result = $db->update('tb_user', 'otp="' . $otp .'"', 'email="' . $email.'"');
        if($result) {
            echo json_encode('success');
        } else {
            echo json_encode('failed');
        }
    }
}
