<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['query'])) {
	$search = $obj['query'];
	$rs = searchQuery('no_ticket LIKE "%'.$search.'%"');
	$data = array();
	while($value = mysqli_fetch_assoc($rs)) {
		$time_post = (new DateTime($value['time_post']))->format("H:i");
		$date_post = (new DateTime($value['date_post']))->format("d-m-Y");
		$icon_category = $db->select('tb_category', 'id_category="'.$value['id_category'].'"', 'id_category', 'DESC');
		$icon = mysqli_fetch_assoc($icon_category);
		$klasifikasi = $db->select('tb_detail_klasifikasi_category', 'id_report="'.$value['id_report'].'"', 'id_klasifikasi_detail', 'DESC');
		$data_result = array();
		while($dt = mysqli_fetch_assoc($klasifikasi)) {
			$val = mysqli_fetch_assoc($db->select('tb_klasifikasi_category', 'id_klasifikasi="'.$dt['id_klasifikasi'].'"','id_klasifikasi', 'DESC'));
			$data_result[] = $val['klasifikasi'];
		}
		$data[] = array(
			'id_report' => $value['id_report'],
			'id_user' => $value['id_user'],
			'no_ticket' => $value['no_ticket'],
			'description' => $value['description'],
			'date_post' => $date_post,
			'time_post' => $time_post,
			'category' => $value['category'],
			'id_category' => $value['id_category'],
			'icon_category' => $icon['icon'],
			'latitude' => $value['latitude'],
			'longitude' => $value['longitude'],
			'url_image' => $value['url_image'],
			'status' => $value['status'],
			'category_detail' => $data_result
		);
	}
	echo json_encode($data, JSON_PRETTY_PRINT);
}

function searchQuery($where) {
	global $db;	
	$query = mysqli_query($db->query,"SELECT * FROM tb_report WHERE $where ORDER BY id_report DESC");		
	return $query;
}