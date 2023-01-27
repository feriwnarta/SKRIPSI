<?php
require_once("../../../file/function_proses.php");
require_once("../../send-notif/firebase_messaging.php");
require_once("../../settings_notification/check_notification.php");
require_once("../../settings_notification/add_notification.php");
require_once("../../utils/Uuid.php");

$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_worker']) && !empty($obj['id_report'])) {
    $id_contractor = mysqli_real_escape_string($db->query, $obj['id_worker']);
    $id_report = mysqli_real_escape_string($db->query, $obj['id_report']);

    $contractor_exist = $db->select('tb_contractor', 'id_contractor = "' . $id_contractor . '"', 'id_contractor', 'ASC');

    $message = 'Laporan diterima';

    if (mysqli_num_rows($contractor_exist) > 0) {
        
        $contractor_exist = mysqli_fetch_assoc($contractor_exist);
        $message = 'Laporan Diterima oleh kepala kontraktor (' . $contractor_exist['name_contractor'] . ')';
    }

    $result = $db->insert('tb_process_report', 'id_report="' . $id_report . '", id_worker="' . $id_contractor . '",status_process="' . $message . '"');

    if ($result) {
        $status = 'Diterima';
        $dt = $db->update('tb_report', 'status="' . $status . '"', 'id_report="' . $id_report . '"');

        if ($dt) {
            // ambil id user berdasarkan id report
            $id_user = $db->select('tb_report', 'id_report="' . $id_report . '"', 'id_report', 'DESC');
            $id_user = mysqli_fetch_assoc($id_user);
            $body = 'Laporan anda "' . $id_user['no_ticket'] . '" telah diterima';
            $category = $id_user['category'];
            $id_user = $id_user['id_user'];




            // kirim notif keuser bahwa laporan diterima
            $toket = $db->select('tb_user_fcm_token', 'id_user="' . $id_user . '"', 'id_fcm', 'DESC');
            $toket = mysqli_fetch_assoc($toket)['token'];
            $title = 'Laporan diterima';

            $title_notif = 'Cordinator menanggapi laporanmu';
            $contet_notif = 'Laporan mu tentang ' . $category . ' telah diterima dan akan segera diproses';

            $result_add_notif = AddNotification::saveNotif($id_user, $id_contractor, 'REPORT ACCEPT', $contet_notif, $title_notif);

            if ($result_add_notif) {
                // kirim notif ke user
                $data = CheckNotification::activeNotif($id_user);

                if ($data['report_received'] == '1') {
                    FirebaseMessaging::sendNotif($toket, $title, $body);
                }
                echo json_encode('success');
            } else {
                echo json_encode('failed add notif');
            }
        } else {
            echo json_encode('gagal update laporan');
        }
    } else {
        echo json_encode('FAILL');
    }
}
