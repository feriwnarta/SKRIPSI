<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if (!empty($obj['otp']) && !empty($obj['iplOrEmail'])) {
	$otp = mysqli_real_escape_string($db->query, $obj['otp']);
	$iplOrEmail = mysqli_real_escape_string($db->query, $obj['iplOrEmail']);


	$exist = $db->select('tb_user', 'username=("' . $iplOrEmail . '" OR email = "' . $iplOrEmail . '") AND otp="' . $otp . '"', 'id_user', 'ASC');
	$data_user = mysqli_fetch_assoc($exist);
	$id_auth = $data_user['id_auth'];

	$data_auth = $db->select('tb_authorization', 'id_auth = "' . $id_auth . '"', 'id_auth', 'ASC');
	$data_auth = mysqli_fetch_assoc($data_auth);

	if ($data_auth['status'] == 'WARGA') {
		$ipl_real_formatted = explode("/", $iplOrEmail);

		if (count($ipl_real_formatted) > 3) {
			$ipl_real_formatted = $ipl_real_formatted[0] . "/BAST/" . $ipl_real_formatted[2] . '/' . $ipl_real_formatted[3];
		} else {
			$ipl_real_formatted = $ipl_real_formatted[0] . "/RW/" . $ipl_real_formatted[2];
		}
	} else {
		$ipl_real_formatted = '-';
	}




	if (mysqli_num_rows($exist) > 0) {
		$rs = $db->update('tb_user', 'otp="0"', 'username="' . $iplOrEmail . '" OR email="' . $iplOrEmail . '"');
		if ($rs) {
			echo json_encode(array(
				"status" => "OKE",
				"no_ipl" => $ipl_real_formatted
			));
		} else {
			echo json_encode(array(
				"status" => "FAILL",
				"no_ipl" => $ipl_real_formatted
			));
		}
	} else {
		echo json_encode(array(
			"status" => "FAILL",
			"no_ipl" => $ipl_real_formatted
		));
	}
}
