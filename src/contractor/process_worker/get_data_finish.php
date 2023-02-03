<?php
require_once("../../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_report']) && !empty($obj['id_worker'])) {
    $id_report = mysqli_real_escape_string($db->query, $obj['id_report']);
    $id_worker = mysqli_real_escape_string($db->query, $obj['id_worker']);

    $rs = $db->select('tb_process_work', 'id_report="' . $id_report . '"', 'id_process_work', 'DESC');


    $data = mysqli_fetch_assoc($rs);
    echo json_encode($data, JSON_PRETTY_PRINT);
}
