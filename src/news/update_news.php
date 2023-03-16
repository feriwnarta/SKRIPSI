<?php

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (!empty($_POST['id_writer']) && isset($_POST['id_news']) && isset($_POST['caption'])  && isset($_POST['content'])) {
    $idWriter = $_POST['id_writer'];
    $id = $_POST['id_news'];
    $caption = $_POST['caption'];
    $content = $_POST['content'];


    $dataUser = $db->select('tb_user', 'id_user = "' . $idWriter . '"', 'id_user', 'DESC');

    if(mysqli_num_rows($dataUser) > 0){
        $dataUser = mysqli_fetch_assoc($dataUser);

        $dataUser = $dataUser['name'];

    } else {
        $dataUser = '';
    }

    $thisTime = date('Y-m-d H:i:s');
    if(isset($_FILES['image'])) {
        $image = $_FILES['image']['name'];
        $valid_ext = array('png','jpeg','jpg');
        $tmp_name = $_FILES['image']['tmp_name'];
        // file extension
        $file_extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $file_extension = strtolower($file_extension);
        if(in_array($file_extension,$valid_ext)){
            $bytes = random_bytes(20);
            $image_location = '../../imagenews/'.bin2hex($bytes).".$file_extension";
            move_uploaded_file($tmp_name, $image_location);

            $ubah=str_replace("../", "", $image_location);

        }
    } else {
        $ubah = $_POST['image'];
    }

    // query update

    $result = $db->update('tb_news', 'url_news_image = "' . $ubah . '", caption = "' . $caption . '", content = "' . $content . '", update_by = "' . $dataUser . '", update_at = "' . $thisTime . '"', 'id_news = "' . $id . '"');




    if($result) {
        echo json_encode('OK');
    } else {
        echo json_encode('FAIL');
    }



}
