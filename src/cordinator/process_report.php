<?php 
require_once("../../file/function_proses.php");
require_once("../send-notif/firebase_messaging.php");
require_once("../settings_notification/check_notification.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_estate_cordinator']) && !empty($obj['id_report']) && !empty($obj['message'])) {
	$id_estate_cordinator = mysqli_real_escape_string($db->query,$obj['id_estate_cordinator']);
	$id_report = mysqli_real_escape_string($db->query,$obj['id_report']);
	$message = mysqli_real_escape_string($db->query,$obj['message']);
	
	$result = $db->insert('tb_process_report', 'id_report="'.$id_report.'", id_estate_cordinator="'.$id_estate_cordinator.'",status_process="'.$message.'"');

	if($result) {
		echo json_encode('OK');
		$status = 'noticed';
		$dt = $db->update('tb_report', 'status="'.$status.'"', 'id_report="'.$id_report.'"');
		
		// ambil id user berdasarkan id report
	    $id_user = $db->select('tb_report', 'id_report="'.$id_report.'"', 'id_report', 'DESC');
	    $id_user = mysqli_fetch_assoc($id_user);
	    $body = 'Laporan anda "' . $id_user['description'] .'" telah diterima';
	    $id_user = $id_user['id_user'];
	    
	    // kirim notif keuser bahwa laporan diterima
	    $toket = $db->select('tb_user_fcm_token', 'id_user="'.$id_user.'"', 'id_fcm', 'DESC');
	    $toket = mysqli_fetch_assoc($toket)['token'];
	    $title = 'Laporan diterima';

	    // kirim notif ke user

		$data = CheckNotification::activeNotif($id_user);

		if($data['report_received'] == '1') {
			FirebaseMessaging::sendNotif($toket, $title, $body);
			
		}
	    
	} else {
		echo json_encode('FAILL');
	}
}
