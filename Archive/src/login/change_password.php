<?php
require_once("../../file/function_proses.php");
$db = new db();

$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['id_user']) && isset($obj['current_password']) && isset($obj['new_password'])) {
    $id_user = mysqli_real_escape_string($db->query, ($obj['id_user']));
    $current_password = mysqli_real_escape_string($db->query, ($obj['current_password']));
    $new_password = mysqli_real_escape_string($db->query, ($obj['new_password']));

    $ubah1 = str_replace("=", "", base64_encode($obj['current_password']));
    $pengacak = "Bl4ck3rH4ck3r3ncR1pt";
    $ubah1 = md5($pengacak . md5($ubah1) . $pengacak);
    $hasil_password = md5($pengacak . md5($ubah1) . $pengacak);

    $ubah2 = str_replace("=", "", base64_encode($obj['new_password']));
    $pengacak2 = "Bl4ck3rH4ck3r3ncR1pt";
    $ubah2 = md5($pengacak2 . md5($ubah2) . $pengacak2);
    $hasil_password2 = md5($pengacak2 . md5($ubah2) . $pengacak2);

    $data_user = $db->select('tb_user', 'id_user = "' . $id_user . '"', 'id_user', 'ASC');

    if (mysqli_num_rows($data_user) > 0) {
        $data_user = mysqli_fetch_assoc($data_user);

        // cek password

        $cek_password = $db->select('tb_user', 'id_user = "' . $data_user['id_user'] . '" AND password = "' . $hasil_password . '"', 'id_user', 'ASC');

        if (mysqli_num_rows($cek_password) > 0) {
            if ($db->update('tb_user', 'password = "' . $hasil_password2 . '"', 'id_user = "' . $data_user['id_user'] . '"')) {
                echo json_encode('SUCCESS CHANGE');
            } else {
                echo json_encode('FAILED CHANGE');
            }
        } else {
            echo json_encode('CURRENT WRONG PASSWORD');
        }
    } else {
        echo json_encode('USER NOT FOUND');
    }
}
