<?php
require_once("../../file/function_proses.php");
$db = new db();
date_default_timezone_set('asia/jakarta');



if (!empty($_POST['id_user']) & !empty($_POST['status']) && !empty($_POST['jam']) && !empty($_POST['lokasi']) && !empty($_FILES['image']['name'])) {

    /**
     * jika status cordinator, maka akan absen khusus cordinator
     */
    $image = $_FILES['image']['name'];
    $tmp_name = $_FILES['image']['tmp_name'];
    $valid_ext = array('png', 'jpeg', 'jpg');
    // file extension
    $file_extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
    $file_extension = strtolower($file_extension);
    // Check extension
    if (in_array($file_extension, $valid_ext)) {
        $bytes = random_bytes(20);
        $image_location = '../../imageabsen/' . bin2hex($bytes) . ".$file_extension";
        move_uploaded_file($tmp_name, $image_location);
        $ubah = str_replace("../", "", $image_location);

        // cordinator
        if ($_POST['status'] == 'cordinator') {
            $id_user = $_POST['id_user'];
            $data_cordinator = $db->select('tb_estate_cordinator', 'id_estate_cordinator="' . $id_user . '"', 'id_estate_cordinator', 'DESC');
            // cek apakah ada id user di tb cordinator
            if (mysqli_num_rows($data_cordinator) > 0) {
                $time_now = date('Y-m-d');
                // cek periode, menetukan absen masuk atau absen pulang
                $rs = $db->select('tb_employee_attendance_cordinator', 'sign_in LIKE "%' . $time_now . '%" AND id_cordinator="' . $id_user . '"', 'id_absen', 'DESC');

                // jika berarti hari ini udah absen
                if (mysqli_num_rows($rs) > 0) {
                    $result_absen = mysqli_fetch_assoc($rs);
                    if ($result_absen['sign_out'] == '0000-00-00 00:00:00') {
                        $jam_masuk = $result_absen['sign_in'];
                        $dt = new DateTime($jam_masuk);
                        $dt2 = new DateTime($_POST['jam']);
                        $time_masuk = $dt->format('H:i');
                        $time_pulang = $dt2->format('H:i');
                        $result = $db->update('tb_employee_attendance_cordinator', 'sign_out="' . $_POST['jam'] . '", location_now_out="' . $_POST['lokasi'] . '", picture_proof_out="' . $ubah . '"', 'id_absen="' . $result_absen['id_absen'] . '"');
                        if ($result) {
                            echo json_encode(array(
                                'status' => 'SUCCESS PULANG',
                                'jam_pulang' => $time_pulang,
                                'jam_masuk' => $time_masuk
                            ));
                        } else {
                            echo json_encode(array(
                                'status' => 'FAILED PULANG',
                                'jam_pulang' => $time_pulang
                            ));
                        }
                    } else {
                        echo json_encode(array(
                            'status' => 'SUDAH PULANG',
                        ));
                    }
                } else {
                    $result = $db->insert('tb_employee_attendance_cordinator', 'id_cordinator="' . $id_user . '", sign_in="' . $_POST['jam'] . '", location_now_in="' . $_POST['lokasi'] . '", picture_proof_in="' . $ubah . '"');
                    if ($result) {
                        echo json_encode(array(
                            'status' => 'SUCCESS MASUK',
                            'jam' => $_POST['jam']
                        ));
                    } else {
                        echo json_encode(array(
                            'status' => 'FAILED MASUK',
                            'jam' => $_POST['jam']
                        ));
                    }
                }
            } else {
                echo json_encode("data tidak ditemukan");
            }
        }
        // contractor
        else {
            $id_contractor = $_POST['id_user'];
            $data_contractor = $db->select('tb_contractor', 'id_contractor="' . $id_contractor . '"', 'id_contractor', 'DESC');
            // cek apakah ada id user di tb cordinator
            if (mysqli_num_rows($data_contractor) > 0) {
                $time_now = date('Y-m-d');
                // cek periode, menetukan absen masuk atau absen pulang
                $rs = $db->select('tb_employee_attendance_contractor', 'sign_in LIKE "%' . $time_now . '%" AND id_contractor="' . $id_contractor . '"', 'id_absen', 'DESC');
                if (mysqli_num_rows($rs) > 0) {
                    $result_absen = mysqli_fetch_assoc($rs);
                    if ($result_absen['sign_out'] == '0000-00-00 00:00:00') {
                        $jam_masuk = $result_absen['sign_in'];
                        $jam_masuk = $result_absen['sign_in'];
                        $dt = new DateTime($jam_masuk);
                        $dt2 = new DateTime($_POST['jam']);
                        $time_masuk = $dt->format('H:i');
                        $time_pulang = $dt2->format('H:i');
                        $result = $db->update('tb_employee_attendance_contractor', 'sign_out="' . $_POST['jam'] . '", location_now_out="' . $_POST['lokasi'] . '", picture_proof_out="' . $ubah . '"', 'id_absen="' . $result_absen['id_absen'] . '"');
                        if ($result) {
                            echo json_encode(array(
                                'status' => 'SUCCESS PULANG',
                                'jam_pulang' => $time_pulang,
                                'jam_masuk' => $time_masuk
                            ));
                        } else {
                            echo json_encode(array(
                                'status' => 'FAILED PULANG',
                                'jam_pulang' => $time_pulang
                            ));
                        }
                    } else {
                        echo json_encode(array(
                            'status' => 'SUDAH PULANG',
                        ));
                    }
                } else {
                    $result = $db->insert('tb_employee_attendance_contractor', 'id_contractor="' . $id_contractor . '", sign_in="' . $_POST['jam'] . '", location_now_in="' . $_POST['lokasi'] . '", picture_proof_in="' . $ubah . '"');
                    if ($result) {
                        echo json_encode(array(
                            'status' => 'SUCCESS MASUK',
                            'jam' => $_POST['jam']
                        ));
                    } else {
                        echo json_encode(array(
                            'status' => 'FAILED MASUK',
                            'jam' => $_POST['jam']
                        ));
                    }
                }
            } else {
                echo json_encode('FAILED');
            }
        }
    }
}
