<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_user'])) {
    $result = $db->select('tb_settings_maintenance', 'id_maintenance', 'id_maintenance', 'ASC');
    if (mysqli_num_rows($result) > 0) {
        $data = mysqli_fetch_assoc($result);
        if($data['status'] == 'normal') {
            echo json_encode('NORMAL');
        } else if ($data['status'] == 'maintenance') {
            echo json_encode('MAINTENANCE');
        }
    }
}
