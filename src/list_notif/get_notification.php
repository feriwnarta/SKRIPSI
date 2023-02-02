<?php
include_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user'])) {
    $id_user = htmlspecialchars($obj['id_user']);

    $data = $db->select('tb_notification', 'id_user = "' . $id_user . '"', 'create_at', 'DESC');

    $data_return = array();

    if (mysqli_num_rows($data) > 0) {
        while ($result = mysqli_fetch_assoc($data)) {
            $id_appropriate = $result['id_appropriate'];
            $data_appropriate = $db->select('tb_user', 'id_user = "' . $id_appropriate . '"', 'id_user', 'ASC');
            $data_appropriate = mysqli_fetch_assoc($data_appropriate);

            $url_profile = $data_appropriate['profile_image'];
            $title = $result['title'];
            $content = $result['content'];
            $time = time_elapsed_string($result['create_at']);

            $data_return[] = [
                'url_profile' => $url_profile,
                'title' => $title,
                'content' => $content,
                'time' => $time
            ];
            
        }
        echo json_encode($data_return, JSON_PRETTY_PRINT);
    } else {
        echo json_encode('EMPTY');
    }
} else {
    
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
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? '' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' yang lalu' : 'sekarang';
}
