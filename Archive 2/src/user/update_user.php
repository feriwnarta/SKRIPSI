<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_user'])) {
	$id_user = mysqli_real_escape_string($db->query, ($obj['id_user']));
	$kolom = mysqli_real_escape_string($db->query, ($obj['kolom']));
	$data = mysqli_real_escape_string($db->query, ($obj['data']));
	if ($kolom == 'username') {
		$db->update('tb_user', 'name="' . $data . '"', 'id_user="' . $id_user . '"');
		echo json_encode("OK");
	} else if ($kolom == 'email') {
		$result = $db->select('tb_user', 'email="' . $data . '"', 'id_user', 'DESC');
		if (!mysqli_num_rows($result) > 0) {
			$db->update('tb_user', 'email="' . $data . '"', 'id_user="' . $id_user . '"');
			echo json_encode("OK");
		} else {
			echo json_encode("email sudah digunakan");
		}
	}
	// else if ($kolom == 'fullname') {
	// 	$db->update('tb_user', 'name="' . $data . '"', 'id_user="' . $id_user . '"');
	// 	echo json_encode("OK");
	// } 
	else if ($kolom == 'phone') {
		$result = $db->select('tb_user', 'no_telp="' . $data . '"', 'id_user', 'DESC');
		if (!mysqli_num_rows($result) > 0) {
			$db->update('tb_user', 'no_telp="' . $data . '"', 'id_user="' . $id_user . '"');
			echo json_encode("OK");
		} else {
			echo json_encode("no telp sudah digunakan");
		}
	} else if ($kolom == 'number_house') {
		if ($db->update('tb_population', 'house_number = "' . $data . '"', 'id_warga = "' . $id_user . '"')) {
			echo json_encode("OK");
		} else {
			echo json_encode("no telp sudah digunakan");
		}
	} else if ($kolom == 'cluster') {
		// $result = $db->select('tb_population', 'id_warga="' . $data . '"', 'id_warga', 'DESC');
		// $result = mysqli_fetch_assoc($result);
		// $id_cluster = $result['id_cluster'];
	} else {
		echo json_encode("FAILL");
	}
}

if (!empty($_FILES['image']) && !empty($_POST['id_user'])) {
	$image = $_FILES['image']['name'];
	$tmp_name = $_FILES['image']['tmp_name'];
	$valid_ext = array('png', 'jpeg', 'jpg');
	$file_extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
	$file_extension = strtolower($file_extension);
	$id_user = mysqli_real_escape_string($db->query, $_POST['id_user']);
	if (in_array($file_extension, $valid_ext)) {
		$bytes = random_bytes(20);
		$image_location = '../../imageuser/' . bin2hex($bytes) . ".$file_extension";
		move_uploaded_file($tmp_name, $image_location);
		$ubah = str_replace("../", "", $image_location);
		$db->update('tb_user', 'profile_image="' . $ubah . '"', 'id_user="' . $id_user . '"');
		echo json_encode($ubah);
	}
}
