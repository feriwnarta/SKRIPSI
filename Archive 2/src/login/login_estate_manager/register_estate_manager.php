<?php
require_once("../../../file/function_proses.php");
require_once("../../../file/function_proses.php");
require_once("../../utils/Uuid.php");
$db = new db();


if (!empty($_POST['name_estate_manager']) && !empty($_POST['username']) && !empty($_POST['password']) && isset($_POST['email']) && isset($_POST['no_telp'])) {
    $unique_id = UUID::guidv4();

    $name_estate_manager = mysqli_real_escape_string($db->query, $_POST['name_estate_manager']);
    $username = mysqli_real_escape_string($db->query, $_POST['username']);
    $password = mysqli_real_escape_string($db->query, $_POST['password']);
    $email = mysqli_real_escape_string($db->query, $_POST['email']);
    $no_telp = mysqli_real_escape_string($db->query, $_POST['no_telp']);


    $ubah1 = str_replace("=", "", base64_encode($password));
    $pengacak = "Bl4ck3rH4ck3r3ncR1pt";
    $ubah2 = md5($pengacak . md5($ubah1) . $pengacak);
    $hasil_password = md5($pengacak . md5($ubah2) . $pengacak);

    if (isset($_FILES['foto_profile'])) {
        $tmp_name = $_FILES['foto_profile']['tmp_name'];
        $valid_ext = array('png', 'jpeg', 'jpg');
        // file extension
        $file_extension = pathinfo($_FILES['foto_profile']['name'], PATHINFO_EXTENSION);

        $file_extension = strtolower($file_extension);

        if (in_array($file_extension, $valid_ext)) {
            $bytes = random_bytes(20);
            // $loc = $_SERVER['SERVER_NAME'];
            $loc = '../../../imageuser/';
            $image_location = $loc . bin2hex($bytes) . ".$file_extension";
            move_uploaded_file($tmp_name, $image_location);
            $ubah = str_replace("../", "", $image_location);
        }
    } else {
        $ubah = 'imageuser/default_profile/blank_profile_picture.jpg';
    }


    $exist_user = $db->select('tb_user', 'username = "' . $username . '"', 'id_user', 'ASC');

    if (!mysqli_num_rows($exist_user) > 0) {

        if (!mysqli_num_rows($db->select('tb_user', 'email = "' . $email . '"', 'id_user', 'ASC')) > 0) {

            if (!mysqli_num_rows($db->select('tb_user', 'no_telp = "' . $no_telp . '"', 'id_user', 'ASC')) > 0) {
                $result = $db->insert('tb_estate_manager', 'id_estate_manager = "' . $unique_id . '", name_estate_manager = "' . $name_estate_manager . '", email = "' . $email . '", no_telp = "' . $no_telp . '"');

                $result_user = $db->insert('tb_user', 'id_user = "' . $unique_id . '", username = "' . $username . '", email = "' . $email . '", no_telp = "' . $no_telp . '", name="' . $name_estate_manager . '", password = "' . $hasil_password . '", profile_image = "' . $ubah . '"');

                if ($result_user) {
                    // insert akses
                    $data_auth = $db->select('tb_authorization', 'status = "estatemanager"', 'id_auth', 'ASC');
                    if (mysqli_num_rows($data_auth) > 0) {
                        $data_auth = mysqli_fetch_assoc($data_auth);
                        $update = $db->update('tb_user', 'id_auth = "' . $data_auth['id_auth'] . '"', 'id_user = "' . $unique_id . '"');

                        if ($update) {
                            echo json_encode('register successfull', JSON_PRETTY_PRINT);
                        } else {
                            echo json_encode('register failed', JSON_PRETTY_PRINT);
                        }

                    } else {
                        echo json_encode('gagal mengambil id access');
                    }
                } else {
                    echo json_encode('gagal menyimpan');
                }
            } else {
                echo json_encode('no telpon sudah ada');
            }
        } else {
            echo json_encode('email sudah ada');
        }
    } else {
        echo json_encode('username sudah ada');
    }
}
