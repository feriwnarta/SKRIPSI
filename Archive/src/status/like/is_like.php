<?php 
require_once('../../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user']) && !empty($obj['id_status'])) {
	$id_status = mysqli_real_escape_string($db->query, $obj['id_status']);
	$id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
	$is_like = $db->select('tb_like_status', 'id_status="'.$id_status.'" && id_user="'.$id_user.'"', 'id_like', 'ASC');
	echo json_encode(mysqli_num_rows($is_like));
}
