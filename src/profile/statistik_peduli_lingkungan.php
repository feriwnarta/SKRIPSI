<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['id_user'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);

    // query cek tabel complaint
    $data_complaint = mysqli_fetch_assoc($db->count('tb_report', 'id_user="' . $id_user . '"', 'id_user'))['count'];
    $data_request = mysqli_fetch_assoc($db->count('tb_request', 'id_user="' . $id_user . '"', 'id_user'))['count'];
    $total = $data_request + $data_complaint;

    echo json_encode(
        array(
            'total_peduli_lingkungan' => $total,
            'peduli_lingkungan_umum' => $data_complaint,
            'peduli_lingkungan_pribadi' => $data_request
        ),
        JSON_PRETTY_PRINT
    );
}
