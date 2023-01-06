<?php
require_once('../../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user']) && !empty($obj['id_status'])) {
	// data user
	$id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
	$id_status = mysqli_real_escape_string($db->query, $obj['id_status']);
	$result = $db->insert('tb_like_status', 'id_status="'.$id_status.'",id_user="'.$id_user.'"');
	if($result) {
		echo json_encode('OK');
	} else {
		echo json_encode('FAILL');
	}
 }
?>