<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user']) && isset($obj['type_worker'])) {

    $status = $obj['type_worker'];

    // hari ini
    $hri_ini = date('Y-m-d');

    if ($status === 'cordinator') {
        $result = $db->select('tb_manpower_cordinator', 'current_day LIKE "%' . $hri_ini . '%"', 'id_manpower', 'DESC');
        if (mysqli_num_rows($result) > 0) {
            $data = array();
            while ($value = mysqli_fetch_assoc($result)) {
                $data[] = [
                    'id_manpower' => $value['id_manpower'],
                    'cluster' => $value['cluster'],
                    'total' => $value['total'],
                    'current_day' => $value['current_day']
                ];
            }
            echo json_encode($data, JSON_PRETTY_PRINT);
        } else {
            echo json_encode(array());
        }
    }
}
