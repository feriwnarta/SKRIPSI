<?php

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_user']) && isset($obj['id_informasi_umum'])) {

    $idInformasiUmum = $obj['id_informasi_umum'];

    $result = $db->hapus('tb_informasi_umum', 'id_informasi_umum = "' . $idInformasiUmum . '"');


    if($result) {
        echo  json_encode('success');
        die();
    }
    echo  json_encode('failed');

}