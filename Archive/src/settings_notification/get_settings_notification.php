<?php

include_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user'])) {
    $id_user =  mysqli_real_escape_string($db->query, ($obj['id_user']));

    $result = $db->select('tb_settings_notification', 'id_user = "' . $id_user . '"', 'id_user', 'ASC');

    if (mysqli_num_rows($result) > 0) {
        $result = mysqli_fetch_assoc($result);

        $data_return = array();

        foreach($result as $key => $val) {
            if($key != 'id_user' && $key != 'id_notification') {
                $data_return[$key] = $val;
            }
        }

        echo json_encode($data_return, JSON_PRETTY_PRINT);

    } else {
        echo json_encode('USER NOT FOUND');
    }
} 
