<?php
require_once("../../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (!empty($obj['id_contractor'])) {
    $start = mysqli_real_escape_string($db->query, ($obj['start']));
    $limit = mysqli_real_escape_string($db->query, ($obj['limit']));
    $status = mysqli_real_escape_string($db->query, ($obj['status']));
    $id_contractor = mysqli_real_escape_string($db->query, ($obj['id_contractor']));

    if ($status == 'MANDOR / KEPALA KONTRAKTOR') {

        // select data cordinator job
        $job_contractor = $db->select('tb_employee_job', 'id_employee="' . $id_contractor . '" AND type = "Mandor / Kepala Kontraktor" ', 'id_employee_job', 'ASC');
        if (mysqli_num_rows($job_contractor) > 0) {
            $status1 = 'Menunggu';
            $status2 = 'Diterima';

            while ($result = mysqli_fetch_assoc($job_contractor)) {

                $result_category = $db->select(
                    'tb_category',
                    'id_master_category = "' . $result['id_master_category'] . '"',
                    'id_category',
                    'ASC'
                );

                if (mysqli_num_rows($result_category) > 0) {
                    while ($result = mysqli_fetch_assoc($result_category)) {




                        $cek = $db->selectpage('tb_report', 'id_category="' . $result['id_category'] . '" AND (status ="' . $status1 . '" OR status ="' . $status2 . '")', 'id_report', 'DESC', $start, $limit);

                        if (mysqli_num_rows($cek) > 0) {
                            while ($dt = mysqli_fetch_assoc($cek)) {
                                $time_post = (new DateTime($dt['time_post']))->format("H:i");
                                $date_post = (new DateTime($dt['date_post']))->format("d-m-Y");
                                $icon_category = $db->select('tb_category', 'id_category="' . $dt['id_category'] . '"', 'id_category', 'ASC');
                                $icon = mysqli_fetch_assoc($icon_category);
                                $rs = $db->select('tb_detail_klasifikasi_category', 'id_report="' . $dt['id_report'] . '"', 'id_klasifikasi_detail', 'ASC');
                                $data_result = '';
                                while ($data = mysqli_fetch_assoc($rs)) {
                                    $val = mysqli_fetch_assoc($db->select('tb_klasifikasi_category', 'id_klasifikasi="' . $data['id_klasifikasi'] . '"', 'id_klasifikasi', 'ASC'));
                                    $data_result .= $val['klasifikasi'] .= ',';
                                }

                                $explode_data = explode(',', $data_result);
                                if (count($explode_data) == 2) {
                                    $data_result = $explode_data[0];
                                }
                                $datetime = $dt['date_post'] . ' ' .  $dt['time_post'];

                                if ($dt['status_eskalasi'] == '') {
                                    $data_balik[] = array(
                                        'id_report' => $dt['id_report'],
                                        'id_user' => $dt['id_user'],
                                        'no_ticket' => $dt['no_ticket'],
                                        'description' => $dt['description'],
                                        'date_post' => $date_post,
                                        'time_post' => time_elapsed_string($datetime),
                                        'category' => $dt['category'],
                                        'id_category' => $dt['id_category'],
                                        'icon_category' => $icon['icon'],
                                        'latitude' => $dt['latitude'],
                                        'longitude' => $dt['longitude'],
                                        'url_image' => $dt['url_image'],
                                        'status' => $dt['status'],
                                        'address' => $dt['address'],
                                        'category_detail' => $data_result
                                    );
                                } else {
                                    $data_balik[] = array(
                                        'id_report' => $dt['id_report'],
                                        'id_user' => $dt['id_user'],
                                        'no_ticket' => $dt['no_ticket'],
                                        'description' => $dt['description'],
                                        'date_post' => $date_post,
                                        'time_post' => time_elapsed_string($datetime),
                                        'category' => $dt['category'],
                                        'id_category' => $dt['id_category'],
                                        'icon_category' => $icon['icon'],
                                        'latitude' => $dt['latitude'],
                                        'longitude' => $dt['longitude'],
                                        'url_image' => $dt['url_image'],
                                        'status' => $dt['status_eskalasi'],
                                        'address' => $dt['address'],
                                        'category_detail' => $data_result
                                    );
                                }
                            }
                        }
                    }
                }
            }
        }
    } else if ($status == 'SUPERVISOR / ESTATE KOORDINATOR') {


        $job_contractor = $db->select('tb_employee_job', 'id_employee="' . $id_contractor . '" AND type = "Supervisor / Estate Koordinator"', 'id_employee_job', 'ASC');

        if (mysqli_num_rows($job_contractor) > 0) {
            $status1 = 'Menunggu';
            $status2 = 'Diterima';
            while ($result = mysqli_fetch_assoc($job_contractor)) {
                $result_category = $db->select(
                    'tb_category',
                    'id_master_category = "' . $result['id_master_category'] . '"',
                    'id_category',
                    'ASC'
                );

                if (mysqli_num_rows($result_category) > 0) {
                    while ($result = mysqli_fetch_assoc($result_category)) {
                        $cek = $db->selectpage('tb_report', 'id_category="' . $result['id_category'] . '" AND (status ="' . $status1 . '" OR status ="' . $status2 . '")', 'id_report', 'DESC', $start, $limit);

                        if (mysqli_num_rows($cek) > 0) {
                            while ($dt = mysqli_fetch_assoc($cek)) {
                                $time_post = (new DateTime($dt['time_post']))->format("H:i");
                                $date_post = (new DateTime($dt['date_post']))->format("d-m-Y");
                                $icon_category = $db->select('tb_category', 'id_category="' . $dt['id_category'] . '"', 'id_category', 'ASC');
                                $icon = mysqli_fetch_assoc($icon_category);
                                $rs = $db->select('tb_detail_klasifikasi_category', 'id_report="' . $dt['id_report'] . '"', 'id_klasifikasi_detail', 'ASC');
                                $data_result = '';
                                while ($data = mysqli_fetch_assoc($rs)) {
                                    $val = mysqli_fetch_assoc($db->select('tb_klasifikasi_category', 'id_klasifikasi="' . $data['id_klasifikasi'] . '"', 'id_klasifikasi', 'ASC'));
                                    $data_result .= $val['klasifikasi'] .= ',';
                                }

                                $explode_data = explode(',', $data_result);
                                if (count($explode_data) == 2) {
                                    $data_result = $explode_data[0];
                                }

                                //pic
                                $pic = $db->select('tb_employee_job', 'id_master_category = "' . $result['id_master_category'] . '" AND type = "Manager Kontraktor"', 'id_employee_job', 'ASC');

                                $data_balik_pic = array();

                                while ($data_pic = mysqli_fetch_assoc($pic)) {
                                    $id_pic = $data_pic['id_employee'];
                                    $data_contractor = $db->select('tb_employee', 'id_employee = "' . $id_pic . '"', 'id_employee', 'ASC');
                                    $data_contractor = mysqli_fetch_assoc($data_contractor);
                                    $data_balik_pic[] = array(
                                        'name_pic' => $data_contractor['name'],
                                        'no_telp' => $data_contractor['no_telp']
                                    );
                                }

                                $datetime = $dt['date_post'] . ' ' .  $dt['time_post'];

                                if ($dt['status_eskalasi'] == '') {
                                    $data_balik[] = array(
                                        'id_report' => $dt['id_report'],
                                        'id_user' => $dt['id_user'],
                                        'no_ticket' => $dt['no_ticket'],
                                        'description' => $dt['description'],
                                        'date_post' => $date_post,
                                        'time_post' => time_elapsed_string($datetime),
                                        'category' => $dt['category'],
                                        'id_category' => $dt['id_category'],
                                        'icon_category' => $icon['icon'],
                                        'latitude' => $dt['latitude'],
                                        'longitude' => $dt['longitude'],
                                        'url_image' => $dt['url_image'],
                                        'status' => $dt['status'],
                                        'address' => $dt['address'],
                                        'manager_contractor' => $data_balik_pic,
                                        'category_detail' => $data_result
                                    );
                                } else {
                                    $data_balik[] = array(
                                        'id_report' => $dt['id_report'],
                                        'id_user' => $dt['id_user'],
                                        'no_ticket' => $dt['no_ticket'],
                                        'description' => $dt['description'],
                                        'date_post' => $date_post,
                                        'time_post' => time_elapsed_string($datetime),
                                        'category' => $dt['category'],
                                        'id_category' => $dt['id_category'],
                                        'icon_category' => $icon['icon'],
                                        'latitude' => $dt['latitude'],
                                        'longitude' => $dt['longitude'],
                                        'url_image' => $dt['url_image'],
                                        'status' => $dt['status_eskalasi'],
                                        'address' => $dt['address'],
                                        'manager_contractor' => $data_balik_pic,
                                        'category_detail' => $data_result
                                    );
                                }
                            }
                        }
                    }
                }
            }
        }
    } else if ($status == 'MANAGER KONTRAKTOR') {
        $job_contractor = $db->select('tb_employee_job', 'id_employee="' . $id_contractor . '"', 'id_employee_job', 'ASC');


        if (mysqli_num_rows($job_contractor) > 0) {
            $master_category = mysqli_fetch_assoc($job_contractor)['id_master_category'];


            $data_category = $db->select('tb_category', 'id_master_category = "' . $master_category . '"', 'id_category', 'ASC');

            $status1 = 'Menunggu';
            $status2 = 'Diterima';

            while ($result_category = mysqli_fetch_assoc($data_category)) {


                $id_category = $result_category['id_category'];

                $cek = $db->selectpage('tb_report', 'id_category="' . $id_category . '" AND (status ="' . $status1 . '" OR status ="' . $status2 . '")', 'id_report', 'DESC', $start, $limit);

                if (mysqli_num_rows($cek) > 0) {
                    while ($dt = mysqli_fetch_assoc($cek)) {
                        $time_post = (new DateTime($dt['time_post']))->format("H:i");
                        $date_post = (new DateTime($dt['date_post']))->format("d-m-Y");
                        $icon_category = $db->select('tb_category', 'id_category="' . $dt['id_category'] . '"', 'id_category', 'ASC');
                        $icon = mysqli_fetch_assoc($icon_category);
                        $rs = $db->select('tb_detail_klasifikasi_category', 'id_report="' . $dt['id_report'] . '"', 'id_klasifikasi_detail', 'ASC');
                        $data_result = '';
                        while ($data = mysqli_fetch_assoc($rs)) {
                            $val = mysqli_fetch_assoc($db->select('tb_klasifikasi_category', 'id_klasifikasi="' . $data['id_klasifikasi'] . '"', 'id_klasifikasi', 'ASC'));
                            $data_result .= $val['klasifikasi'] .= ',';
                        }

                        $explode_data = explode(',', $data_result);
                        if (count($explode_data) == 2) {
                            $data_result = $explode_data[0];
                        }
                        $datetime = $dt['date_post'] . ' ' .  $dt['time_post'];


                        //pic
                        $pic = $db->select('tb_employee_job', 'id_master_category = "' . $master_category . '" AND type = "Mandor / Kepala Kontraktor"', 'id_employee_job', 'ASC');

                        $data_balik_pic = array();

                        while ($data_pic = mysqli_fetch_assoc($pic)) {
                            $id_pic = $data_pic['id_employee'];
                            $data_contractor = $db->select('tb_employee', 'id_employee = "' . $id_pic . '"', 'id_employee', 'ASC');
                            $data_contractor = mysqli_fetch_assoc($data_contractor);
                            $data_balik_pic[] = array(
                                'name_pic' => $data_contractor['name'],
                                'no_telp' => $data_contractor['no_telp']
                            );
                        }


                        if ($dt['status_eskalasi'] == '') {
                            $data_balik[] = array(
                                'id_report' => $dt['id_report'],
                                'id_user' => $dt['id_user'],
                                'no_ticket' => $dt['no_ticket'],
                                'description' => $dt['description'],
                                'date_post' => $date_post,
                                'time_post' => time_elapsed_string($datetime),
                                'category' => $dt['category'],
                                'id_category' => $dt['id_category'],
                                'icon_category' => $icon['icon'],
                                'latitude' => $dt['latitude'],
                                'longitude' => $dt['longitude'],
                                'url_image' => $dt['url_image'],
                                'status' => $dt['status'],
                                'address' => $dt['address'],
                                'kepala_contractor' => $data_balik_pic,
                                'category_detail' => $data_result
                            );
                        } else {
                            $data_balik[] = array(
                                'id_report' => $dt['id_report'],
                                'id_user' => $dt['id_user'],
                                'no_ticket' => $dt['no_ticket'],
                                'description' => $dt['description'],
                                'date_post' => $date_post,
                                'time_post' => time_elapsed_string($datetime),
                                'category' => $dt['category'],
                                'id_category' => $dt['id_category'],
                                'icon_category' => $icon['icon'],
                                'latitude' => $dt['latitude'],
                                'longitude' => $dt['longitude'],
                                'url_image' => $dt['url_image'],
                                'status' => $dt['status_eskalasi'],
                                'address' => $dt['address'],
                                'kepala_contractor' => $data_balik_pic,
                                'category_detail' => $data_result
                            );
                        }
                    }
                }
            }
        } else {
        }
    }


    if (!empty($data_balik)) {
        echo json_encode($data_balik, JSON_PRETTY_PRINT);
    } else {
        echo json_encode(array(), JSON_PRETTY_PRINT);
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
            $v = $diff->$k . ' ' . $v;
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . '' : '';
}
