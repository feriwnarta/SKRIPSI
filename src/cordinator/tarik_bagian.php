<?php 

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(isset($obj['id_user'])) {
    $dataMasterCategory = $db->select('tb_master_category', 'id_master_category', 'id_master_category', 'ASC');
    $resultMasterCategory = array();
    
    while($result = mysqli_fetch_assoc($dataMasterCategory)) {
        $resultMasterCategory[] = array(
            'id_master_category' => $result['id_master_category'],
            'unit' => $result['unit']
        );
    }
    
    echo json_encode($resultMasterCategory, JSON_PRETTY_PRINT);
}