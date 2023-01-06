<?php
require_once('../../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user']) && !empty($obj['id_status'])) {
	$id_status = mysqli_real_escape_string($db->query, $obj['id_status']);
	$like = $db->count('tb_like_status', 'id_status="'.$id_status.'"', 'id_status');
	$like_count = mysqli_fetch_assoc($like);
	echo json_encode($like_count['count']);
}
