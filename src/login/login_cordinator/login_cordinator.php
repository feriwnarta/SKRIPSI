<?php
require_once("../../../file/function_proses.php");
require_once("../../utils/Uuid.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if(!empty($obj['username']) && !empty($obj['password']) && !empty($obj['token'])) {
    $unique_id = UUID::guidv4();
	$username = $obj['username'];
	$password = $obj['password'];
	$token = $obj['token'];
	$ubah1=str_replace("=", "", base64_encode($obj['password']));
	$pengacak = "Bl4ck3rH4ck3r3ncR1pt";
	$ubah2 = md5($pengacak . md5($ubah1) . $pengacak );
	$hasil_password = md5($pengacak . md5($ubah2) . $pengacak );

	$cek=$db->select('tb_user', 'username="'.$username.'" && password="'.$hasil_password.'"', 'id_user', 'ASC');

	$jum=mysqli_num_rows($cek);
	if($jum>0) {
		$u=mysqli_fetch_assoc($cek);
		
		$date = date('Y-m-d H:i:s');
		
		$cek_token = $db->select('tb_user_fcm_token', 'id_user = "' . $u['id_user'] . '"', 'id_token', 'ASC');
		
		if(mysqli_num_rows($cek_token) > 0) {
		    // update fcm token
	        $update_token = $db->update('tb_user_fcm_token', 'token="' . $token . '", update_at="' . $date . '"', 'id_user="' . $u['id_user'] . '"');    
		    
		} else {
		    $result = $db->insert('tb_user_fcm_token', 'id_token = "' . $unique_id . '", id_user = "' . $u['id_user'] . '", token = "' . $token . '"');
		    
		    if(!$result) {
		        echo json_encode('gagal update token cordinator');
		        die();
		    }
		}
		
		
	    
		$job_cordinator = $db->select('tb_estate_cordinator_job', 'id_estate_cordinator="'.$u['id_user'].'"', 'id_estate_cordinator', 'ASC');
		$id_cordinator = mysqli_fetch_assoc($job_cordinator);
		$job_data = $db->select('tb_master_category', 'id_master_category="'.$id_cordinator['id_master_category'].'"', 'id_master_category', 'ASC');
		$id_master_category = mysqli_fetch_assoc($job_data);
		$id_category = $db->select('tb_category', 'id_master_category="'.$id_master_category['id_master_category'].'"', 'id_category', 'ASC');
		$job = array();
		while($rs = mysqli_fetch_assoc($id_category)) {
			$job[] = $rs['id_category'];
		}
		$data_user = [
			"status" => "cordinator",
			"id_estate_cordinator" => $u['id_user'],
			"name_estate_cordinator" => $u['name'],
			"job" => $job,
			"update_token" => $update_token
		];
		echo json_encode($data_user, JSON_PRETTY_PRINT);
	} else {
		echo json_encode("login_cordinator_failed");
	}
}
?>