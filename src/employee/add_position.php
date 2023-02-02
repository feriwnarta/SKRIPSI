<?php
require_once('../../file/function_proses.php');
require_once('../utils/Uuid.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['position'])) {
    $unique_id = UUID::guidv4();
    $position = mysqli_real_escape_string($db->query, $obj['position']);

    $result = $db->insert('tb_position', 'id_position = "' . $unique_id . '", position = "' . $position . '"');

    if($result) {
        echo json_encode('success', JSON_PRETTY_PRINT);
    } else {
        echo json_encode('failed', JSON_PRETTY_PRINT);
    }
}
