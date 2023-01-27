<?php

// require_once('../../file/function_proses.php');
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

class CheckNotification
{
    static function activeNotif($id_user)
    {
        
        $db = new db();
        $data = $db->select('tb_settings_notification', 'id_user = "' . $id_user . '"', 'id_user', "ASC");

        if (mysqli_num_rows($data) > 0) {
            $data = mysqli_fetch_assoc($data);
            return $data;
        }
    }
}
