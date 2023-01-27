<?php

include_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user']) && isset($obj['status']) && isset($obj['value'])) {
    $id_user =  mysqli_real_escape_string($db->query, ($obj['id_user']));
    $status_user =  mysqli_real_escape_string($db->query, ($obj['status']));
    $value =  mysqli_real_escape_string($db->query, ($obj['value']));

    switch ($status_user) {
        case 'laporan_diterima':

            if ($value) {
                if ($db->update('tb_settings_notification', 'report_received = "1"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            } else {
                if ($db->update('tb_settings_notification', 'report_received = "0"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            }

            break;
        case 'laporan_dikerjakan':

            if ($value) {
                if ($db->update('tb_settings_notification', 'report_done = "1"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            } else {
                if ($db->update('tb_settings_notification', 'report_done = "0"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            }

            break;

        case 'laporan_selesai':

            if ($value) {
                if ($db->update('tb_settings_notification', 'report_completed = "1"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            } else {
                if ($db->update('tb_settings_notification', 'report_completed = "0"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            }

            break;

        case 'komentar':
            if ($value) {
                if ($db->update('tb_settings_notification', 'commentar = "1"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            } else {
                if ($db->update('tb_settings_notification', 'commentar = "0"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            }
            break;
        case 'like_status':
            if ($value) {
                if ($db->update('tb_settings_notification', 'like_status = "1"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            } else {
                if ($db->update('tb_settings_notification', 'like_status = "0"', 'id_user = "' . $id_user . '"')) {
                    echo json_encode('SUCESS');
                } else {
                    echo json_encode('FAILED');
                }
            }
            break;
        default:
            echo json_encode('FAILED STATUS');
            break;
    }
}
