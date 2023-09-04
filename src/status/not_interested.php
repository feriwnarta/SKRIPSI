<?php
require_once('../../file/function_proses.php');
require_once('../utils/Uuid.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if (isset($obj['id_status']) && isset($obj['report_user_id']) && isset($obj['not_interested'])) {
    $idStatus = $obj['id_status'];
    $reportUserId = $obj['report_user_id'];
    $type = $obj['not_interested'];

    $id = UUID::guidv4();

    $result = $db->insert('tb_setting_socmed', "id_setting_socmed = '{$id}', id_status = '{$idStatus}', report_user_id = '{$reportUserId}', not_interested = '1'");

    if ($result) {
        echo json_encode(
            'success'
        );

        return;
    }

    echo json_encode(
        'failed'
    );
}
