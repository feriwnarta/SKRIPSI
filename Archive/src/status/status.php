<?php
include_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if(!empty($obj['id_user'])) {
	$start = mysqli_real_escape_string($db->query, ($obj['start']));
	$limit = mysqli_real_escape_string($db->query, ($obj['limit']));
	$cek = $db -> selectpage('tb_status', 'id_status', 'id_status', 'DESC', $start, $limit);

	$jum=mysqli_num_rows($cek);
		if ($jum > 0) {
			$data = array();
			while($value = mysqli_fetch_assoc($cek)) {
				$id_status = $value['id_status'];
				$id_user = mysqli_real_escape_string($db->query, ($obj['id_user']));
				$is_like = $db->select('tb_like_status', 'id_status="'.$id_status.'" && id_user="'.$id_user.'"', 'id_like', 'ASC');
				$user_is_like = mysqli_num_rows($is_like);
				$like = $db->count('tb_like_status', 'id_status="'.$id_status.'"', 'id_status');
				$like_count = mysqli_fetch_assoc($like);
				$count_like = $like_count['count'];
				$comment = $db->count('tb_comment', 'id_status="'.$id_status.'"', 'id_status');
				$comment_count = mysqli_fetch_assoc($comment);

				$waktu_upload = time_elapsed_string($value['upload_time']);
				$data[] = array(
					'username' => $value['username'],
					'foto_profile' => $value['foto_profile'],
					'status_image' => $value['status_image'],
					'id_status' => $value['id_status'],
					'caption' => $value['caption'],
					'comment' => $value['comment'],
					'like' => $value['like'],
					'upload_time' => $waktu_upload,
					'is_like' => $user_is_like,
					'like_count' => $count_like,
					'comment_count' => $comment_count['count']
				);
			}
			echo json_encode($data, JSON_PRETTY_PRINT);
		} else {
			echo json_encode(array(), JSON_PRETTY_PRINT);
		}		
}

// echo time_elapsed_string('2022-05-30 12:30:35');

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
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' yang lalu' : 'sekarang';
}


?>