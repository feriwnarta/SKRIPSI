<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if(!empty($obj['id_user'])) {
	$data = $db->select('tb_informasi_umum', 'id_informasi_umum', 'id_informasi_umum', 'DESC');
	
	$data_balik = array();
	$bulan = array (
		'Januari',
		'Februari',
		'Maret',
		'April',
		'Mei',
		'Juni',
		'Juli',
		'Agustus',
		'September',
		'Oktober',
		'November',
		'Desember'
	);
	while($rs = mysqli_fetch_assoc($data)) {
		$writerAndTime = (new DateTime($rs['time']))->format("d-m-Y H:i");
		$pecahkan = explode('-', $writerAndTime);
		$bln = explode(0, $pecahkan[1]);
		$writerAndTime = $pecahkan[0] . ' ' . $bulan[$bln[1]] . ' ' . $pecahkan[2];
		$rs['time'] = $writerAndTime;
		$data_balik[] = $rs;
	}
	echo json_encode($data_balik, JSON_PRETTY_PRINT);
}
