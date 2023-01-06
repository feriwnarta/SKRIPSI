<?php
require_once('../../file/function_proses.php');
require_once("../utils/Uuid.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['id_user']) && isset($obj['status'])) {
    $status =  mysqli_real_escape_string($db->query, ($obj['status']));

    $unique_id = UUID::guidv4();
    $unique_id_access = UUID::guidv4();

    $result = $db->select('tb_authorization', 'status="' . $status . '"', 'id_auth', 'ASC');

    if (!mysqli_num_rows($result) > 0) {
        if ($db->insert('tb_authorization', 'id_auth = "' . $unique_id . '", status = "' . $status . '"')) {
            if ($db->insert('tb_access', 'id_access = "' . $unique_id_access . '", id_auth = "' . $unique_id . '"')) {
                echo json_encode('SUCCESS');
            } else {
                echo json_encode('FAILL');
            }
        } else {
            echo json_encode('FAILL');
        }
    } else {
        echo json_encode('AUTH EXIST');
    }
}
