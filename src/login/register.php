<?php

use PHPMailer\PHPMailer\PHPMailer;

require_once("../../file/function_proses.php");
require_once("../../PHPMailer/src/PHPMailer.php");
require_once("../../PHPMailer/src/Exception.php");
require_once("../../PHPMailer/src/SMTP.php");
require_once("../utils/Uuid.php");

$db = new db();

if (!empty($_POST['no_ipl']) && !empty($_POST['email']) && !empty($_POST['no_telp'])) {
	$no_ipl =  mysqli_real_escape_string($db->query, ($_POST['no_ipl']));
	$no_ipl = strtoupper($no_ipl);
	$no_ipl_check =  mysqli_real_escape_string($db->query, ($_POST['no_ipl']));
	$no_telp =  mysqli_real_escape_string($db->query, ($_POST['no_telp']));
	$no_ipl_check = strtoupper($no_ipl_check);
	$email = mysqli_real_escape_string($db->query, ($_POST['email']));
	$checkExistIpl = mysqli_num_rows($db->select('tb_user', 'username="' . $no_ipl . '"', 'id_user', 'ASC'));
	$checkExistEmail = mysqli_num_rows($db->select('tb_user', 'email="' . $email . '"', 'id_user', 'ASC'));
	$checkExistPhoneNumber = mysqli_num_rows($db->select('tb_user', 'no_telp="' . $_POST['no_telp'] . '"', 'id_user', 'ASC'));

	$unique_id_rt = '';

	// check ipl on base table
	if ($checkExistIpl > 0) {
		echo json_encode('ipl exist');
	} else if ($checkExistEmail > 0) {
		echo json_encode('email exist');
	} else if ($checkExistPhoneNumber > 0) {
		echo json_encode('phone number exist');
	} else {
		// tarik data ipl dari db pengelola
		$data_balik = array();
		if (!empty($no_ipl)) {
			$pecah = explode('/', $no_ipl);
			if ($pecah['1'] == 'RW') {
				$data_lengkap = $pecah[0] . '/' . 'BAST' . '/' . $pecah[2] . '/' . $pecah[3];
				$result = $db->select_rw('tb_population', 'code_population="' . $data_lengkap . '"', 'id_population', 'ASC');
				while ($data =  mysqli_fetch_assoc($result)) {
					$data_balik['code_population'] = $data['code_population'];
					$data_balik['nama'] = $data['name'];
					$data_balik['id_cluster'] = $data['id_cluster'];
					$data_balik['id_rt'] = $data['id_rt'];
					$data_balik['house_number'] = $data['house_number'];
				}

				if (!empty($data_balik)) {
					// generate uuid untuk id user

					$unique_id = UUID::guidv4();
					$unique_id_warga = UUID::guidv4();

					// insert ke tb_warga
					$rs_warga = $db->insert('tb_warga', 'id_warga="' . $unique_id_warga . '", name="' . $data_balik['nama'] . '", number_bast="' . $data_balik['code_population'] . '"');
					if ($rs_warga) {

						// insert rt 
						$data_rt = $db->select_rw('tb_rt', 'id_rt="' . $data_balik['id_rt'] . '"', 'id_rt', 'ASC');
						if (mysqli_num_rows($data_rt) > 0) {
							$unique_id_rt = UUID::guidv4();
							$data_rt = mysqli_fetch_assoc($data_rt);
							$code_rt = $data_rt['code_rt'];
							$result = $db->insert('tb_rt', 'id_rt="' . $unique_id_rt . '", code_rt="' . $code_rt . '"');
							if (!$result) {
								echo json_encode('gagal update rt');
							}
						}

						$clusterIsExist = false;

						// insert cluster 
						$data_cluster = $db->select_rw('tb_cluster', 'id_cluster="' . $data_balik['id_cluster'] . '"', 'id_cluster', 'ASC');
						if (mysqli_num_rows($data_cluster) > 0) {
							$unique_id_cluster = UUID::guidv4();
							$cluster = mysqli_fetch_assoc($data_cluster);
							$cek_cluster = $db->select('tb_cluster', 'code_cluster = "' . $cluster['code_cluster'] . '"', 'id_cluster', 'ASC');


							if (mysqli_num_rows($cek_cluster) > 0) {
								$id_cluster_exist = mysqli_fetch_assoc($cek_cluster)['id_cluster'];
								$clusterIsExist = !$clusterIsExist;
							} else {
								$result = $db->insert('tb_cluster', 'id_cluster="' . $unique_id_cluster . '", code_cluster="' . $cluster['code_cluster'] . '", cluster="' . $cluster['cluster'] . '"');
								if (!$result) {
									echo json_encode('gagal update cluster');
								}
							}
						}

						// insert ke tb population
						$unique_id_population = UUID::guidv4();
						if ($clusterIsExist) {
							$rs_query = $db->insert('tb_population', 'id_population="' . $unique_id_population . '", id_warga = "' . $unique_id_warga . '", id_cluster="' . $id_cluster_exist . '", id_rt="' . $unique_id_rt . '", house_number="' . $data_balik['house_number'] . '"');
						} else {
							$rs_query = $db->insert('tb_population', 'id_population="' . $unique_id_population . '", id_warga = "' . $unique_id_warga . '", id_cluster="' . $unique_id_cluster . '", id_rt="' . $unique_id_rt . '", house_number="' . $data_balik['house_number'] . '"');
						}

						if ($rs_query) {
							$result_auth = $db->select('tb_authorization', 'status = "warga"', 'id_auth', 'ASC');
							if (mysqli_num_rows($result_auth) > 0) {
								$result_auth = mysqli_fetch_assoc($result_auth);

								$rs = $db->insert('tb_user', 'email="' . $email . '", id_user="' . $unique_id_warga . '", no_telp="' . $no_telp . '", username = "' . $no_ipl . '", name = "' . $data_balik['nama'] . '", profile_image="imageuser/default_profile/blank_profile_picture.jpg", id_auth = "' . $result_auth['id_auth'] . '", password = ""');


								if ($rs) {
									echo json_encode('success');
								} else {
									echo json_encode('failed');
								}
							}
						}
					}
				} else {
					echo json_encode("no_ipl tidak ada");
				}
			} else {
				echo json_encode("no_ipl tidak ada");
			}
		}
	}
}
