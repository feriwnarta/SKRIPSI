<?php
include_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(isset($obj['id_user'])) {
    $id_user = htmlspecialchars($obj['id_user']);

    $data = $db->count('tb_notification', 'id_user = "' .$id_user . '" AND hasSeen = "0" ', 'id_user');
    $data = mysqli_fetch_assoc($data)['count'];
    echo json_encode(array('count' => $data), JSON_PRETTY_PRINT);
}