<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if(!empty($obj['otp']) && !empty($obj['iplOrEmail'])) {
	$otp = mysqli_real_escape_string($db->query, $obj['otp']);
	$iplOrEmail = mysqli_real_escape_string($db->query, $obj['iplOrEmail']);


	$exist = $db->select('tb_user', 'username=("'.$iplOrEmail.'" OR email = "'.$iplOrEmail .'") AND otp="'.$otp.'"', 'id_user', 'ASC');
	$ipl_real_formatted = explode("/", $iplOrEmail);

	if(count($ipl_real_formatted) > 3) {
		$ipl_real_formatted = $ipl_real_formatted[0] . "/BAST/" . $ipl_real_formatted[2] . '/' . $ipl_real_formatted[3];
	} else {
		$ipl_real_formatted = $ipl_real_formatted[0] . "/RW/" . $ipl_real_formatted[2];
	}

	if(mysqli_num_rows($exist) > 0) {
	    $rs = $db->update('tb_user', 'otp="0"', 'username="'.$iplOrEmail.'" OR email="' . $iplOrEmail . '"');
	    if($rs) {
	        echo json_encode(array(
	            "status" => "OKE",
	            "no_ipl" => $ipl_real_formatted
	            ));   
	    } else {
	        echo json_encode(array(
	            "status" => "FAILL",
	            "no_ipl" => $ipl_real_formatted
	            ));
	    }
	} else {
	    echo json_encode(array(
	            "status" => "FAILL",
	            "no_ipl" => $ipl_real_formatted
	            ));   
	}
}
