<?php

class db
{

    var $mysqli_host_app    = "localhost";
    var $mysqli_database_app = "nextg_mobileapp";
    var $mysqli_user_app     = "root";
    var $mysqli_password_app = "";

    var $mysqli_host_rw     = "localhost";
    var $mysqli_database_rw = "nextg_rw";
    var $mysqli_user_rw     = "root";
    var $mysqli_password_rw = "";

    var $query = '';
    var $query_rw  = '';

    function __construct()
    {
        $this->query = mysqli_connect($this->mysqli_host_app, $this->mysqli_user_app, $this->mysqli_password_app, $this->mysqli_database_app);
        $this->query_rw = mysqli_connect($this->mysqli_host_rw, $this->mysqli_user_rw, $this->mysqli_password_rw, $this->mysqli_database_rw);
    }

    function count($table, $where, $kolom)
    {
        $query = mysqli_query($this->query, "SELECT COUNT($kolom) AS count FROM $table WHERE $where");
        return $query;
    }

    function select_rw($table, $where, $by, $aksi, $kolom = '*')
    {
        $query_rw = mysqli_query($this->query_rw, "SELECT $kolom FROM $table where $where order by $by $aksi");
        return $query_rw;
    }

    function select($table, $where, $by, $aksi, $kolom = '*')
    {
        $query = mysqli_query($this->query, "SELECT $kolom FROM $table where $where order by $by $aksi");
        return $query;
    }

    function select_distinct_rw($kolom, $table, $where, $groupby, $aksi)
    {
        $query_rw = mysqli_query($this->query_rw, "SELECT DISTINCT $kolom FROM $table WHERE $where GROUP BY $groupby $aksi");
        return $query_rw;
    }

    function selectpage($table, $where, $by, $aksi, $awal, $akhir, $kolom = '*')
    {
        $query = mysqli_query($this->query, "SELECT $kolom FROM $table where $where order by $by $aksi LIMIT {$awal} , {$akhir}");
        return $query;
    }

    function select_chart($table, $kolom, $where)
    {
        $query = mysqli_query($this->query, "SELECT HOUR({$kolom}) as hour, COUNT(*) as num_rows FROM {$table} WHERE {$where} GROUP BY HOUR({$kolom})");
        return $query;
    }

    function insert($table, $set)
    {
        $query = mysqli_query($this->query, "INSERT INTO $table SET $set");
        return $query;
    }

    function update($table, $set, $where)
    {
        $query = mysqli_query($this->query, "UPDATE $table SET $set WHERE $where");
        return $query;
    }

    function hapus($table, $where)
    {
        $query = mysqli_query($this->query, "DELETE FROM $table WHERE $where");
        return $query;
    }

    function affectedRows()
    {
        return mysqli_affected_rows($this->query);
    }
}

class FirebaseMessaging
{
    static function sendNotif($token, $title, $body)
    {
        $url = "https://fcm.googleapis.com/fcm/send";
        $serverKey = 'AAAA3Q9KXzA:APA91bGXuN0_0OxdjXOO8YIUnZ2ep3x2RYSAsjvyBQmaoyjDOfJoixzkGlmq2aflg4Q_T8-4Bq_SyOLcCEG0hfQNer-xSEEdPZjJ0dTQjBxElEJlimECL8JzLE1EW9PfXk6VFlYoHqD8';
        $notification = array('title' => $title, 'body' => $body, 'sound' => 'default', 'badge' => '1');
        $arrayToSend = array('to' => $token, 'notification' => $notification, 'priority' => 'high');
        $json = json_encode($arrayToSend);
        $headers = array();
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Authorization: key=' . $serverKey;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        //Send the request
        $response = curl_exec($ch);
        //Close request
        if ($response === FALSE) {
            return 'error';
        } else {
            return 'success';
        }
        curl_close($ch);
    }
    
}

date_default_timezone_set('asia/jakarta');

$db = new db();

$this_time = new DateTime();
$this_time->format('Y-m-d H:i:s');

$data_report = $db->select('tb_report', 'id_report', 'id_report', 'DESC');

if (mysqli_num_rows($data_report) > 0) {
    while ($result_report = mysqli_fetch_assoc($data_report)) {
        $id_report = $result_report['id_report'];
        $id_category = $result_report['id_category'];
        $create_at = $result_report['create_at'];
        $waktu = time_elapsed_string($create_at);
        $status = $result_report['status'];

        if ($waktu == '1 jam') {
            if ($status == 'Menunggu' || $status == 'Diterima' || $status == 'Diproses') {
                $query = $db->update('tb_report', 'status = "Eskalasi tingkat 1"', 'id_report = "' . $id_report . '"');
                if ($query) {

                    $data_manager_contractor = $db->select('tb_manager_contractor_job', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

                    while ($result_manager_contractor = mysqli_fetch_assoc($data_manager_contractor)) {
                        $id_manager_contractor = $result_manager_contractor['id_manager_contractor'];

                        $manager_contractor = $db->select('tb_manager_contractor', 'id_manager_contractor = "' . $id_manager_contractor . '"', 'id_manager_contractor', 'ASC');

                        $manager_contractor = mysqli_fetch_assoc($manager_contractor);

                        $name_manager = $manager_contractor['name'];
                        $id_manager_contractor = $manager_contractor['id_manager_contractor'];

                        $status_process = 'Laporan dieskalasikan tingkat 1 ke manajer kontraktor (' . $name_manager . ')';

                        $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

                        if ($query_process) {
                            $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

                            $user_token = mysqli_fetch_assoc($user_token);

                            $title = 'Eskalasi tingkat 1';

                            $body = 'Segera hubungi kepala kontraktor terkait';

                            $user_token = $user_token['token'];

                            FirebaseMessaging::sendNotif($user_token, $title, $body);
                        }
                    }
                }
            }
        } else if ($waktu == '2 jam') {
            if ($status == 'Eskalasi tingkat 1') {
                $query = $db->update('tb_report', 'status = "Eskalasi tingkat 2"', 'id_report = "' . $id_report . '"');
                if ($query) {

                    $category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

                    $category = mysqli_fetch_assoc($category);

                    $id_master = $category['id_master_category'];


                    $data_manager_contractor = $db->select('tb_estate_cordinator_job', 'id_master_category = "' . $id_master . '"', 'id_master_category', 'ASC');

                    while ($result_manager_contractor = mysqli_fetch_assoc($data_manager_contractor)) {
                        $id_manager_contractor = $result_manager_contractor['id_estate_cordinator'];

                        $manager_contractor = $db->select('tb_estate_cordinator', 'id_estate_cordinator = "' . $id_manager_contractor . '"', 'id_estate_cordinator', 'ASC');

                        $manager_contractor = mysqli_fetch_assoc($manager_contractor);

                        $name_manager = $manager_contractor['name_estate_cordinator'];
                        $id_manager_contractor = $manager_contractor['id_estate_cordinator'];

                        $status_process = 'Laporan dieskalasikan tingkat 2 ke estate cordinator (' . $name_manager . ')';

                        $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

                        if ($query_process) {
                            $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

                            $user_token = mysqli_fetch_assoc($user_token);

                            $title = 'Eskalasi tingkat 2';

                            $body = 'Segera hubungi manajer kontraktor terkait';

                            $user_token = $user_token['token'];

                            FirebaseMessaging::sendNotif($user_token, $title, $body);
                        }
                    }
                }
            }
        } else if ($waktu == '3 jam') {
            if ($status == 'Eskalasi tingkat 2') {
                $query = $db->update('tb_report', 'status = "Eskalasi tingkat 3"', 'id_report = "' . $id_report . '"');
                if ($query) {

                    $estate_manager = $db->select('tb_estate_manager', 'id_estate_manager NOT IN ("") ', 'id_estate_manager', 'ASC');
                    $estate_manager = mysqli_fetch_assoc($estate_manager);


                    $id_manager_contractor = $estate_manager['id_estate_manager'];
                    $name_manager = $estate_manager['name_estate_manager'];

                    $status_process = 'Laporan dieskalasikan tingkat 3 ke estate manager (' . $name_manager . ')';

                    $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

                    if ($query_process) {
                        $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

                        $user_token = mysqli_fetch_assoc($user_token);

                        $title = 'Eskalasi tingkat 3';

                        $body = 'Segera hubungi estate cordinator terkait';

                        $user_token = $user_token['token'];

                        FirebaseMessaging::sendNotif($user_token, $title, $body);
                    }
                }
            }
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
    return $string ? implode(', ', $string) . '' : '';
}
