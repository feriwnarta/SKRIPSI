<?php

require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);

    
    $data = $db->select('tb_master_category', 'id_master_category', 'id_master_category', 'asc');

    $data_return = array(
        [
            'id_master_category' => 'Semua',
            'unit' => 'Semua',
        ]
    );
    while ($result = mysqli_fetch_assoc($data)) {
        $data_return[] = $result;
    }

    echo json_encode($data_return, JSON_PRETTY_PRINT);
}
