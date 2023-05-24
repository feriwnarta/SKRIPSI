<?php

require_once("../../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['username'])) {
    $username =  mysqli_real_escape_string($db->query, ($obj['username']));

    $data = $db->select('tb_user', 'username = "' . $username . '" OR email= "' . $username . '"', 'id_user', 'ASC');
    if (mysqli_num_rows($data) > 0) {
        $data = mysqli_fetch_assoc($data);
        $data_auth = $db->select('tb_access', 'id_auth = "' . $data['id_auth'] . '"', 'id_access', 'ASC');
        if (mysqli_num_rows($data_auth) > 0) {
            $data_auth = mysqli_fetch_assoc($data_auth);
            echo json_encode($data_auth, JSON_PRETTY_PRINT);
        } else {
            echo json_encode('FAILED AUTH');
        }
    } else {
        echo json_encode('FAILED USER');
    }
}
