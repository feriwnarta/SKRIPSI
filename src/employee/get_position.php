<?php
require_once('../../file/function_proses.php');
require_once('../utils/Uuid.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if (isset($obj['id_user']) && isset($obj['type'])) {

    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $type = mysqli_real_escape_string($db->query, $obj['type']);

    $data_return = array();
    if ($type == 'Landscape') {
        $data_position = $db->select(
            'tb_position',
            'id_position NOT IN ("")',
            'id_position',
            'ASC'
        );

        if (mysqli_num_rows($data_position) > 0) {
            while ($result_position = mysqli_fetch_assoc($data_position)) {
                if ($result_position['position'] == 'Supervisor / Estate Koordinator' || $result_position['position'] == 'Mandor / Kepala Kontraktor' || $result_position['position'] == 'Manager Kontraktor') {

                    $data_return[] = $result_position;
                }
            }
        }
    } else if ($type == 'Kemanan / Security') {
        $data_position = $db->select(
            'tb_position',
            'id_position NOT IN ("")',
            'id_position',
            'ASC'
        );

        if (mysqli_num_rows($data_position) > 0) {
            while ($result_position = mysqli_fetch_assoc($data_position)) {
                if ($result_position['position'] == 'Danru') {

                    $data_return[] = $result_position;
                }
            }
        }
    } else if ($type == 'ME') {
        $data_position = $db->select(
            'tb_position',
            'id_position NOT IN ("")',
            'id_position',
            'ASC'
        );


        if (mysqli_num_rows($data_position) > 0) {
            while ($result_position = mysqli_fetch_assoc($data_position)) {
                if ($result_position['position'] == 'Teknisi' || $result_position['position'] == 'Supervisor / Estate Koordinator') {
                    $data_return[] = $result_position;
                }
            }
        }
    } else if ($type == 'Building controll dan perizinan') {
        $data_position = $db->select(
            'tb_position',
            'id_position NOT IN ("")',
            'id_position',
            'ASC'
        );


        if (mysqli_num_rows($data_position) > 0) {
            while ($result_position = mysqli_fetch_assoc($data_position)) {
                if ($result_position['position'] == 'Supervisor / Estate Koordinator') {
                    $data_return[] = $result_position;
                }
            }
        }
    }

    echo json_encode($data_return, JSON_PRETTY_PRINT);
}
