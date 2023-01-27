<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
	if(!empty($obj['id_user']) && isset($obj['start']) && isset($obj['limit'])) {
		$start = mysqli_real_escape_string($db->query, ($obj['start']));
		$limit = mysqli_real_escape_string($db->query, ($obj['limit']));
		$id_user = mysqli_real_escape_string($db->query, ($obj['id_user']));
		$cek = $db -> selectpage('tb_report', '(type="Anonim" || id_user="' . $id_user . '")', 'id_report', 'DESC', $start, $limit);

		$jum=mysqli_num_rows($cek);
		if ($jum > 0) {
			$data = array();
			while($value = mysqli_fetch_assoc($cek)) {
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
				$status_working;
				$work_cordinator = $db->select('tb_process_work', 'id_report="' . $value['id_report'] .'"', 'id_process_work', 'DESC');
				if(mysqli_num_rows($work_cordinator) > 0) {
				    $status_working = 'cordinator';
				    $work_cordinator = mysqli_fetch_assoc($work_cordinator);
				    $photo_process1 = $work_cordinator['photo_work_1'];
				    $photo_process2 = $work_cordinator['photo_work_2'];
				    $photo_complete1 = $work_cordinator['photo_complete_1'];
				    $photo_complete2 = $work_cordinator['photo_complete_2'];
				} else {
					$status_working = 'cordinator';
				    $photo_process1 = '';
				    $photo_process2 = '';
				    $photo_complete1 = '';
				    $photo_complete2 = '';
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
					'category_detail' => $data_result,
					'star' => $value['star'],
					'comment' => $value['comment'],
					'working_data' => [
					        'status_working' => $status_working,
					        'photo_process1' => $photo_process1,
					        'photo_process2' => $photo_process2,
					        'photo_complete1' => $photo_complete1,
					        'photo_complete2' => $photo_complete2,
					    ]
				);
			}
			echo json_encode($data, JSON_PRETTY_PRINT);
		} 
		else {
			echo json_encode(array());
		}		

	}
