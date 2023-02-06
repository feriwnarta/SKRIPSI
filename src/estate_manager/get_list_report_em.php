<?php

require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user']) && isset($obj['status']) && isset($obj['start']) && isset($obj['limit'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $status = mysqli_real_escape_string($db->query, $obj['status']);
    $start = mysqli_real_escape_string($db->query, $obj['start']);
    $limit = mysqli_real_escape_string($db->query, $obj['limit']);


    if ($status == 'Semua') {
        $data_report = $db->selectpage('tb_report', 'id_report', 'id_report', 'DESC', $start, $limit);

        $data_report_return = array();
        $index = 0;
        while ($result_report = mysqli_fetch_assoc($data_report)) {
            $data_category = $db->select('tb_category', 'id_category = "' . $result_report['id_category'] . '"', 'id_category', 'ASC');
            $data_report_return[] = $result_report;

            while ($result_category = mysqli_fetch_assoc($data_category)) {
                $id_master_category = $result_category['id_master_category'];

                // jika pekerjaan keamana
                if ($result_category['id_category'] == 9) {
                    $cordinator_job = $db->select('tb_employee_job', 'id_master_category = "' . $id_master_category . '" AND type = "Danru"', 'id_employee_job', 'ASC');
                } else {
                    $cordinator_job = $db->select('tb_employee_job', 'id_master_category = "' . $id_master_category . '"', 'id_employee_job', 'ASC');
                }


                while ($result_cordinator_job = mysqli_fetch_assoc($cordinator_job)) {
                    $id_estate_cordinator = $result_cordinator_job['id_employee'];
                    $data_estate_cordinator = $db->select('tb_employee', 'id_employee = "' . $id_estate_cordinator . '"', 'id_employee', 'ASC');
                    $data_estate_cordinator = mysqli_fetch_assoc($data_estate_cordinator);
                    $data_report_return[$index]['pic'][] = $data_estate_cordinator;
                }
            }

            $time = $result_report['date_post'] . $result_report['time_post'];
            $time = time_elapsed_string($time);
            $data_report_return[$index]['waktu'] = $time;
            $index++;
        }
        echo json_encode($data_report_return, JSON_PRETTY_PRINT);
    } else {
        $id_master_category = $status;
        $data_report_return = array();
        $data_category = $db->select('tb_category', 'id_master_category = "' . $id_master_category . '"', 'id_category', 'ASC');

        if (mysqli_num_rows($data_category) > 0) {

            while ($result_category = mysqli_fetch_assoc($data_category)) {
                $data_report = $db->selectpage('tb_report', 'id_category = "' . $result_category['id_category'] . '"', 'id_report', 'DESC', $start, $limit);
                $single_data = array();


                while ($result_report = mysqli_fetch_assoc($data_report)) {
                    $single_data = $result_report;


                    if ($result_category['id_category'] == 9) {
                        $cordinator_job = $db->select('tb_employee_job', 'id_master_category = "' . $id_master_category . '" AND type = "Danru"', 'id_employee_job', 'ASC');
                    } else {
                        $cordinator_job = $db->select('tb_employee_job', 'id_master_category = "' . $id_master_category . '" AND type = "Supervisor / Estate Koordinator"', 'id_employee_job', 'ASC');
                    }

                    if (mysqli_num_rows($cordinator_job) > 0) {
                        while ($result_cordinator_job = mysqli_fetch_assoc($cordinator_job)) {
                            $id_estate_cordinator = $result_cordinator_job['id_employee'];
                            $data_estate_cordinator = $db->select('tb_employee', 'id_employee = "' . $id_estate_cordinator . '"', 'id_employee', 'ASC');
                            $data_estate_cordinator = mysqli_fetch_assoc($data_estate_cordinator);
                            $single_data['pic'][] = $data_estate_cordinator;
                        }
                        $time = $result_report['date_post'] . $result_report['time_post'];
                        $time = time_elapsed_string($time);
                        $single_data['waktu'] = $time;
                        $data_report_return[] = $single_data;
                    }
                }
            }
            echo json_encode($data_report_return, JSON_PRETTY_PRINT);
        } else {
            echo json_encode(array(), JSON_PRETTY_PRINT);
        }
    }
}

function time_elapsed_string($datetime, $full = false)
{
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'tahun',
        'm' => 'bulan',
        'w' => 'minggu',
        'd' => 'hari',
        'h' => 'jam',
        'i' => 'menit',
        's' => 'detik',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? '' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' yang lalu' : 'sekarang';
}
