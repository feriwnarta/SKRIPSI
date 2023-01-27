<?php
require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (!empty($obj['id_user']) && !empty($obj['status'])) {
    // $this_month = date("m", strtotime(date('Y-m-d H:i:s'))); 
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $this_year_month = '2022-09';

    // cek absen
    $pointer_day = 0;
    $total_hadir = 0;
    $total_absen = 0;

    if ($obj['status'] == 'cordinator') {
        $data_cordinator = $db->select('tb_employee_attendance_cordinator', 'id_cordinator="' . $id_user . '" AND sign_in LIKE"' . $this_year_month . '_______%"', 'id_absen', 'ASC');
        if (mysqli_num_rows($data_cordinator) > 0) {
            while ($data = mysqli_fetch_assoc($data_cordinator)) {
                $first_absen = date('Y-m-d', strtotime($data['sign_in']));
                $first_absen = explode('-', $first_absen);

                if ($pointer_day != 0) {
                    $pointer_day = intval($pointer_day);
                    $pointer_day++;
                    // tidak hadir
                    if ($pointer_day != $first_absen[2]) {
                        $total_absen++;
                    }
                }

                $total_hadir++;
                $pointer_day = $first_absen[2];
                $max_day = date('t');
            }
            echo json_encode(
                array(
                    'total_hadir' => $total_hadir,
                    'total_absen' => $total_absen
                ),
                JSON_PRETTY_PRINT
            );
        } else {
            echo json_encode(array(
                'message' => 'tidak ada absen'
                ));
        }
    }

    if ($obj['status'] == 'contractor') {
        $data_contractor = $db->select('tb_employee_attendance_contractor', 'id_contractor="' . $id_user . '" AND sign_in LIKE "' . $this_year_month . '_______%"', 'id_absen', 'ASC');
        if (mysqli_num_rows($data_contractor) > 0) {
            while ($data = mysqli_fetch_assoc($data_contractor)) {
                $first_absen = date('Y-m-d', strtotime($data['sign_in']));
                $first_absen = explode('-', $first_absen);

                if ($pointer_day != 0) {
                    $pointer_day = intval($pointer_day);
                    $pointer_day++;
                    // tidak hadir
                    if ($pointer_day != $first_absen[2]) {
                        $total_absen++;
                    }
                }

                $total_hadir++;
                $pointer_day = $first_absen[2];
                $max_day = date('t');
            }
            echo json_encode(
                array(
                    'total_hadir' => $total_hadir,
                    'total_absen' => $total_absen
                ),
                JSON_PRETTY_PRINT
            );
        } else {
           echo json_encode(array(
                'message' => 'tidak ada absen'
                ));
        }
    }
}
