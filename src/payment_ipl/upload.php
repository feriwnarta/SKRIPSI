<?php
require_once("../../file/function_proses.php");
require_once("../utils/Uuid.php");
date_default_timezone_set('asia/jakarta');
$db = new db();

if (isset($_FILES['img_ipl']['name']) && isset($_POST['id_user']) && isset($_POST['address']) && isset($_POST['latitude']) && isset($_POST['longitude'])) {
    $imageIpl = $_FILES['img_ipl']['name'];
    $idUser = $_POST['id_user'];
    $address = $_POST['address'];
    $latitude = $_POST['latitude'];
    $longitude = $_POST['longitude'];

    $image = null;

    $tmp_name = $_FILES['img_ipl']['tmp_name'];
    $valid_ext = array('png', 'jpeg', 'jpg');
    // file extension
    $file_extension = pathinfo($imageIpl, PATHINFO_EXTENSION);
    $file_extension = strtolower($file_extension);

    if (in_array($file_extension, $valid_ext)) {
        $bytes = random_bytes(20);
        $image = bin2hex($bytes) . ".$file_extension";
        $image_location = '../../ipl_proof/' . $image;
        move_uploaded_file($tmp_name, $image_location);
    }

    $id = UUID::guidv4();
    $periode = date('Y-m');

    // query cek sudah ada data dengan periode yang sama atau belum
    $result = $db->select('tb_upload_ipl', 'id_user = "' . $idUser . '" AND periode = "' . $periode  . '" AND status NOT IN ("Ditolak")', 'create_at', 'ASC');

    if ($result != null && mysqli_num_rows($result) > 0) {
        echo json_encode('bukti pembayaran sudah terupload');
        return;
    }


    $resultSavePayIpl = $db->insert('tb_upload_ipl', 'id = "' . $id . '", id_user = "' . $idUser . '", image = "ipl_proof/' . $image . '", periode = "' . $periode . '", address = "' . $address . '", latitude = "' . $latitude . '", longitude = "' . $longitude . '"');

    if (!$resultSavePayIpl) {
        echo json_encode('gagal simpan data');
        return;
    }

    echo json_encode('berhasil simpan data');
}
