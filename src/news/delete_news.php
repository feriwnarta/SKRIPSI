<?php

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_user']) && isset($obj['id_news'])) {

    $idNews = $obj['id_news'];

    $result = $db->hapus('tb_news', 'id_news = "' . $idNews . '"');

    if($result) {
        echo  json_encode('success');
        die();
    }
    echo  json_encode('failed');

}