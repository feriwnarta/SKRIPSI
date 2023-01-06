<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user']) && !empty($obj['id_category'])) {
	$id_category = mysqli_real_escape_string($db->query, $obj['id_category']);
	$rs = $db->select('tb_category_detail', 'id_category="'.$id_category.'"', 'id_category_detail', 'ASC');
	$data = array();
	while($value = mysqli_fetch_assoc($rs)) {
		$data[] = $value;
	}
	echo json_encode($data);
}