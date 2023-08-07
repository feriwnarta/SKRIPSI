<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_user']) && isset($obj['status_user'])) {
	$id_user = mysqli_real_escape_string($db->query, ($obj['id_user']));
	$status_user = mysqli_real_escape_string($db->query, ($obj['status_user']));

	$cek = $db->select('tb_user', 'id_user="' . $id_user . '"', 'id_user', 'ASC');
	$jum = mysqli_num_rows($cek);

	if ($jum > 0) {
		$data_user = [];
		$data = mysqli_fetch_assoc($cek);

		$data_id_user = $data['id_user'];
		$data_warga = $db->select('tb_population', 'id_warga = "' . $id_user . '"', 'id_population', 'ASC');

		if (mysqli_num_rows($data_warga) > 0) {
			$data_warga = mysqli_fetch_assoc($data_warga);
			$nomor_rumah = $data_warga['house_number'];

			$id_cluster = $data_warga['id_cluster'];
			$id_rt = $data_warga['id_rt'];
		} else {
			$nomor_rumah = '';
			$id_cluster = '';
			$id_rt = '';
		}




		$data_cluster = $db->select('tb_cluster', 'id_cluster = "' . $id_cluster . '"', 'id_cluster', 'ASC');
		if (mysqli_num_rows($data_cluster) > 0) {
			$data_cluster = mysqli_fetch_assoc($data_cluster);
			$cluster = $data_cluster['cluster'];
		} else {
			$cluster = '';
		}

		// 		$data_rt = $db->select('tb_rt', 'id_rt = "' . $id_rt . '"', 'id_rt', 'ASC');


		// 		$rt = $data_rt[''];


		foreach ($data as $key => $value) {
			if ($key != 'password') {
				$data_user[$key] = $value;
			}
		}
		$data_user['house_number'] = $nomor_rumah;
		$data_user['cluster'] = $cluster;
		$data_user['status_user'] = $status_user;
		$data_user['rw'] = '05';
		echo json_encode($data_user);
	}
}
