<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user'])) {
	$id_user = $obj['id_user'];	
	$list_report_finished = $db->select('tb_report', 'id_user="'.$id_user.'" && status="finish"', 'id_report', 'DESC');
	$data = array();
	if($list_report_finished) {
		while($value = mysqli_fetch_assoc($list_report_finished)) {
			$total = mysqli_fetch_assoc($db->count('tb_report', 'id_user="'.$id_user.'" && status="finish"', 'status'));
			$value['total'] = $total['count'];
			$time_post = (new DateTime($value['time_post']))->format("H:i");
			$date_post = (new DateTime($value['date_post']))->format("d-m-Y");
			$icon_category = $db->select('tb_category', 'id_category="'.$value['id_category'].'"', 'id_category', 'ASC');
			$icon = mysqli_fetch_assoc($icon_category);
			$rs = $db->select('tb_detail_klasifikasi_category', 'id_report="'.$value['id_report'].'"', 'id_klasifikasi_detail', 'ASC');
			$data_result = array();
			while($dt = mysqli_fetch_assoc($rs)) {
				$val = mysqli_fetch_assoc($db->select('tb_klasifikasi_category', 'id_klasifikasi="'.$dt['id_klasifikasi'].'"','id_klasifikasi', 'ASC'));
				$data_result[] = $val['klasifikasi'];
			}
		$value['icon_category'] = $icon['icon'];
		$value['category_detail'] = $data_result;
		$data[] = $value;
		}
		echo json_encode($data, JSON_PRETTY_PRINT);
	} else {
		echo json_encode(array());
	}

}

