<?php
require_once("../../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

	if(!empty($obj['id_user'])) {
		$start = mysqli_real_escape_string($db->query, ($obj['start']));
		$limit = mysqli_real_escape_string($db->query, ($obj['limit']));
		$id_user = mysqli_real_escape_string($db->query, ($obj['id_user']));

        $result = $db->select('tb_access', 'id_user="' . $id_user . '"', 'id_user', 'DESC');
        if(mysqli_num_rows($result) > 0) {
            $result = mysqli_fetch_assoc($result);
            if($result['management'] == 1) {
                    $cek = $db -> selectpage('tb_report', 'status="listed" || status ="noticed"', 'id_report', 'DESC', $start, $limit);
                    if(mysqli_num_rows($cek) > 0) {
                        while($dt = mysqli_fetch_assoc($cek)) {
                        $time_post = (new DateTime($dt['time_post']))->format("H:i");
                        $date_post = (new DateTime($dt['date_post']))->format("d-m-Y");
                        $icon_category = $db->select('tb_category', 'id_category="'.$dt['id_category'].'"', 'id_category', 'DESC');
                        $icon = mysqli_fetch_assoc($icon_category);
                        $rs = $db->select('tb_detail_klasifikasi_category', 'id_report="'.$dt['id_report'].'"', 'id_klasifikasi_detail', 'DESC');
                        $data_result = '';
                        while($data = mysqli_fetch_assoc($rs)) {
                            $val = mysqli_fetch_assoc($db->select('tb_klasifikasi_category', 'id_klasifikasi="'.$data['id_klasifikasi'].'"','id_klasifikasi', 'DESC'));
                            $data_result .= $val['klasifikasi'] .= ',';
                        }
        
                        $explode_data = explode(',', $data_result);
                        if(count($explode_data) == 2) {
                            $data_result = $explode_data[0];
                        }
                        $datetime = $dt['date_post'] . ' ' .  $dt['time_post'];
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
                        }
                    }
                
                if(!empty($data_balik)) {
                    echo json_encode($data_balik, JSON_PRETTY_PRINT);
                } else {
                    echo json_encode(array(), JSON_PRETTY_PRINT);
                }
            }
        } else {
            echo json_encode('E002');
        }

	}

	function time_elapsed_string($datetime, $full = false) {
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
