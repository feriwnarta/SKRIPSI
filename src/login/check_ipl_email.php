<?php

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['iplOrEmail'])) {
    $iplOrEmail = $obj['iplOrEmail'];
    $result = $db->select('tb_user', 'username="' . $iplOrEmail . '" OR email = "' . $iplOrEmail . '"', 'id_user', 'ASC');
    if(mysqli_num_rows($result) > 0) {
        $result = mysqli_fetch_assoc($result);
        echo json_encode(
        array(
            "status" => "success",
            "email" =>  $result['email'],
            "no_telp" => $result['no_telp']
        )
        );
    } else {
        echo json_encode(
        array(
            "status" => "failed",
            "email" =>  "",
            "no_telp" => ""
        )
        );
    }
}