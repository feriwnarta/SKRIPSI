<?php
require_once("../file/function_proses.php");
	
$json = file_get_contents('php://input');
$obj = json_decode($json, true);	

echo json_encode("OK");

// if(!empty($obj['id_user']))	{
// 	$id = $obj['id_user'];
// 	$cek=$db->select('tb_user', 'id_user="'.$id.'"', 'id_user', 'ASC');
// 	$jum=mysqli_num_rows($cek);
// 	if($jum > 0) {
// 		echo json_encode('OK');
// 	} else {
// 		echo json_encode('FAILL');
// 	} 
// }

?>