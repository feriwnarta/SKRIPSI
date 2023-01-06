<?php
require_once('../../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

// if(!empty($obj['id_user']) && !empty($obj['id_status'])) {
	$id_status = mysqli_real_escape_string($db->query, ($obj['id_status']));
	$start = mysqli_real_escape_string($db->query, ($obj['start']));
	$limit = mysqli_real_escape_string($db->query, ($obj['limit']));

	$result = $db->selectpage('tb_comment', 'id_status="'.$id_status.'"', 'id_comment', 'DESC', $start, $limit);
	// $result = $db->select('tb_comment', 'id_status="'.$id_status.'"', 'id_comment', 'ASC');
	if(mysqli_num_rows($result) > 0) {
		$data = array();
		$data_balik = array();
		while($rs = mysqli_fetch_assoc($result)){
			$time = time_elapsed_string($rs['time']);
			$data['id_comment'] = $rs['id_comment'];
		    $data['id_status'] = $rs['id_status'];
		    $data['comment'] = $rs['comment'];
		    $data['time'] = $time;	
			$c = mysqli_fetch_assoc( $db->select('tb_user', 'id_user="'.$rs['id_user'].'"', 'id_user', 'ASC', 'username,profile_image'));
			$data['username'] = $c['username'];
			$data['image_profile'] = $c['profile_image'];
			$data_balik[] = $data;
		}
		echo json_encode($data_balik, JSON_PRETTY_PRINT);
	} else {
		echo json_encode(array());
	}
// }


function time_elapsed_string($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}

