<?php 

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(isset($obj['id_user'])) {
    $data = $db->select('tb_category', 'id_category', 'id_category', 'ASC');
    $data_return = array();
    while($result = mysqli_fetch_assoc($data)) {
        $data_return[] = $result;
    }
    echo json_encode($data_return, JSON_PRETTY_PRINT);
}