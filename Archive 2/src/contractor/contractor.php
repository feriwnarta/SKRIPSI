<?php 
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_contractor'])) {
	$id_contractor = mysqli_real_escape_string($db->query, ($obj['id_contractor']));
	$cek=$db->select('tb_contractor', 'id_contractor="'.$id_contractor.'"', 'id_contractor', 'ASC');
	$jum = mysqli_num_rows($cek);
	if($jum > 0) {
		$data_user = [];
		$data = mysqli_fetch_assoc($cek);
		foreach ($data as $key => $value) {
			if($key != 'password' && $key != 'username') {
				$data_user[$key] = $value;
			}
		}
		$job_data = $db->select('tb_contractor_job', 'id_contractor="'.$data['id_contractor'].'"', 'id_contractor', 'ASC');
		$job = array();
		while($data = mysqli_fetch_assoc($job_data)) {
			$job[] = $data['id_category'];
		}
		$data_user['job_complaint'] = $job;

		echo json_encode($data_user);
	}
}


	
