<?php

require_once("../../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_user'])) {
    $id_user = $obj['id_user'];

    $result = $db->select('tb_user', 'id_user="' . $id_user . '"', 'id_user', 'DESC');

    if (mysqli_num_rows($result) > 0) {
        $result = mysqli_fetch_assoc($result);
        $id_user = $result['id_user'];

        $result = $db->select('tb_access', 'id_auth="' . $result['id_auth'] . '"', 'id_auth', 'DESC');

        if (mysqli_num_rows($result) > 0) {
            $access = mysqli_fetch_assoc($result);
            // var_dump($access);
            echo json_encode(
                array(
                    $access
                ),
                JSON_PRETTY_PRINT
            );
        } else {
            echo json_encode('E001');
        }
    } else {
        echo json_encode('E002');
    }
}
