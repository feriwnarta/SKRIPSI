<?php
require_once('../../file/function_proses.php');
require_once('../utils/Uuid.php');
$db = new db();

if (isset($_POST['name']) && isset($_POST['id_position']) && isset($_POST['division']) && isset($_POST['job']) && isset($_POST['username']) && isset($_POST['email']) && isset($_POST['notelp']) && isset($_POST['password'])) {
    $name = mysqli_real_escape_string($db->query, $_POST['name']);
    $username = mysqli_real_escape_string($db->query, $_POST['username']);
    $email = mysqli_real_escape_string($db->query, $_POST['email']);
    $notelp = mysqli_real_escape_string($db->query, $_POST['notelp']);
    $password = mysqli_real_escape_string($db->query, $_POST['password']);
    $id_position = mysqli_real_escape_string($db->query, $_POST['id_position']);
    $division = mysqli_real_escape_string($db->query, $_POST['division']);
    // $id_pic = mysqli_real_escape_string($db->query, $_POST['id_pic']);
    $job = mysqli_real_escape_string($db->query, $_POST['job']);


    /**
     * password hashing
     */
    $ubah1 = str_replace("=", "", base64_encode($password));
    $pengacak = "Bl4ck3rH4ck3r3ncR1pt";
    $ubah2 = md5($pengacak . md5($ubah1) . $pengacak);
    $hasil_password = md5($pengacak . md5($ubah2) . $pengacak);

    /**
     * image profile user
     */

    if (isset($_FILES['foto_profile'])) {
        $tmp_name = $_FILES['foto_profile']['tmp_name'];
        $valid_ext = array('png', 'jpeg', 'jpg');
        // file extension
        $file_extension = pathinfo($_FILES['foto_profile']['name'], PATHINFO_EXTENSION);

        $file_extension = strtolower($file_extension);

        if (in_array($file_extension, $valid_ext)) {
            $bytes = random_bytes(20);
            // $loc = $_SERVER['SERVER_NAME'];
            $loc = '../../imageuser/';
            $image_location = $loc . bin2hex($bytes) . ".$file_extension";
            move_uploaded_file($tmp_name, $image_location);
            $ubah = str_replace("../", "", $image_location);
        }
    } else {
        $ubah = 'imageuser/default_profile/blank_profile_picture.jpg';
    }

    /**
     * cek username, email dan nomor telpon terlebih dahulu untuk memastikan belum terdaftar
     * insert data ke table user
     */

    $exist_user = $db->select('tb_user', 'username = "' . $username . '"', 'id_user', 'ASC');

    if (!mysqli_num_rows($exist_user) > 0) {
        // cek email exist
        if (!mysqli_num_rows($db->select('tb_user', 'email = "' . $email . '"', 'id_user', 'ASC')) > 0) {
            // cek no telpon
            if (!mysqli_num_rows($db->select('tb_user', 'no_telp = "' . $notelp . '"', 'id_user', 'ASC')) > 0) {
                /**
                 * inser data ke table user
                 */
                $id_employe = UUID::guidv4();
                $result_user = $db->insert('tb_user', 'id_user = "' . $id_employe . '", username = "' . $username . '", email = "' . $email . '", no_telp = "' . $notelp . '", name="' . $name . '", password = "' . $hasil_password . '", profile_image = "' . $ubah . '"');

                // jika query insert ke table user berhasil
                if ($result_user) {
                    $data_division = $db->select('tb_division', 'divisi = "' . $division . '"', 'id_division', 'DESC');

                    if (mysqli_num_rows($data_division) > 0) {
                        $data_division = mysqli_fetch_assoc($data_division);
                        $id_division = $data_division['id_division'];

                        // insert data employee
                        $data_employee = $db->insert('tb_employee', 'id_employee = "' . $id_employe . '", name = "' . $name . '", id_position = "' . $id_position . '", id_division = "' . $id_division . '", email = "' . $email . '", no_telp = "' . $notelp . '"');
                    } else {
                        echo json_encode('division not found');
                        die();
                    }

                    if ($data_employee) {
                        // cek posisi
                        $data_position = $db->select('tb_position', 'id_position = "' . $id_position . '"', 'id_position', 'ASC');

                        if (mysqli_num_rows($data_position) > 0) {
                            $data_position = mysqli_fetch_assoc($data_position);
                            $position = $data_position['position'];


                            if ($position == 'Supervisor / Estate Koordinator') {
                                $status = 'SUPERVISOR / ESTATE KOORDINATOR';
                            } else if ($position == 'Teknisi') {
                                $status = 'TEKNISI';
                            } else if ($position == 'Danru') {
                                $status = 'DANRU';
                            } else if ($position == 'Mandor / Kepala Kontraktor') {
                                $status = 'MANDOR / KEPALA KONTRAKTOR';
                            } else if ($position == 'Manager Kontraktor') {
                                $status = 'MANAGER KONTRAKTOR';
                            }

                            // insert akses
                            $data_auth = $db->select('tb_authorization', 'status = "' . $status . '"', 'id_auth', 'ASC');
                            $data_auth = mysqli_fetch_assoc($data_auth);
                            $update = $db->update('tb_user', 'id_auth = "' . $data_auth['id_auth'] . '"', 'id_user = "' . $id_employe . '"');

                            // insert notification

                            $unique_id_notification = UUID::guidv4();
                            $result_notification =  $db->insert('tb_settings_notification', 'id_notification = "' . $unique_id_notification . '", id_user = "' . $id_employe . '"');


                            // insert job employee 
                            $id_job = UUID::guidv4();
                            $data_job = $db->insert('tb_employee_job', 'id_employee_job = "' . $id_job . '", id_employee = "' . $id_employe . '", type = "' . $position . '", id_master_category = "' . $job . '"');

                            // update job employee
                            $update_employee = $db->update('tb_employee', 'id_job = "' . $id_job . '"', 'id_employee = "' . $id_employe . '"');



                            if ($data_job && $update_employee) {
                                echo json_encode('success', JSON_PRETTY_PRINT);
                            } else {
                                echo json_encode('failed', JSON_PRETTY_PRINT);
                            }
                        }
                    } else {
                    }
                } else {
                    echo json_encode('insert user failed');
                }
            } else {
                echo json_encode('no_telpon exist', JSON_PRETTY_PRINT);
            }
        } else {
            echo json_encode('email exist', JSON_PRETTY_PRINT);
        }
    } else {
        echo json_encode('user exist');
    }
}
