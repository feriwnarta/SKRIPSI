<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_report']) && !empty($obj['id_user'])) {
	$id_report = mysqli_real_escape_string($db->query, $obj['id_report']);
	$id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
	$result = $db->select('tb_process_report', 'id_report="'.$id_report.'"', 'id_process_report', 'ASC');
	$return_data = array();
	while($data = mysqli_fetch_assoc($result)) {
		$datehistory = (new DateTime($data['current_time_process']))->format("d-m-Y H:i");
		$return_data[] = array(
			'status_process' => $data['status_process'],
			'current_time_process' => $datehistory
		);
	}
	echo json_encode($return_data);
} else {
	echo json_encode([]);
}