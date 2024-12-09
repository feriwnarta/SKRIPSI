<?php

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_user']) && !empty($obj['id_report'])) {
    $id_report = $obj['id_report'];
    $check_report_exist = $db->select('tb_process_report', 'id_report = "' . $id_report . '"', 'id_process_report', 'ASC');

    // cek apakah laporan sudah dikerjakan apa belum
    if (mysqli_num_rows($check_report_exist) > 1) {
        echo json_encode('can\'t delete');
    } else {
        $db->hapus('tb_report', 'id_report = "' . $obj['id_report'] . '" && id_user = "' . $obj['id_user'] . '"');
        $rs = $db->affectedRows();
        if ($rs > 0) {
            echo json_encode('success delete');
        } else {
            echo json_encode('failed delete');
        }
    }
}
