<?php
require_once("../../file/function_proses.php");
$db = new db();

$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if(isset($obj['id_user'])) {
    $idUser = htmlspecialchars($obj['id_user']);

    $dataUser = $db->select('tb_user', 'id_user = "' . $idUser . '"', 'id_user', 'ASC');

    if(mysqli_num_rows($dataUser) > 0){
        $dataUser = mysqli_fetch_assoc($dataUser);
        $idAuth = $dataUser['id_auth'];

        // update authorization
        $auth = $db->select('tb_authorization', 'id_auth = "' . $idAuth . '"', 'id_auth', 'ASC');

        if(mysqli_num_rows($auth) > 0) {
            $auth = mysqli_fetch_assoc($auth);

            echo  json_encode(
                [
                    'status' => $auth['status']
                ]
            );

        }
    }
}