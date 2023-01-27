<?php
require_once('../../file/function_proses.php');
require_once("../utils/Uuid.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(isset($obj['id_user'])) {
    $status =  mysqli_real_escape_string($db->query, ($obj['status']));
}