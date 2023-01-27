<?php
require_once("../../file/function_proses.php");
require_once("../utils/Uuid.php");
$db = new db();
date_default_timezone_set('asia/jakarta');

$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['usernameOrIpl']) && !empty($obj['password']) && !empty($obj['token'])) {
	$usernameOrIpl = $obj['usernameOrIpl'];
	$ubah1 = str_replace("=", "", base64_encode($obj['password']));
	$token = mysqli_real_escape_string($db->query, $obj['token']);
	$device_name = mysqli_real_escape_string($db->query, $obj['device_name']);
	$device_identifier = mysqli_real_escape_string($db->query, $obj['device_identifier']);
	$pengacak = "Bl4ck3rH4ck3r3ncR1pt";
	$ubah2 = md5($pengacak . md5($ubah1) . $pengacak);
	$hasil_password = md5($pengacak . md5($ubah2) . $pengacak);


	$cek = $db->select('tb_user', 'email="' . $usernameOrIpl . '" && password="' . $hasil_password . '" || username ="' . $usernameOrIpl . '" && password="' . $hasil_password . '"', 'id_user', 'ASC');

	$jum = mysqli_num_rows($cek);

	$active_user = false;

	if ($jum > 0) {
		$u = mysqli_fetch_assoc($cek);


		$id_auth = $u['id_auth'];

		$cek_auth = $db->select('tb_authorization', 'id_auth = "' . $id_auth . '"', 'id_auth', 'ASC');

		if (mysqli_num_rows($cek_auth) > 0) {

			$cek_auth = mysqli_fetch_assoc($cek_auth);
			$status_auth = $cek_auth['status'];


			// cek device yang login 
			$cek_login = $db->select('tb_user_login_auth', 'id_user="' . $u['id_user'] . '"', 'id_login_auth', 'DESC');
			if (mysqli_num_rows($cek_login) > 0) {
				// cek apakah login di hp yang sama
				$cek_login = mysqli_fetch_assoc($cek_login);
				if ($cek_login['device_name'] == $device_name && $cek_login['device_identifier'] == $device_identifier) {
					$active_user = false;
				} else {
					// update auth login yang lama dengan login baru
					$update_auth = $db->update('tb_user_login_auth', 'device_name="' . $device_name . '", device_identifier="' . $device_identifier . '"', 'id_user="' . $u['id_user'] . '"');
					if (!$update_auth) {
						echo json_encode('login_failed');
						die();
					}
					$active_user = true;
				}
			} else {
				$insert_auth = $db->insert('tb_user_login_auth', 'id_user="' . $u['id_user'] . '", device_name="' . $device_name . '", device_identifier="' . $device_identifier . '"');
				if (!$insert_auth) {
					echo json_encode('login_failed');
					die();
				}
				$active_user = false;
			}


			// save user token to tb token
			// cek token terlebih dahulu ada atau 
			$date = date('Y-m-d H:i:s');
			$cek = $db->select('tb_user_fcm_token', 'id_user="' . $u['id_user'] . '"', 'id_fcm', 'ASC');
			if (mysqli_num_rows($cek) > 0) {
				$update_token = $db->update('tb_user_fcm_token', 'token="' . $token . '", update_at="' . $date . '"', 'id_user="' . $u['id_user'] . '"');
			} else {
				$unique_id_fcm = UUID::guidv4();
				$result = $db->insert('tb_user_fcm_token', 'id_fcm = "' . $unique_id_fcm . '", id_user = "' . $u['id_user'] . '", token = "' . $token . '"');
			}

			// dapatkan cluster dan rt
			$data_population = $db->select('tb_population', 'id_warga="' . $u['id_user'] . '"', 'id_population', 'ASC');
			$data_population = mysqli_fetch_assoc($data_population);
			$house_number = $data_population['house_number'];
			$id_cluster = $data_population['id_cluster'];

			$data_cluster = $db->select('tb_cluster', 'id_cluster = "' . $id_cluster . '"', 'id_cluster', 'ASC');
			$data_cluster = mysqli_fetch_assoc($data_cluster);

			$data_user = [
				"status" => $status_auth,
				"id_user" => $u['id_user'],
				"profile_image" => $u['profile_image'],
				"active_user" => $active_user,
				"email" => $u['email'],
				"no_telp" => $u['no_telp'],
				"cluster" => $data_cluster['cluster'],
				"house_number" => $house_number
			];
			echo json_encode($data_user, JSON_PRETTY_PRINT);

			// else if ($status_auth == 'CORDINATOR') {
			// 	$unique_id = UUID::guidv4();
			// 	$username = $obj['usernameOrIpl'];
			// 	$password = $obj['password'];
			// 	$token = $obj['token'];
			// 	$ubah1 = str_replace("=", "", base64_encode($obj['password']));
			// 	$pengacak = "Bl4ck3rH4ck3r3ncR1pt";
			// 	$ubah2 = md5($pengacak . md5($ubah1) . $pengacak);
			// 	$hasil_password = md5($pengacak . md5($ubah2) . $pengacak);

			// 	$cek = $db->select('tb_user', 'username="' . $username . '" && password="' . $hasil_password . '"', 'id_user', 'ASC');

			// 	$jum = mysqli_num_rows($cek);
			// 	if ($jum > 0) {
			// 		$u = mysqli_fetch_assoc($cek);

			// 		$date = date('Y-m-d H:i:s');

			// 		$cek_token = $db->select('tb_cordinator_fcm_token', 'id_estate_cordinator = "' . $u['id_user'] . '"', 'id_token', 'ASC');

			// 		if (mysqli_num_rows($cek_token) > 0) {
			// 			// update fcm token
			// 			$update_token = $db->update('tb_cordinator_fcm_token', 'token="' . $token . '", update_at="' . $date . '"', 'id_estate_cordinator="' . $u['id_user'] . '"');
			// 		} else {
			// 			$result = $db->insert('tb_cordinator_fcm_token', 'id_token = "' . $unique_id . '", id_estate_cordinator = "' . $u['id_user'] . '", token = "' . $token . '"');

			// 			if (!$result) {
			// 				echo json_encode('gagal update token cordinator');
			// 				die();
			// 			}
			// 		}



			// 		$job_cordinator = $db->select('tb_estate_cordinator_job', 'id_estate_cordinator="' . $u['id_user'] . '"', 'id_estate_cordinator', 'ASC');
			// 		$id_cordinator = mysqli_fetch_assoc($job_cordinator);
			// 		$job_data = $db->select('tb_master_category', 'id_master_category="' . $id_cordinator['id_master_category'] . '"', 'id_master_category', 'ASC');
			// 		$id_master_category = mysqli_fetch_assoc($job_data);
			// 		$id_category = $db->select('tb_category', 'id_master_category="' . $id_master_category['id_master_category'] . '"', 'id_category', 'ASC');
			// 		$job = array();
			// 		while ($rs = mysqli_fetch_assoc($id_category)) {
			// 			$job[] = $rs['id_category'];
			// 		}
			// 		$data_user = [
			// 			"status" => $status_auth,
			// 			"id_user" => $u['id_user'],
			// 			"name_estate_cordinator" => $u['name'],
			// 			"profile_image" => $u['profile_image'],
			// 			"job" => $job,
			// 			"update_token" => $update_token,
			// 			"email" => $u['email'],
			// 			"no_telp" => $u['no_telp'],
			// 			"cluster" => '-',
			// 			"house_number" => '-'
			// 		];
			// 		echo json_encode($data_user, JSON_PRETTY_PRINT);
			// 	} else {
			// 		echo json_encode("login_cordinator_failed");
			// 	}
			// } else if ($status_auth == 'ESTATEMANAGER') {
			// 	$unique_id = UUID::guidv4();
			// 	$username = $obj['usernameOrIpl'];
			// 	$password = $obj['password'];
			// 	$token = $obj['token'];
			// 	$ubah1 = str_replace("=", "", base64_encode($obj['password']));
			// 	$pengacak = "Bl4ck3rH4ck3r3ncR1pt";
			// 	$ubah2 = md5($pengacak . md5($ubah1) . $pengacak);
			// 	$hasil_password = md5($pengacak . md5($ubah2) . $pengacak);

			// 	$cek = $db->select('tb_user', 'username="' . $username . '" && password="' . $hasil_password . '"', 'id_user', 'ASC');

			// 	$jum = mysqli_num_rows($cek);

			// 	if ($jum > 0) {
			// 		$u = mysqli_fetch_assoc($cek);

			// 		$cek_login = $db->select('tb_user_login_auth', 'id_user="' . $u['id_user'] . '"', 'id_login_auth', 'DESC');

			// 		if (mysqli_num_rows($cek_login) > 0) {
			// 			// cek apakah login di hp yang sama
			// 			$cek_login = mysqli_fetch_assoc($cek_login);
			// 			if ($cek_login['device_name'] == $device_name && $cek_login['device_identifier'] == $device_identifier) {
			// 				$active_user = false;
			// 			} else {
			// 				// update auth login yang lama dengan login baru
			// 				$update_auth = $db->update('tb_user_login_auth', 'device_name="' . $device_name . '", device_identifier="' . $device_identifier . '"', 'id_user="' . $u['id_user'] . '"');
			// 				if (!$update_auth) {
			// 					echo json_encode('login_failed');
			// 					die();
			// 				}
			// 				$active_user = true;
			// 			}
			// 		} else {
			// 			$insert_auth = $db->insert('tb_user_login_auth', 'id_user="' . $u['id_user'] . '", device_name="' . $device_name . '", device_identifier="' . $device_identifier . '"');
			// 			if (!$insert_auth) {
			// 				echo json_encode('login_failed');
			// 				die();
			// 			}
			// 			$active_user = false;
			// 		}



			// 		$date = date('Y-m-d H:i:s');

			// 		$cek_token = $db->select('tb_cordinator_fcm_token', 'id_estate_cordinator = "' . $u['id_user'] . '"', 'id_token', 'ASC');

			// 		if (mysqli_num_rows($cek_token) > 0) {
			// 			// update fcm token
			// 			$update_token = $db->update('tb_cordinator_fcm_token', 'token="' . $token . '", update_at="' . $date . '"', 'id_estate_cordinator="' . $u['id_user'] . '"');
			// 		} else {
			// 			$result = $db->insert('tb_cordinator_fcm_token', 'id_token = "' . $unique_id . '", id_estate_cordinator = "' . $u['id_user'] . '", token = "' . $token . '"');

			// 			if (!$result) {
			// 				echo json_encode('gagal update token cordinator');
			// 				die();
			// 			}
			// 		}



			// 		$job_cordinator = $db->select('tb_estate_cordinator_job', 'id_estate_cordinator="' . $u['id_user'] . '"', 'id_estate_cordinator', 'ASC');
			// 		$id_cordinator = mysqli_fetch_assoc($job_cordinator);
			// 		$job_data = $db->select('tb_master_category', 'id_master_category="' . $id_cordinator['id_master_category'] . '"', 'id_master_category', 'ASC');
			// 		$id_master_category = mysqli_fetch_assoc($job_data);
			// 		$id_category = $db->select('tb_category', 'id_master_category="' . $id_master_category['id_master_category'] . '"', 'id_category', 'ASC');
			// 		$job = array();
			// 		while ($rs = mysqli_fetch_assoc($id_category)) {
			// 			$job[] = $rs['id_category'];
			// 		}
			// 		$data_user = [
			// 			"status" => $status_auth,
			// 			"id_user" => $u['id_user'],
			// 			"name_estate_cordinator" => $u['name'],
			// 			"profile_image" => $u['profile_image'],
			// 			"job" => $job,
			// 			"active_user" => $active_user,
			// 			"update_token" => $update_token,
			// 			"email" => $u['email'],
			// 			"no_telp" => $u['no_telp'],
			// 			"cluster" => '-',
			// 			"house_number" => '-'
			// 		];
			// 		echo json_encode($data_user, JSON_PRETTY_PRINT);
			// 	} else {
			// 		echo json_encode("login_estate_manager_failed");
			// 	}
			// }
		} else {
			echo json_encode('auth not exist');
		}
	} else {
		echo json_encode('login failed');
	}
}
