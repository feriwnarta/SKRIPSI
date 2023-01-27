<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['id_user']) && isset($obj['id_report']) && isset($obj['star']) && isset($obj['comment'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $id_report = mysqli_real_escape_string($db->query, $obj['id_report']);
    $star = mysqli_real_escape_string($db->query, $obj['star']);
    $comment = mysqli_real_escape_string($db->query, $obj['comment']);

    $result = $db->update('tb_report', 'star="' . $star . '", comment="' . $comment . '"', 'id_report="' . $id_report . '"');
    if ($result) {
        echo json_encode('OKE');
    } else {
        echo json_encode('FAILL');
    }
}
