<?php

require_once("../../file/function_proses.php");
date_default_timezone_set('asia/jakarta');

$json = file_get_contents('php://input');
$obj = json_decode($json, true);

$db = new db();
if(isset($obj['id_user'])) {

    $thisPeriode = date('Y-m');
    $idUser = $obj['id_user'];


    $result = $db->select('tb_upload_ipl', 'id_user = "' . $idUser . '" AND periode = "' . $thisPeriode . '"', 'create_at', 'DESC');

    if($result == null) {
        echo json_encode(['status' => 'ada sesuatu yang salah hubungi administrator', 'message' => ''], JSON_PRETTY_PRINT);
        return;
    }


    if(mysqli_num_rows($result) == 0) {
        echo json_encode(['status' => 'tidak ada pembayaran dibulan ini', 'message' => ''], JSON_PRETTY_PRINT);
        return;
    }

    $result = mysqli_fetch_assoc($result);

    $status = $result['status'];
    $note = $result['note'];

    switch ($status) {
        case 'Diproses' : echo json_encode(['status' => 'Diproses', 'message' => ''], JSON_PRETTY_PRINT); break;
        case 'Diterima' : echo json_encode(['status' => 'Diterima', 'message' => ''],JSON_PRETTY_PRINT); break;
        case 'Ditolak' : echo json_encode(['status' => 'Ditolak', 'message' => $note],JSON_PRETTY_PRINT); break;
        default : echo json_encode(['status' => 'Diproses', 'message' => ''],JSON_PRETTY_PRINT); break;
    }


}