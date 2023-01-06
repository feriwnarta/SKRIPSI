<?php 
require_once("../../../file/function_proses.php");
require_once("../../utils/Uuid.php");

$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['name_contractor']) && !empty($obj['username']) && !empty($obj['password']) && !empty($obj['id_estate_cordinator']) && !empty($obj['contractor_job'])){
    $unique_id = UUID::guidv4();
	$name_contractor = mysqli_real_escape_string($db->query, $obj['name_contractor']);
	$username = mysqli_real_escape_string($db->query, $obj['username']);
	$password = mysqli_real_escape_string($db->query, $obj['password']);
	$id_cordinator = mysqli_real_escape_string($db->query, $obj['id_estate_cordinator']);
	$ubah1=str_replace("=", "", base64_encode($password));
	$pengacak = "Bl4ck3rH4ck3r3ncR1pt";
	$ubah2 = md5($pengacak . md5($ubah1) . $pengacak);
	$hasil_password = md5($pengacak . md5($ubah2) . $pengacak );
	
	$cek_user = $db->select('tb_contractor', 'username="' . $username . '"', 'id_contractor', 'ASC');
	
	if(mysqli_num_rows($cek_user) > 0) {
	    echo json_encode('username sudah ada');
	    
	} else {
    	$result = $db->insert('tb_contractor','id_contractor = "' . $unique_id . '",name_contractor="'.$name_contractor.'",username="'.$username.'",password="'.$hasil_password.'",id_estate_cordinator="'.$id_cordinator.'"');
    
    	$select_data=$db->select('tb_contractor','password="'.$hasil_password.'"','id_contractor','DESC');
        $sd=mysqli_fetch_assoc($select_data);
    
    
    	// contractor job
    	$contractor_job = $obj['contractor_job'];
    	$id_contractor_explode = explode(',', mysqli_real_escape_string($db->query, $contractor_job), -1);
    	
    	foreach ($id_contractor_explode as $key) {
    	    $unique_id_job = UUID::guidv4();
    		$db->insert('tb_contractor_job', 'id_contractor_job = "' . $unique_id_job . '", id_contractor="'.$sd['id_contractor'].'",id_category="'.$key.'"');
    	}
    	if($result) {
    		echo json_encode('Register Successful');
    	} 		
	}

	
}

?>
