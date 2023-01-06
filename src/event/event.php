<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user'])) {
	$data = $db->select('tb_bill_event', 'id_event', 'id_event', 'ASC');
	$data_balik = array();
	while ($rs = mysqli_fetch_assoc($data)) {
		$data_balik[] = $rs;
	}
	echo json_encode($data_balik);
}
