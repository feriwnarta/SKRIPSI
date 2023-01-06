<?php 

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if(isset($obj['id_user'])) {
    $data_cordinator = $db->select('tb_estate_cordinator', 'id_estate_cordinator', 'id_cordinator', 'ASC');
    if(mysqli_num_rows($data_cordinator) > 0) {
        
        while($data = mysqli_fetch_assoc($data_cordinator)) {
            
        }
        
    } else {
        echo json_encode('cordinator tidak ada');
    }
}