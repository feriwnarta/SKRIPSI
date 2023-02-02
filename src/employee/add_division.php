<?php
require_once('../../file/function_proses.php');
require_once('../utils/Uuid.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['division'])) {
    $unique_id = UUID::guidv4();
    $division = mysqli_real_escape_string($db->query, $obj['division']);
    $result = $db->insert('tb_division', 'divisi = "' . $division . '", id_division = "' . $unique_id . '"');
    if ($result) {
        echo json_encode('success', JSON_PRETTY_PRINT);
    } else {
        echo json_encode('failed', JSON_PRETTY_PRINT);
    }
}
