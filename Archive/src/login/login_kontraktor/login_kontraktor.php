<?php
require_once("../../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['username']) && !empty($obj['password'])) {
	$username = $obj['username'];
	$password = $obj['password'];
	$ubah1=str_replace("=", "", base64_encode($obj['password']));
	$pengacak = "Bl4ck3rH4ck3r3ncR1pt";
	$ubah2 = md5($pengacak . md5($ubah1) . $pengacak );
	$hasil_password = md5($pengacak . md5($ubah2) . $pengacak );
	$cek=$db->select('tb_contractor', 'username="'.$username.'" && password="'.$hasil_password.'"', 'id_contractor', 'ASC');
	$jum=mysqli_num_rows($cek);
	if($jum>0) {
		$u=mysqli_fetch_assoc($cek);
		$job_data = $db->select('tb_contractor_job', 'id_contractor="'.$u['id_contractor'].'"', 'id_contractor', 'ASC');
		$job = array();
		while($data = mysqli_fetch_assoc($job_data)) {
			$job[] = $data['id_category'];
		}
		$data_user = [
			"status" => "contractor",	
			"id_contractor" => $u['id_contractor'],
			"name_contractor" =>
			 $u['name_contractor'],
			"job" => $job
		];
		echo json_encode($data_user, JSON_PRETTY_PRINT);
	} else {
		echo json_encode('login_kontraktor_failed');
	}
} 
?>