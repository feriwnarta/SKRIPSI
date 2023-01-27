<?php
require_once("../../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (!empty($obj['username']) && !empty($obj['token'])) {
    $token = mysqli_real_escape_string($db->query, $obj['token']);

    $result = $db->select('tb_estate_cordinator', 'username="' . $obj['username'] . '"', 'id_estate_cordinator', 'DESC');
    if (mysqli_num_rows($result) > 0) {
        $result = mysqli_fetch_assoc($result);
        $id_estate_cordinator = $result['id_estate_cordinator'];
        // cek apakah sudah ada token sebelumnya, jika ada update token
        $cek = $db->select('tb_cordinator_fcm_token', 'id_estate_cordinator="' . $id_estate_cordinator . '"', 'id_token', 'ASC');
        if (mysqli_num_rows($cek) > 0) {
            // update token
            $rs = $db->update('tb_cordinator_fcm_token', 'token="' . $token . '"', 'id_estate_cordinator="' . $id_estate_cordinator . '"');
            if ($rs) {
                echo json_encode('success');
            } else {
                echo json_encode('failed');
            }
        } else {
            // insert ke table cordinator token
            $rs = $db->insert('tb_cordinator_fcm_token', 'id_estate_cordinator="' . $id_estate_cordinator . '", token="' . $token . '"');
            if ($rs) {
                echo json_encode('success');
            } else {
                echo json_encode('failed');
            }
        }
    }
}
