<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user'])) {
	$rs = $db->select('tb_category', 'id_category', 'id_category', 'ASC');
	$data = array();
	while($value = mysqli_fetch_assoc($rs)) {
		$data[] = $value;
	}
	echo json_encode($data);
}
