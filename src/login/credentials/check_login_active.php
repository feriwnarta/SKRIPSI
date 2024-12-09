<?php

require_once("../../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['id_user']) && isset($obj['device_name']) && isset($obj['device_identifier'])) {
    $id_user =  mysqli_real_escape_string($db->query, $obj['id_user']);
    $device_name = mysqli_real_escape_string($db->query, $obj['device_name']);
    $device_identifier = mysqli_real_escape_string($db->query, $obj['device_identifier']);

    $cek_user_login = $db->select('tb_user_login_auth', 'id_user="' . $id_user . '" AND device_name="' . $device_name . '" AND device_identifier = "' . $device_identifier . '"', 'id_login_auth', 'DESC');
    $exist_login = $db->select('tb_user_login_auth', 'id_user="' . $id_user . '"', 'id_login_auth', 'DESC');
    
    if(mysqli_num_rows($exist_login) > 0) {
        if(mysqli_num_rows($cek_user_login) > 0) {
            // can login
            echo json_encode('OKE');
        } else {
            echo json_encode('FAILL');
        }   
    } else {
        echo json_encode('RELOG');
    }
}
