<?php
require_once("../../../file/function_proses.php");
require_once("../../../file/function_proses.php");
require_once("../../utils/Uuid.php");
$db = new db();


if (!empty($_POST['name_estate_cordinator']) && !empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['cordinator_job']) && isset($_POST['email']) && isset($_POST['no_telp'])) {
	$unique_id = UUID::guidv4();

	$name_estate_cordinator = mysqli_real_escape_string($db->query, $_POST['name_estate_cordinator']);
	$username = mysqli_real_escape_string($db->query, $_POST['username']);
	$password = mysqli_real_escape_string($db->query, $_POST['password']);
	$email = mysqli_real_escape_string($db->query, $_POST['email']);
	$no_telp = mysqli_real_escape_string($db->query, $_POST['no_telp']);
	$cordinator_job = mysqli_real_escape_string($db->query, $_POST['cordinator_job']);

	$ubah1 = str_replace("=", "", base64_encode($password));
	$pengacak = "Bl4ck3rH4ck3r3ncR1pt";
	$ubah2 = md5($pengacak . md5($ubah1) . $pengacak);
	$hasil_password = md5($pengacak . md5($ubah2) . $pengacak);

	if (isset($_FILES['foto_profile'])) {
		$tmp_name = $_FILES['foto_profile']['tmp_name'];
		$valid_ext = array('png', 'jpeg', 'jpg');
		// file extension
		$file_extension = pathinfo($_FILES['foto_profile']['name'], PATHINFO_EXTENSION);

		$file_extension = strtolower($file_extension);

		if (in_array($file_extension, $valid_ext)) {
			$bytes = random_bytes(20);
			// $loc = $_SERVER['SERVER_NAME'];
			$loc = '../../../imageuser/';
			$image_location = $loc . bin2hex($bytes) . ".$file_extension";
			move_uploaded_file($tmp_name, $image_location);
			$ubah = str_replace("../", "", $image_location);
		}
	} else {
		$ubah = 'imageuser/default_profile/blank_profile_picture.jpg';
	}


	$exist_user = $db->select('tb_user', 'username = "' . $username . '"', 'id_user', 'ASC');

	if (!mysqli_num_rows($exist_user) > 0) {

		if (!mysqli_num_rows($db->select('tb_user', 'email = "' . $email . '"', 'id_user', 'ASC')) > 0) {

			if (!mysqli_num_rows($db->select('tb_user', 'no_telp = "' . $no_telp . '"', 'id_user', 'ASC')) > 0) {



				$result = $db->insert('tb_estate_cordinator', 'id_estate_cordinator = "' . $unique_id . '", name_estate_cordinator = "' . $name_estate_cordinator . '", email = "' . $email . '", no_telp = "' . $no_telp . '"');

				$result_user = $db->insert('tb_user', 'id_user = "' . $unique_id . '", username = "' . $username . '", email = "' . $email . '", no_telp = "' . $no_telp . '", name="' . $name_estate_cordinator . '", password = "' . $hasil_password . '", profile_image = "' . $ubah . '"');

				if ($result_user) {
					// insert akses
					$data_auth = $db->select('tb_authorization', 'status = "cordinator"', 'id_auth', 'ASC');
					if (mysqli_num_rows($data_auth) > 0) {
						$data_auth = mysqli_fetch_assoc($data_auth);
						$update = $db->update('tb_user', 'id_auth = "' . $data_auth['id_auth'] . '"', 'id_user = "' . $unique_id . '"');


						// insert notification
						$unique_id_notification = UUID::guidv4();
						$result_notification =  $db->insert('tb_settings_notification', 'id_notification = "' . $unique_id_notification . '", id_user = "' . $unique_id . '"');


						if ($result && $update) {
							$unique_id_cordinator = UUID::guidv4();
							$result_job = $db->insert('tb_estate_cordinator_job', 'id_estate_cordinator_job = "' . $unique_id_cordinator . '", id_estate_cordinator="' . $unique_id . '",id_master_category="' . $cordinator_job . '"');
							if ($result_job) {
								echo json_encode('Register Successful');
							} else {
								echo json_encode('gagal menyimpan');
							}
						} else {
							echo json_encode('Register failed');
						}
					} else {
						echo json_encode('gagal mengambil id access');
					}
				} else {
					echo json_encode('gagal menyimpan');
				}
			} else {
				echo json_encode('no telpon sudah ada');
			}
		} else {
			echo json_encode('email sudah ada');
		}
	} else {
		echo json_encode('username sudah ada');
	}
}
