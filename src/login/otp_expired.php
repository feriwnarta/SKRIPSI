<?php

require_once('../../file/function_proses.php');
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['iplOrEmail'])) {
    $db = new db();

    $iplOrEmail = $obj['iplOrEmail'];
    $result = $db->update('tb_user', 'otp="0"', 'username="' . $iplOrEmail . '" OR email="' . $iplOrEmail . '"');
    if ($result) {
        echo json_encode('success');
    } else {
        echo json_encode('failed');
    }
}
