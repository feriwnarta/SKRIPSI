<?php
require_once('../../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user']) && !empty($obj['id_status']) ) {
	$id_status = mysqli_real_escape_string($db->query, $obj['id_status']);
	$id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
	$comment = $db->count('tb_comment', 'id_status="'.$id_status.'"', 'id_status');
	$comment_count = mysqli_fetch_assoc($comment);
	echo json_encode($comment_count['count']);
}
