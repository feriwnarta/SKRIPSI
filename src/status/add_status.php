<?php
require_once('../../file/function_proses.php');
$db = new db();


if (!empty($_POST['id_user']) && !empty($_POST['username']) && !empty($_POST['foto_profile']) && isset($_POST['location'])) {

	// data user
	$id_user = mysqli_escape_string($db->query, $_POST['id_user']);
	$username = mysqli_escape_string($db->query, $_POST['username']);
	$foto_profile = mysqli_escape_string($db->query, $_POST['foto_profile']);
	$caption = mysqli_escape_string($db->query, $_POST['caption']);
	$location = mysqli_escape_string($db->query, $_POST['location']);

	// valid extension
	if (!empty($_FILES['status_image'])) {
		$tmp_name = $_FILES['status_image']['tmp_name'];
		$valid_ext = array('png', 'jpeg', 'jpg');
		// file extension
		$file_extension = pathinfo($_FILES['status_image']['name'], PATHINFO_EXTENSION);
		$file_extension = strtolower($file_extension);
		// Check extension
		if (in_array($file_extension, $valid_ext)) {

			$bytes = random_bytes(20);
			$image_location = '../../imagestatus/' . bin2hex($bytes) . ".$file_extension";
			move_uploaded_file($tmp_name, $image_location);
			$ubah = str_replace("../", "", $image_location);

			$result = $db->insert('tb_status', 'status_image="' . $ubah . '",id_user="' . $id_user . '",username="' . $username . '",foto_profile="' . $foto_profile . '",caption="' . $caption . '", location="' . $location . '"');
			if ($result) {
				echo json_encode("succes");
			}
		}
	} else {
		$status_image = mysqli_escape_string($db->query, $_POST['status_image']);
		$result = $db->insert('tb_status', 'status_image="' . $status_image . '",id_user="' . $id_user . '",username="' . $username . '",foto_profile="' . $foto_profile . '",caption="' . $caption . '", location="' . $location . '"');
		if ($result) {
			echo json_encode("succes");
		} else {
			echo json_encode("failed");
		}
	}
} 
