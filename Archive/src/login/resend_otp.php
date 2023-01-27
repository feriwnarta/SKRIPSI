<?php

use PHPMailer\PHPMailer\PHPMailer;
use WhatsappOtp as GlobalWhatsappOtp;

require_once("../../file/function_proses.php");
require_once("../../PHPMailer/src/PHPMailer.php");
require_once("../../PHPMailer/src/Exception.php");
require_once("../../PHPMailer/src/SMTP.php");
require_once("../login/otp/WhatsApp.php");

$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['noIplOrEmail']) && !empty($obj['status'])) {
    
    
    $noIplOrEmail = mysqli_real_escape_string($db->query, $obj['noIplOrEmail']);
    $status = mysqli_real_escape_string($db->query, $obj['status']);
    
    
    $exist = $db->select('tb_user', 'username="' . $noIplOrEmail . '" OR email ="' . $noIplOrEmail . '"', 'id_user', 'ASC');
    $data = mysqli_fetch_assoc($exist);
    $email = $data['email'];
    $no_telp = $data['no_telp'];
    
    if (mysqli_num_rows($exist) > 0) {
        $otp = random_int(100000, 999999);
        $rs = $db->update('tb_user', 'otp="' . $otp . '"', 'username="' . $noIplOrEmail . '" OR email ="' . $noIplOrEmail . '"');
        if ($rs) {
            if($status == 'EMAIL') {
                sendOtpEmail($email, $otp);
            } else if ($status == 'WHATSAPP') {
               sendOtpWa($no_telp, $otp);
            }
            
        } else {
            echo json_encode('gagal update');
        }
    } else {
        echo json_encode('no ipl tidak ada');
    }
}

function sendOtpWa($no_telp, $otp) {
    $message = 'Gunakan ' . $otp . ' untuk otp RW 05 BGM PIK APP, jangan bagikan kode ini dengan siapa pun';
    $result = GlobalWhatsappOtp::sendOtp($no_telp, $message);  
    if($result['status'] == true && $result['quota'] > 0) {
    echo json_encode('success kirim otp wa');
    } else {
    echo json_encode('failed kirim otp wa');
    }
}

function sendOtpEmail($email, $otp) {
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

    $mail->Subject = "New OTP :";
    $mail->Body = "Your New OTP is : " . $otp;

    if (!$mail->send()) {
        echo json_encode("Mailer Error: ");
    } else {
        // sent this to flutter
        echo json_encode("email terkirim");
    }
}
