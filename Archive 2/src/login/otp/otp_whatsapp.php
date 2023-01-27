<?php
require_once("../../../file/function_proses.php");
require_once("WhatsApp.php");
use WhatsappOtp as GlobalWhatsappOtp;

$db = new db;

if(!empty($_POST['no_telp']) && !empty('email')) {
    $otp = random_int(100000, 999999);
    $no_telp = $_POST['no_telp'];
    $email = $_POST['email'];
    $message = 'Gunakan ' . $otp . ' untuk otp RW 05 BGM PIK APP, jangan bagikan kode ini dengan siapa pun';

    $result = GlobalWhatsappOtp::sendOtp($no_telp, $message);
    
    if($result == 'whatsapp number not found') {
         echo json_encode('wa number not found');
    }
    
    if(isset($result['status'])) {
        if($result['status'] == true && $result['quota'] > 0) {
            $rs = $db->update('tb_user', 'otp="'.$otp.'"', 'email="'.$email.'"');
            echo json_encode('success');
        } else {
            echo json_encode('failed');
        }    
    }
    
}
