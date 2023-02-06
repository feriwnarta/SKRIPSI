<?php
require_once("../../../file/function_proses.php");
require_once("../../utils/Uuid.php");

$db = new db();



if (isset($_POST['name_danru']) && isset($_POST['username']) && isset($_POST['password']) && isset($_POST['id_estate_cordinator']) && isset($_POST['id_estate_manager']) && isset($_POST['danru_job']) && isset($_POST['email']) && isset($_POST['no_telp'])) {
    
	$unique_id = UUID::guidv4();
	$name_danru = mysqli_real_escape_string($db->query, $_POST['name_danru']);
	$username = mysqli_real_escape_string($db->query, $_POST['username']);
	$password = mysqli_real_escape_string($db->query, $_POST['password']);
	$no_telp = mysqli_real_escape_string($db->query, $_POST['no_telp']);
    $id_estate_manager = mysqli_real_escape_string($db->query, $_POST['id_estate_manager']);
	$id_cordinator = mysqli_real_escape_string($db->query, $_POST['id_estate_cordinator']);
	$email = mysqli_real_escape_string($db->query, $_POST['email']);
	$danru_job = explode(',', mysqli_real_escape_string($db->query, $_POST['danru_job']));


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


			$result = $db->insert('tb_danru', 'id_danru = "' . $unique_id . '", name_danru = "' . $name_danru . '", email = "' . $email . '", no_telp = "' . $no_telp . '", id_estate_cordinator = "' . $id_cordinator . '", id_estate_manager = "' . $id_estate_manager . '"');


			$result_user = $db->insert('tb_user', 'id_user = "' . $unique_id . '", username = "' . $username . '", email = "' . $email . '", no_telp = "' . $no_telp . '", name="' . $name_danru . '", password = "' . $hasil_password . '", profile_image = "' . $ubah . '"');


			if ($result_user) {
				// insert akses
				$data_auth = $db->select('tb_authorization', 'status = "DANRU"', 'id_auth', 'ASC');
				if (mysqli_num_rows($data_auth) > 0) {
					$data_auth = mysqli_fetch_assoc($data_auth);
					$update = $db->update('tb_user', 'id_auth = "' . $data_auth['id_auth'] . '"', 'id_user = "' . $unique_id . '"');

					if ($update) {
						$result_job = false;

						// insert notification
						$unique_id_notification = UUID::guidv4();
						$result_notification =  $db->insert('tb_settings_notification', 'id_notification = "' . $unique_id_notification . '", id_user = "' . $unique_id . '"');


						foreach ($danru_job as $value) {
							$data_category = $db->select('tb_category', 'category ="' . $value . '"', 'id_category', 'ASC');

							$data_return = mysqli_fetch_assoc($data_category);
							$unique_id_job = UUID::guidv4();
							$result_job = $db->insert('tb_danru_job', 'id_danru_job = "' . $unique_id_job . '", id_danru="' . $unique_id . '",id_category="' . $data_return['id_category'] . '"');
						}


						if ($result_job) {
							echo json_encode('register successfull');
						} else {
							echo json_encode('register failed');
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
			echo json_encode('email sudah ada');
		}
	} else {
		echo json_encode('username sudah ada');
	}
}