<?php 
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_estate_cordinator'])) {
	$id_cordinator = mysqli_real_escape_string($db->query, ($obj['id_estate_cordinator']));
	$cek=$db->select('tb_estate_cordinator', 'id_estate_cordinator="'.$id_cordinator.'"', 'id_estate_cordinator', 'ASC');
	$jum = mysqli_num_rows($cek);
	if($jum > 0) {
		$data_user = [];
		$data = mysqli_fetch_assoc($cek);
		foreach ($data as $key => $value) {
			if($key != 'password') {
				$data_user[$key] = $value;
			}
		}
		$job_cordinator = $db->select('tb_estate_cordinator_job', 'id_estate_cordinator="'.$data['id_estate_cordinator'].'"', 'id_estate_cordinator', 'ASC');
		$id_cordinator_2 = mysqli_fetch_assoc($job_cordinator);
		$job_data = $db->select('tb_master_category', 'id_master_category="'.$id_cordinator_2['id_master_category'].'"', 'id_master_category', 'ASC');
		$id_master_category = mysqli_fetch_assoc($job_data);
		$id_category = $db->select('tb_category', 'id_master_category="'.$id_master_category['id_master_category'].'"', 'id_category', 'ASC');
		$job = array();
		while($rs = mysqli_fetch_assoc($id_category)) {
			$job[] = $rs['id_category'];
		}
		$data_user['job_complaint'] = $job;
		echo json_encode($data_user);
	}
}


	
