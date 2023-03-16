<?php
require_once("../../file/function_proses.php");
$db = new db();

if(!empty($_FILES['gambar_berita']) && !empty($_POST['caption']) && !empty($_POST['content']) && !empty($_POST['id_writer'])) {
	$caption = mysqli_real_escape_string($db->query,$_POST['caption']);
	$content = mysqli_real_escape_string($db->query,$_POST['content']);
	$writer = mysqli_real_escape_string($db->query,$_POST['id_writer']);


    // cek writter
    $dataWriter = $db->select('tb_user', 'id_user = "' . $writer . '"', 'id_user', 'ASC');

    if(mysqli_num_rows($dataWriter) > 0) {
        $dataWriter = mysqli_fetch_assoc($dataWriter);

        $usernameWriter = $dataWriter['name'];

    } else {
        $usernameWriter = '';
    }


	$image = $_FILES['gambar_berita']['name'];
	$valid_ext = array('png','jpeg','jpg');
	$tmp_name = $_FILES['gambar_berita']['tmp_name'];
	// file extension
  	$file_extension = pathinfo($_FILES['gambar_berita']['name'], PATHINFO_EXTENSION);
  	$file_extension = strtolower($file_extension);
  	if(in_array($file_extension,$valid_ext)){
  		$bytes = random_bytes(20);
  		$image_location = '../../imagenews/'.bin2hex($bytes).".$file_extension";
  		move_uploaded_file($tmp_name, $image_location);
  		$ubah=str_replace("../", "", $image_location);
  		$rs = $db->insert('tb_informasi_umum', 'url_news_image="'.$ubah.'",caption="'.$caption.'",content="'.$content.'",writer="'.$usernameWriter.'"');

  		if($rs) {
  			echo json_encode('OK');
  		} else {
			echo json_encode('FAILL');
  		}
  	}
}