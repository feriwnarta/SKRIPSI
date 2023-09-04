<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['id_user'])) {

    $idUser = $obj['id_user'];

    $deleteUser = $db->hapus('tb_user', 'id_user = "' . $idUser . '"');
    $deleteReport = $db->hapus('tb_report', 'id_user = "' . $idUser . '"');
    $deleteNotif = $db->hapus('tb_notification', 'id_user = "' . $idUser . '"');
    $deleteLike = $db->hapus('tb_like_status', 'id_user = "' . $idUser . '"');
    $deleteComment = $db->hapus('tb_comment', 'id_user = "' . $idUser . '"');


    echo json_encode('success');
}
