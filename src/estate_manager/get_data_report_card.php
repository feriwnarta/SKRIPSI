<?php

require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_report'])) {
    $id_report = mysqli_real_escape_string($db->query, $obj['id_report']);
    $data_report = $db->select('tb_report', 'id_report = "' . $id_report . '"', 'id_report', 'DESC');

    if (mysqli_num_rows($data_report) > 0) {
        $data_report = mysqli_fetch_assoc($data_report);
        $description = $data_report['description'];
        $id_report = $data_report['id_report'];
        $latitude = $data_report['latitude'];
        $longitude = $data_report['longitude'];
        $time = $data_report['create_at'];
        $url = $data_report['url_image'];
        $address = $data_report['address'];
        $status = $data_report['status'];

        if ($status == 'Menunggu' || $status == 'Diterima') {
            echo json_encode(
                array(
                    'status' => $status,
                    'description' => (empty($description)) ? $data_report['category'] : $description,
                    'id_report' => $id_report,
                    'latitude' => $latitude,
                    'longitude' => $longitude,
                    'time' => $time,
                    'address' => $address,
                    'url' => $url,
                ),
                JSON_PRETTY_PRINT
            );
        } else if ($status == 'Diproses') {
            $process = $db->select('tb_process_report', 'id_report = "' . $id_report . '" AND status_process REGEXP "Laporan diproses"', 'id_process_report', 'DESC');

            if (mysqli_num_rows($process) > 0) {
                $process = mysqli_fetch_assoc($process);
                $process_time = $process['current_time_process'];
                echo json_encode(
                    array(
                        'status' => $status,
                        'description' => (empty($description)) ? $data_report['category'] : $description,
                        'id_report' => $id_report,
                        'latitude' => $latitude,
                        'longitude' => $longitude,
                        'time' => $time,
                        'address' => $address,
                        'url' => $url,
                        'process_time' => $process_time,
                    ),
                    JSON_PRETTY_PRINT
                );
            }
        } else {
            echo json_encode(
                array(
                    'status' => $status,
                    'description' => (empty($description)) ? $data_report['category'] : $description,
                    'id_report' => $id_report,
                    'latitude' => $latitude,
                    'longitude' => $longitude,
                    'time' => $time,
                    'address' => $address,
                    'url' => $url,
                ),
                JSON_PRETTY_PRINT
            );
        }
    }
}
