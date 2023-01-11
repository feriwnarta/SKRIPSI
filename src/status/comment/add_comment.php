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
	$id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
	$id_status = mysqli_real_escape_string($db->query, $obj['id_status']);
	$comment = mysqli_real_escape_string($db->query, $obj['comment']);
	if (!empty($comment)) {
		$rs = $db->insert('tb_comment', 'id_status="' . $id_status . '",id_user="' . $id_user . '",comment="' . $comment . '"');

		$data_comment = $db->select('tb_comment', 'comment = "' . $comment . '"', 'id_comment', 'ASC');
		$data_comment = mysqli_fetch_assoc($data_comment);

		$data_status = $db->select('tb_status', 'id_status = "' . $id_status . '"', 'id_status', 'ASC');
		$data_status = mysqli_fetch_assoc($data_status);

		$user_comment = $db->select('tb_user', 'id_user = "' . $id_user . '"', 'id_user', 'ASC');
		$user_comment = mysqli_fetch_assoc($user_comment);

		$user_comment = $user_comment['name'];

		$user = $data_status['id_user'];

		$token = $db->select('tb_user_fcm_token', 'id_user = "' . $user . '"', 'id_fcm', 'ASC');
		$token = mysqli_fetch_assoc($token);

		$token = $token['token'];

		$title = 'Komentar baru';
		$body = $user_comment . ' Mengomentari postingan anda';


		// save notif

		$result_add_notif = AddNotification::saveNotif(
			$user,
			$data_comment['id_comment'],
			'COMMENT',
			$comment,
			$user_comment . ' Menanggapi Postinganmu'
		);

		if ($result_add_notif) {
			$data = CheckNotification::activeNotif($user);

			if ($data['commentar'] == '1') {
				FirebaseMessaging::sendNotif($token, $title, $body);
			}

			$c = $db->count('tb_comment', 'id_status="' . $id_status . '"', 'id_status');
			$comment_count = mysqli_fetch_assoc($c)['count'];
			$update = $db->update('tb_status', 'comment="' . $comment_count . '"', 'id_status="' . $id_status . '"');



			echo json_encode("succes");
		} else {
			
			echo json_encode("failed add notif");
		}
	}
}
