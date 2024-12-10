<?php

class db
{

    var $mysqli_host_app = "178.128.24.13";
    var $mysqli_database_app = "skripsi";
    var $mysqli_user_app     = "apps";
    var $mysqli_password_app = "F3121w1n412t4@";

    var $mysqli_host_rw     = "178.128.24.13";
    var $mysqli_database_rw = "skripsi_rw";
    var $mysqli_user_rw     = "apps";
    var $mysqli_password_rw = "F3121w1n412t4@";

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

class UUID
{
    static function guidv4($data = null)
    {
        // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
        $data = $data ?? random_bytes(16);
        assert(strlen($data) == 16);

        // Set version to 0100
        $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
        // Set bits 6-7 to 10
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

        // Output the 36 character UUID.
        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }
}

class AddNotification
{
    static function saveNotif($id_user, $id_appropriate, $type, $content, $title)
    {
        $unique_id = UUID::guidv4();
        $db = new db();
        $time = date('Y-m-d H:i:s');

        $rs = $db->insert('tb_notification', 'id_notification = "' . $unique_id . '", id_user = "' . $id_user . '", id_appropriate = "' . $id_appropriate . '", type = "' . $type . '", content = "' . $content . '", title = "' . $title . '", update_at = "' . $time . '"');
        return $rs;
    }
}

date_default_timezone_set('asia/jakarta');
$db = new db();

$data_report = $db->select('tb_report', 'id_report', 'id_report', 'DESC');

if (mysqli_num_rows($data_report) > 0) {
    while ($result_report = mysqli_fetch_assoc($data_report)) {
        $id_report = $result_report['id_report'];
        $status_eskalasi = $result_report['status_eskalasi'];
        $id_category = $result_report['id_category'];
        $create_at = $result_report['create_at'];
        $waktu = time_elapsed_string($create_at);
        $status = $result_report['status'];

        echo $waktu;


        if ($status == 'Menunggu') {
            

            if ($waktu == '1 jam') {

                $check_exist_eskalasi = $db->select('tb_report', 'id_report = "' . $id_report . '" AND status_eskalasi = ""', 'id_report', 'DESC');

                

                if (mysqli_num_rows($check_exist_eskalasi) > 0) {
                    $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 1"', 'id_report = "' . $id_report . '"');


                    if ($query) {
                        // select master category
                        $master_category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');
                        $master_category = mysqli_fetch_assoc($master_category);
                        $id_master_category = $master_category['id_master_category'];

                        $data_manager_contractor = $db->select('tb_employee_job', 'id_master_category = "' . $id_master_category . '" AND type = "Manager Kontraktor"', 'id_master_category', 'ASC');

                        while ($result_manager_contractor = mysqli_fetch_assoc($data_manager_contractor)) {
                            $id_manager_contractor = $result_manager_contractor['id_employee'];

                            $manager_contractor = $db->select('tb_employee', 'id_employee = "' . $id_manager_contractor . '"', 'id_employee', 'ASC');

                            $manager_contractor = mysqli_fetch_assoc($manager_contractor);

                            $name_manager = $manager_contractor['name'];
                            $id_manager_contractor = $manager_contractor['id_employee'];

                            $status_process = 'Laporan dieskalasikan tingkat 1 ke manajer kontraktor (' . $name_manager . ')';

                            $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

                            if ($query_process) {
                                $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

                                $title = 'Eskalasi tingkat 1';
                                $body = 'Segera hubungi kepala kontraktor terkait';

                                // kirim notif ke table notification
                                $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 1', $title, $body);

                                $user_token = mysqli_fetch_assoc($user_token);
                                $user_token = $user_token['token'];

                                FirebaseMessaging::sendNotif($user_token, $title, $body);
                            }
                        }
                    }
                }
            } else if ($waktu == '2 jam') {

                if ($status_eskalasi == 'Eskalasi tingkat 1') {
                    $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 2"', 'id_report = "' . $id_report . '"');
                    if ($query) {

                        // select master category
                        $master_category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');
                        $master_category = mysqli_fetch_assoc($master_category);
                        $id_master_category = $master_category['id_master_category'];

                        $data_manager_contractor = $db->select('tb_employee_job', 'id_master_category = "' . $id_master_category . '" AND type="Supervisor / Estate Koordinator"', 'id_employee_job', 'ASC');

                        while ($result_manager_contractor = mysqli_fetch_assoc($data_manager_contractor)) {
                            $id_manager_contractor = $result_manager_contractor['id_employee'];

                            $manager_contractor = $db->select('tb_employee', 'id_employee = "' . $id_manager_contractor . '"', 'id_employee', 'ASC');

                            $manager_contractor = mysqli_fetch_assoc($manager_contractor);

                            $name_manager = $manager_contractor['name'];
                            $id_manager_contractor = $manager_contractor['id_employee'];

                            $status_process = 'Laporan dieskalasikan tingkat 2 ke estate cordinator (' . $name_manager . ')';

                            $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

                            if ($query_process) {
                                $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

                                $user_token = mysqli_fetch_assoc($user_token);

                                $title = 'Eskalasi tingkat 2';

                                $body = 'Segera hubungi manajer kontraktor terkait';

                                $user_token = $user_token['token'];

                                // kirim notif ke table notification
                                $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 2', $title, $body);

                                FirebaseMessaging::sendNotif($user_token, $title, $body);
                            }
                        }
                    }
                }
            } else if ($waktu == '3 jam') {
                if ($status_eskalasi == 'Eskalasi tingkat 2') {
                    $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 3"', 'id_report = "' . $id_report . '"');
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

                            // kirim notif ke table notification
                            $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 3', $title, $body);

                            FirebaseMessaging::sendNotif($user_token, $title, $body);
                        }
                    }
                }
            }
        }
        // else if ($status == 'Diproses') {

        //     $waktu = $db->select('tb_process_report', 'id_report = "' . $id_report . '" AND status_process REGEXP "Laporan Diproses"', 'id_process_report', 'DESC');
        //     $waktu = mysqli_fetch_assoc($waktu);

        //     $waktu = time_elapsed_string($waktu['current_time_process']);

        //     if ($waktu == '1 jam') {

        //         $check_exist_eskalasi = $db->select('tb_report', 'id_report = "' . $id_report . '" AND status_eskalasi = ""', 'id_report', 'DESC');

        //         if (mysqli_num_rows($check_exist_eskalasi) > 0) {
        //             $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 1"', 'id_report = "' . $id_report . '"');
        //             if ($query) {

        //                 $data_manager_contractor = $db->select('tb_manager_contractor_job', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

        //                 while ($result_manager_contractor = mysqli_fetch_assoc($data_manager_contractor)) {
        //                     $id_manager_contractor = $result_manager_contractor['id_manager_contractor'];

        //                     $manager_contractor = $db->select('tb_manager_contractor', 'id_manager_contractor = "' . $id_manager_contractor . '"', 'id_manager_contractor', 'ASC');

        //                     $manager_contractor = mysqli_fetch_assoc($manager_contractor);

        //                     $name_manager = $manager_contractor['name'];
        //                     $id_manager_contractor = $manager_contractor['id_manager_contractor'];

        //                     $status_process = 'Laporan dieskalasikan tingkat 1 ke manajer kontraktor (' . $name_manager . ')';

        //                     $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

        //                     if ($query_process) {
        //                         $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

        //                         $user_token = mysqli_fetch_assoc($user_token);

        //                         $title = 'Eskalasi tingkat 1';

        //                         $body = 'Segera hubungi kepala kontraktor terkait';

        //                         $user_token = $user_token['token'];

        //                         // kirim notif ke table notification
        //                         $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 1', $title, $body);

        //                         FirebaseMessaging::sendNotif($user_token, $title, $body);
        //                     }
        //                 }
        //             }
        //         }
        //     } else if ($waktu == '2 jam') {
        //         if ($status_eskalasi == 'Eskalasi tingkat 1') {
        //             $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 2"', 'id_report = "' . $id_report . '"');
        //             if ($query) {

        //                 $category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

        //                 $category = mysqli_fetch_assoc($category);

        //                 $id_master = $category['id_master_category'];


        //                 $data_manager_contractor = $db->select('tb_estate_cordinator_job', 'id_master_category = "' . $id_master . '"', 'id_master_category', 'ASC');

        //                 while ($result_manager_contractor = mysqli_fetch_assoc($data_manager_contractor)) {
        //                     $id_manager_contractor = $result_manager_contractor['id_estate_cordinator'];

        //                     $manager_contractor = $db->select('tb_estate_cordinator', 'id_estate_cordinator = "' . $id_manager_contractor . '"', 'id_estate_cordinator', 'ASC');

        //                     $manager_contractor = mysqli_fetch_assoc($manager_contractor);

        //                     $name_manager = $manager_contractor['name_estate_cordinator'];
        //                     $id_manager_contractor = $manager_contractor['id_estate_cordinator'];

        //                     $status_process = 'Laporan dieskalasikan tingkat 2 ke estate cordinator (' . $name_manager . ')';

        //                     $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

        //                     if ($query_process) {
        //                         $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

        //                         $user_token = mysqli_fetch_assoc($user_token);

        //                         $title = 'Eskalasi tingkat 2';

        //                         $body = 'Segera hubungi manajer kontraktor terkait';

        //                         $user_token = $user_token['token'];

        //                         // kirim notif ke table notification
        //                         $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 2', $title, $body);

        //                         FirebaseMessaging::sendNotif($user_token, $title, $body);
        //                     }
        //                 }
        //             }
        //         }
        //     } else if ($waktu == '3 jam') {
        //         if ($status_eskalasi == 'Eskalasi tingkat 2') {
        //             $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 3"', 'id_report = "' . $id_report . '"');
        //             if ($query) {

        //                 $estate_manager = $db->select('tb_estate_manager', 'id_estate_manager NOT IN ("") ', 'id_estate_manager', 'ASC');
        //                 $estate_manager = mysqli_fetch_assoc($estate_manager);


        //                 $id_manager_contractor = $estate_manager['id_estate_manager'];
        //                 $name_manager = $estate_manager['name_estate_manager'];

        //                 $status_process = 'Laporan dieskalasikan tingkat 3 ke estate manager (' . $name_manager . ')';

        //                 $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

        //                 if ($query_process) {
        //                     $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

        //                     $user_token = mysqli_fetch_assoc($user_token);

        //                     $title = 'Eskalasi tingkat 3';

        //                     $body = 'Segera hubungi estate cordinator terkait';

        //                     $user_token = $user_token['token'];

        //                     // kirim notif ke table notification
        //                     $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 3', $title, $body);

        //                     FirebaseMessaging::sendNotif($user_token, $title, $body);
        //                 }
        //             }
        //         }
        //     }
        // } else if ($status == 'Diterima') {

        //     $waktu = $db->select('tb_process_report', 'id_report = "' . $id_report . '" AND status_process REGEXP "Laporan Diterima"', 'id_process_report', 'DESC');
        //     $waktu = mysqli_fetch_assoc($waktu);

        //     $waktu = time_elapsed_string($waktu['current_time_process']);

        //     if ($waktu == '1 jam') {

        //         $check_exist_eskalasi = $db->select('tb_report', 'id_report = "' . $id_report . '" AND status_eskalasi = ""', 'id_report', 'DESC');

        //         if (mysqli_num_rows($check_exist_eskalasi) > 0) {
        //             $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 1"', 'id_report = "' . $id_report . '"');
        //             if ($query) {

        //                 $data_manager_contractor = $db->select('tb_manager_contractor_job', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

        //                 while ($result_manager_contractor = mysqli_fetch_assoc($data_manager_contractor)) {
        //                     $id_manager_contractor = $result_manager_contractor['id_manager_contractor'];

        //                     $manager_contractor = $db->select('tb_manager_contractor', 'id_manager_contractor = "' . $id_manager_contractor . '"', 'id_manager_contractor', 'ASC');

        //                     $manager_contractor = mysqli_fetch_assoc($manager_contractor);

        //                     $name_manager = $manager_contractor['name'];
        //                     $id_manager_contractor = $manager_contractor['id_manager_contractor'];

        //                     $status_process = 'Laporan dieskalasikan tingkat 1 ke manajer kontraktor (' . $name_manager . ')';

        //                     $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

        //                     if ($query_process) {
        //                         $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

        //                         $user_token = mysqli_fetch_assoc($user_token);

        //                         $title = 'Eskalasi tingkat 1';

        //                         $body = 'Segera hubungi kepala kontraktor terkait';

        //                         $user_token = $user_token['token'];

        //                         // kirim notif ke table notification
        //                         $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 1', $title, $body);

        //                         FirebaseMessaging::sendNotif($user_token, $title, $body);
        //                     }
        //                 }
        //             }
        //         }
        //     } else if ($waktu == '2 jam') {
        //         if ($status_eskalasi == 'Eskalasi tingkat 1') {
        //             $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 2"', 'id_report = "' . $id_report . '"');
        //             if ($query) {

        //                 $category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

        //                 $category = mysqli_fetch_assoc($category);

        //                 $id_master = $category['id_master_category'];


        //                 $data_manager_contractor = $db->select('tb_estate_cordinator_job', 'id_master_category = "' . $id_master . '"', 'id_master_category', 'ASC');

        //                 while ($result_manager_contractor = mysqli_fetch_assoc($data_manager_contractor)) {
        //                     $id_manager_contractor = $result_manager_contractor['id_estate_cordinator'];

        //                     $manager_contractor = $db->select('tb_estate_cordinator', 'id_estate_cordinator = "' . $id_manager_contractor . '"', 'id_estate_cordinator', 'ASC');

        //                     $manager_contractor = mysqli_fetch_assoc($manager_contractor);

        //                     $name_manager = $manager_contractor['name_estate_cordinator'];
        //                     $id_manager_contractor = $manager_contractor['id_estate_cordinator'];

        //                     $status_process = 'Laporan dieskalasikan tingkat 2 ke estate cordinator (' . $name_manager . ')';

        //                     $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

        //                     if ($query_process) {
        //                         $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

        //                         $user_token = mysqli_fetch_assoc($user_token);

        //                         $title = 'Eskalasi tingkat 2';

        //                         $body = 'Segera hubungi manajer kontraktor terkait';

        //                         $user_token = $user_token['token'];

        //                         // kirim notif ke table notification
        //                         $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 2', $title, $body);

        //                         FirebaseMessaging::sendNotif($user_token, $title, $body);
        //                     }
        //                 }
        //             }
        //         }
        //     } else if ($waktu == '3 jam') {
        //         if ($status_eskalasi == 'Eskalasi tingkat 2') {
        //             $query = $db->update('tb_report', 'status_eskalasi = "Eskalasi tingkat 3"', 'id_report = "' . $id_report . '"');
        //             if ($query) {

        //                 $estate_manager = $db->select('tb_estate_manager', 'id_estate_manager NOT IN ("") ', 'id_estate_manager', 'ASC');
        //                 $estate_manager = mysqli_fetch_assoc($estate_manager);


        //                 $id_manager_contractor = $estate_manager['id_estate_manager'];
        //                 $name_manager = $estate_manager['name_estate_manager'];

        //                 $status_process = 'Laporan dieskalasikan tingkat 3 ke estate manager (' . $name_manager . ')';

        //                 $query_process = $db->insert('tb_process_report', 'id_report = "' . $id_report . '", status_process = "' . $status_process . '"');

        //                 if ($query_process) {
        //                     $user_token = $db->select('tb_user_fcm_token', 'id_user = "' . $id_manager_contractor . '"', 'id_fcm', 'ASC');

        //                     $user_token = mysqli_fetch_assoc($user_token);

        //                     $title = 'Eskalasi tingkat 3';

        //                     $body = 'Segera hubungi estate cordinator terkait';

        //                     $user_token = $user_token['token'];

        //                     // kirim notif ke table notification
        //                     $result_add_notif = AddNotification::saveNotif($id_manager_contractor, $id_manager_contractor, 'ESKALASI TINGKAT 3', $title, $body);

        //                     FirebaseMessaging::sendNotif($user_token, $title, $body);
        //                 }
        //             }
        //         }
        //     }
        // }
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
