<?php
require_once('../../../file/function_proses.php');
require_once('../../send-notif/firebase_messaging.php');
require_once('../../settings_notification/check_notification.php');
require_once('../../settings_notification/add_notification.php');
require_once('../../utils/Uuid.php');

$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_user']) && !empty($obj['id_status'])) {
	// data user
	$id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
	$id_status = mysqli_real_escape_string($db->query, $obj['id_status']);

	$result = $db->insert('tb_like_status', 'id_status="' . $id_status . '",id_user="' . $id_user . '"');
	$data_status = $db->select('tb_status', 'id_status="' . $id_status . '"', 'id_status', 'ASC');

	if ($result) {
		if (mysqli_num_rows($data_status) > 0) {
			$data_status = mysqli_fetch_assoc($data_status);

			$id_user_comment = $data_status['id_user'];

			$user = $db->select('tb_user', 'id_user = "' . $id_user . '"', 'id_user', 'ASC');
			$user = mysqli_fetch_assoc($user);

			$user = $user['name'];

			// user fcm token
			$data = $db->select('tb_user_fcm_token', 'id_user = "' . $id_user_comment . '"', 'id_fcm', 'ASC');

			if (mysqli_num_rows($data) > 0) {
				$data = mysqli_fetch_assoc($data);
				$token = $data['token'];

				$title = $user . ' Menyukai Postinganmu';

				$result_add_notif = AddNotification::saveNotif($id_user_comment, $id_user, 'LIKE STATUS', $title, $title);

				if ($result_add_notif) {
					$title = 'Status suka baru';
					$body = $user . ' Menyukai status anda';
					$check = CheckNotification::activeNotif($id_user_comment);
					if ($check['like_status'] == '1') {
						FirebaseMessaging::sendNotif($token, $title, $body);
					}
					echo json_encode('success');
				} else {
					echo json_encode('FAIL ADD NOTIF');
				}
			} else {
				echo json_encode('FAILL TOKEN');
			}
		} else {
			echo json_encode('STATUS NOT FOUND');
		}
	} else {
		echo json_encode('FAILL ADD LIKE');
	}
}
