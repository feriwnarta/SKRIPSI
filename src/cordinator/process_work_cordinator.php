<?php
require_once("../../file/function_proses.php");
require_once("../send-notif/firebase_messaging.php");
require_once("../settings_notification/check_notification.php");
require_once("../settings_notification/add_notification.php");
require_once("../utils/Uuid.php");

$db = new db();

if (!empty($_POST['id_report']) && !empty($_POST['id_estate_cordinator'])  && !empty($_POST['message'])) {
	$id_report = mysqli_real_escape_string($db->query, ($_POST['id_report']));
	$id_estate_cordinator = mysqli_real_escape_string($db->query, ($_POST['id_estate_cordinator']));

	if (isset($_FILES['image1'])) {
		$image1 = $_FILES['image1'];
		$tmp_name = $_FILES['image1']['tmp_name'];
		$valid_ext = array('png', 'jpeg', 'jpg');
		// file extension
		$file_extension = pathinfo($_FILES['image1']['name'], PATHINFO_EXTENSION);
		$file_extension = strtolower($file_extension);
		if (in_array($file_extension, $valid_ext)) {
			$bytes = random_bytes(20);
			$image_location = '../../imagecordinatorwork/' . bin2hex($bytes) . ".$file_extension";
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
			$image_location = '../../imagecordinatorwork/' . bin2hex($bytes) . ".$file_extension";
			move_uploaded_file($tmp_name, $image_location);
			$ubah2 = str_replace("../", "", $image_location);
		}
	}


	if (isset($ubah1) && isset($ubah2)) {
		$result = $db->insert('tb_process_work_cordinator', 'id_report="' . $id_report . '", id_estate_cordinator="' . $id_estate_cordinator . '",photo_work_1="' . $ubah1 . '",photo_work_2="' . $ubah2 . '"');
		$status = 'process';
		$r = $db->update('tb_report', 'status="' . $status . '"', 'id_report="' . $id_report . '"');
		echo json_encode('OKE', JSON_PRETTY_PRINT);
	} else if (isset($ubah1)) {
		$result = $db->insert('tb_process_work_cordinator', 'id_report="' . $id_report . '", id_estate_cordinator="' . $id_estate_cordinator . '",photo_work_1="' . $ubah1 . '"');
		$status = 'Diproses';

		$r = $db->update('tb_report', 'status="' . $status . '"', 'id_report="' . $id_report . '"');
		echo json_encode('OKE', JSON_PRETTY_PRINT);
	} else if (isset($ubah2)) {
		$result = $db->insert('tb_process_work_cordinator', 'id_report="' . $id_report . '", id_estate_cordinator="' . $id_estate_cordinator . '",photo_work_2="' . $ubah2 . '"');
		$status = 'process';
		$r = $db->update('tb_report', 'status="' . $status . '"', 'id_report="' . $id_report . '"');
		echo json_encode('OKE', JSON_PRETTY_PRINT);
	}
	$rs = $db->insert('tb_process_report', 'id_report="' . $id_report . '", id_estate_cordinator="' . $id_estate_cordinator . '",status_process="' . $_POST['message'] . '"');

	// ambil id user berdasarkan id report
	$id_user = $db->select('tb_report', 'id_report="' . $id_report . '"', 'id_report', 'DESC');
	$id_user = mysqli_fetch_assoc($id_user);
	$category = $id_user['category'];
	$body = 'Laporan anda "' . $id_user['category'] . '" sedang dikerjakan';
	$id_user = $id_user['id_user'];

	$content_notif = 'Laporanmu tentang ' . $category . ' sedang dikerjakan';
	$title_notif = 'Cordinator menanggapi laporanmu';

	$result_add_notif = AddNotification::saveNotif($id_user, $id_estate_cordinator, 'REPORT PROCESS', $content_notif, $title_notif);

	if ($result_add_notif) {
		// kirim notif keuser bahwa laporan sudah selesai dikerjakan
		$toket = $db->select('tb_user_fcm_token', 'id_user="' . $id_user . '"', 'id_fcm', 'DESC');
		$toket = mysqli_fetch_assoc($toket)['token'];
		$title = 'Laporan dikerjakan';

		$data = CheckNotification::activeNotif($id_user);


		if ($data['report_done'] == '1' || $data['report_completed'] == '1') {
			// kirim notif ke user
			FirebaseMessaging::sendNotif($toket, $title, $body);
		}
	} else {
		echo json_encode('FAILL ADD NOTIF');
	}
}
