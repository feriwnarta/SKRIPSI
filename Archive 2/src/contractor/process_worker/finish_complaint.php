<?php
require_once("../../../file/function_proses.php");
require_once("../../send-notif/firebase_messaging.php");
require_once("../../settings_notification/add_notification.php");
require_once("../../settings_notification/check_notification.php");
require_once("../../utils/Uuid.php");

$db = new db();

if (!empty($_POST['id_report']) && !empty($_POST['id_worker']) && !empty($_POST['finish_time']) && !empty($_POST['duration'])) {
    $id_report = mysqli_real_escape_string($db->query, $_POST['id_report']);
    $id_worker = mysqli_real_escape_string($db->query, $_POST['id_worker']);
    $finish_time = mysqli_real_escape_string($db->query, $_POST['finish_time']);
    $duration = mysqli_real_escape_string($db->query, $_POST['duration']);
    $message = 'Laporan Selesai';

    $contractor_exist = $db->select('tb_contractor', 'id_contractor = "' . $id_worker . '"', 'id_contractor', 'ASC');

    if (mysqli_num_rows($contractor_exist) > 0) {

        $contractor_exist = mysqli_fetch_assoc($contractor_exist);
        $message = 'Laporan selesai dikerjakan oleh kepala kontraktor (' . $contractor_exist['name_contractor'] . ')';
    }

    // foto
    if (isset($_FILES['image1'])) {
        $image1 = $_FILES['image1'];
        $tmp_name = $_FILES['image1']['tmp_name'];
        $valid_ext = array('png', 'jpeg', 'jpg');
        // file extension
        $file_extension = pathinfo($_FILES['image1']['name'], PATHINFO_EXTENSION);
        $file_extension = strtolower($file_extension);
        if (in_array($file_extension, $valid_ext)) {
            $bytes = random_bytes(20);
            $image_location = '../../../imageworker/' . bin2hex($bytes) . ".$file_extension";
            move_uploaded_file($tmp_name, $image_location);
            $ubah1 = str_replace("../", "", $image_location);
        }
    }

    if (isset($_FILES['image2'])) {
        $image2 = $_FILES['image2'];
        $tmp_name = $_FILES['image2']['tmp_name'];
        $valid_ext = array('png', 'jpeg', 'jpg');
        // file extension
        $file_extension = pathinfo($_FILES['image2']['name'], PATHINFO_EXTENSION);
        $file_extension = strtolower($file_extension);
        if (in_array($file_extension, $valid_ext)) {
            $bytes = random_bytes(20);
            $image_location = '../../../imageworker/' . bin2hex($bytes) . ".$file_extension";
            move_uploaded_file($tmp_name, $image_location);
            $ubah2 = str_replace("../", "", $image_location);
        }
    }


    if (isset($ubah1) && isset($ubah2)) {
        $r = $db->update('tb_process_work', 'photo_complete_1="' . $ubah1 . '"', 'id_report="' . $id_report . '"');
        $r = $db->update('tb_process_work', 'photo_complete_2="' . $ubah2 . '"', 'id_report="' . $id_report . '"');
    } else if (isset($ubah1)) {
        $r = $db->update('tb_process_work', 'photo_complete_1="' . $ubah1 . '"', 'id_report="' . $id_report . '"');
    } else if (isset($ubah2)) {
        $r = $db->update('tb_process_work', 'photo_complete_2="' . $ubah2 . '"', 'id_report="' . $id_report . '"');
    }



    $rswork = $db->update('tb_process_work', 'finish_time="' . $finish_time . '", duration="' . $duration . '"', 'id_report="' . $id_report . '"');
    $rsprocess = $db->insert('tb_process_report', 'id_report="' . $id_report . '", id_worker="' . $id_worker . '", status_process="' . $message . '"');
    $status = 'Selesai';
    $rsreport = $db->update('tb_report', 'status="' . $status . '", status_eskalasi = ""', 'id_report="' . $id_report . '"');

    // ambil id user berdasarkan id report
    $id_user = $db->select('tb_report', 'id_report="' . $id_report . '"', 'id_report', 'DESC');
    $id_user = mysqli_fetch_assoc($id_user);
    $category = $id_user['no_ticket'];

    $body = 'Laporan anda "' . $id_user['no_ticket'] . '" telah selesai dikerjakan';
    $id_user = $id_user['id_user'];


    $content_notif = 'Laporanmu ' . $category . 'telah selesai dikerjakan';
    $title_notif = 'Cordinator menanggapi laporan';

    $result_save_notif = AddNotification::saveNotif($id_user, $id_worker, 'REPORT COMPLETE', $content_notif, $title_notif);


    if ($result_save_notif) {
        $active_notif = CheckNotification::activeNotif($id_user);

        if ($active_notif['report_completed'] == '1') {
            // kirim notif keuser bahwa laporan sudah selesai dikerjakan
            $toket = $db->select('tb_user_fcm_token', 'id_user="' . $id_user . '"', 'id_fcm', 'DESC');
            $toket = mysqli_fetch_assoc($toket)['token'];
            $title = 'Laporan selesai dikerjakan';

            // kirim notif ke user
            FirebaseMessaging::sendNotif($toket, $title, $body);
        }
        if ($r && $rsreport && $rsprocess && $rswork) {
            echo json_encode('OKE');
        } else {
            echo json_encode('FAILL');
        }
    } else {
        echo json_encode('FAILL SAVE NOTIF');
    }
}
