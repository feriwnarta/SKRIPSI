<?php
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

class AddNotification
{
    static function saveNotif($id_user, $id_appropriate, $type, $content, $title)
    {
        $unique_id = UUID::guidv4();
        $db = new db();
        $time = date('Y-m-d H:i:s');

        $rs = $db->insert('tb_notification', 'id_notification = "'. $unique_id .'", id_user = "' . $id_user . '", id_appropriate = "' . $id_appropriate . '", type = "' . $type . '", content = "' . $content . '", title = "' . $title . '", update_at = "' . $time . '"');
        return $rs;
    }
}
