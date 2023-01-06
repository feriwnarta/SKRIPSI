<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_category'])) {
	$id_category = mysqli_real_escape_string($db->query, $obj['id_category']);
	$data_balik = array();
	
	$rs_category_detail = $db->select('tb_category_detail', 'id_category="' . $id_category . '"', 'id_category', 'ASC');
	while($category_detail = mysqli_fetch_assoc($rs_category_detail)) {
	    $data['name'] = $category_detail['name_category_detail'];
	    $data['id_category_detail'] = $category_detail['id_category_detail'];
	    
	    $rs = $db->select('tb_klasifikasi_category', 'id_category_detail="'.$category_detail['id_category_detail'].'"', 'id_klasifikasi', 'ASC');
	    
	    while($klasifikasi_category = mysqli_fetch_assoc($rs)) {
	        $data['data_klasifikasi'][] = [
	            'name_klasifikasi' => $klasifikasi_category['klasifikasi'],
	            'id_klasifikasi' => $klasifikasi_category['id_klasifikasi']
	        ];
	    }
	    $data_balik[] = $data;
	    $data['data_klasifikasi'] = array();
	}
	
	
	echo json_encode($data_balik, JSON_PRETTY_PRINT);
}