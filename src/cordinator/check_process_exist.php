<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_report']) && !empty($obj['id_estate_cordinator'])) {
	$id_estate_cordinator =  mysqli_real_escape_string($db->query, ($obj['id_estate_cordinator']));
	$id_report = mysqli_real_escape_string($db->query, ($obj['id_report']));
	$result = $db->select('tb_process_report', 'id_report="'.$id_report.'" && id_estate_cordinator="'.$id_estate_cordinator.'"', 'id_process_report', 'ASC');
	if(mysqli_num_rows($result) > 0) {
		echo json_encode('EXIST');
	} else {
		echo json_encode('NO EXIST');
	}
}