<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['id_report']) && !empty($obj['id_estate_cordinator'])) {
	$id_estate_cordinator =  mysqli_real_escape_string($db->query, ($obj['id_estate_cordinator']));
	$id_report = mysqli_real_escape_string($db->query, ($obj['id_report']));
	// $result = $db->select('tb_process_report', 'id_report="' . $id_report . '" && id_estate_cordinator="' . $id_estate_cordinator . '"', 'id_process_report', 'ASC');
	$result = $db->select('tb_report', 'id_report = "' . $id_report . '" AND status = "Diproses" OR status = "Diterima"', 'id_report', "DESC");

	$data_user = mysqli_fetch_assoc($result);


	if (mysqli_num_rows($result) > 0) {

		// $data_proses = $db->select('tb_process_report', 'id_report = "' . $id_report . '"', 'id_report', 'DESC');

		$data_proses = $db->select('tb_report', 'id_report = "' . $id_report . '" AND status = "Diproses"',' id_report', 'DESC');


		if (mysqli_num_rows($data_proses) > 0) {
			echo json_encode(
				array(
					'status' => 'BEEN PROCESSED',
					'data' => $data_user,
				)
			);
		} else {
			echo json_encode(array(
				'status' => 'EXIST',
				'data' => [],
			));
		}
	} else {
		echo json_encode(
			array(
				'status' => 'NOT EXIST',
				'data' => [],
			)
		);
	}
}
