<?php

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['noIplOrEmail']) && !empty($obj['password'])) {
	$noIplOrEmail = mysqli_real_escape_string($db->query, $obj['noIplOrEmail']);
	$password = mysqli_real_escape_string($db->query, $obj['password']);
	$ubah1=str_replace("=", "", base64_encode($obj['password']));
	$pengacak = "Bl4ck3rH4ck3r3ncR1pt";
	$ubah2 = md5($pengacak . md5($ubah1) . $pengacak );
	$hasil_password = md5($pengacak . md5($ubah2) . $pengacak );
	$rs = $db->update('tb_user', 'password="'.$hasil_password.'"', 'username="'.$noIplOrEmail.'" OR email="' . $noIplOrEmail . '"');
	if($rs) {
		echo json_encode('OKE');
	} else {
		echo json_encode('FAILL');
	}

}