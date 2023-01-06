<?php
require_once("../../file/function_proses.php");
require_once("../send-notif/firebase_messaging.php");

$db = new db();
date_default_timezone_set('asia/jakarta');

if (!empty($_FILES['image']['name']) && !empty($_POST['id_user']) && !empty($_POST['category']) && !empty($_POST['status']) && !empty($_POST['latitude']) && !empty($_POST['longitude']) && !empty($_POST['address']) && !empty($_POST['type']) ) {
	$image = $_FILES['image']['name'];
	$date_post = date('Y-m-d');
	$time_post = (new DateTime(date('Y/m/d H:i:s')))->format("H:i:s");
	$tmp_name = $_FILES['image']['tmp_name'];
	$valid_ext = array('png','jpeg','jpg');
	  // file extension
  	$file_extension = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
  	$file_extension = strtolower($file_extension);
  	// Check extension
  	if(in_array($file_extension,$valid_ext)){
  	$bytes = random_bytes(20);
  	$image_location = '../../imagereport/'.bin2hex($bytes).".$file_extension";
  	move_uploaded_file($tmp_name, $image_location);

  	$id_user = mysqli_real_escape_string($db->query,$_POST['id_user']);
  	$description = mysqli_real_escape_string($db->query,$_POST['description']);
  	$category = mysqli_real_escape_string($db->query,$_POST['category']);
  	$status = mysqli_real_escape_string($db->query,$_POST['status']);
    $id_category = mysqli_real_escape_string($db->query,$_POST['id_category']);
    $latitude = mysqli_real_escape_string($db->query,$_POST['latitude']);
    $longitude = mysqli_real_escape_string($db->query,$_POST['longitude']);
    $address = mysqli_real_escape_string($db->query,$_POST['address']);
    // $id_category_detail = mysqli_real_escape_string($db->query,$_POST['id_category_detail']);
    $id_klasifikasi_category = explode(',', mysqli_real_escape_string($db->query, $_POST['id_klasifikasi_category']), -1);
    $type = mysqli_real_escape_string($db->query,$_POST['type']);

  	$ubah=str_replace("../", "", $image_location);

  	// generate no ticket
  	$bulan = date('Ym');
  	$bulan_valid = date('Y-m');
  	$akhir = $db->select('tb_report', 'date_post LIKE"'.$bulan_valid.'%"','urut','DESC');

  	// $total =  mysqli_num_rows($akhir);
  	// $total++;

  	$postfix_ticket = mysqli_num_rows($akhir);

    if($postfix_ticket> 0) {
    	$a=mysqli_fetch_assoc($akhir);
    	$urut=$a['urut']+1;
    	$cek_jum=strlen($urut);

    	$tampung="";
    	if($cek_jum<5){
	    	for ($i=$cek_jum; $i < 5; $i++) { 
	    		$tampung=$tampung.'0';
	    	}
	    	$tampung=$tampung.$urut;
	    }else{
	    	$tampung=$urut;
	    }

    	$noTicket = $bulan.'/'.$tampung;
    	
    }else{
    	$urut=1;
    	$noTicket = $bulan.'/00001';
    	
    }

  	$result=$db->insert('tb_report','url_image="'.$ubah.'",id_user="'.$id_user.'",description="'.$description.'",category="'.$category.'",status="'.$status.'",date_post="'.$date_post.'",time_post="'.$time_post.'",no_ticket="'.$noTicket.'",urut="'.$urut.'",id_category="'.$id_category.'",latitude="'.$latitude.'",longitude="'.$longitude.'",address="'.$address.'",type="'.$type.'"');

    if($id_category=='1'){
    	$laporan = 'Laporan diteruskan ke bagian Perawatan taman dan kebersihan';
    }else if($id_category=='2'){
      	$laporan = 'Laporan diteruskan ke bagian Perawatan taman dan kebersihan';
    }else if($id_category=='3'){
      	$laporan = 'Laporan diteruskan ke bagian Perawatan taman dan kebersihan';
    }else if($id_category=='4'){
      	$laporan = 'Laporan diteruskan ke bagian Building controll';
    }else if($id_category=='5'){
      	$laporan = 'Laporan diteruskan ke bagian Club house';
    }else if($id_category=='6'){
      	$laporan = 'Laporan diteruskan ke bagian Kolam Renang';
    }else{
      	$laporan = 'Kategori tidak ditemukan';
    }

	// select cordinator dgn category 1
	$tb_category = $db->select('tb_category', 'id_category="'.$id_category.'"', 'id_category', 'ASC');
	$id_master_category = mysqli_fetch_assoc($tb_category)['id_master_category'];
	$data_estate_cordinator = $db->select('tb_estate_cordinator_job', 'id_master_category="'.$id_master_category.'"', 'id_estate_cordinator_job', 'ASC');
    // 	$id_estate_cordinator = mysqli_fetch_assoc($id_estate_cordinator)['id_estate_cordinator'];
	
	if(mysqli_num_rows($data_estate_cordinator) > 0) {
	    while($rs = mysqli_fetch_assoc($data_estate_cordinator)) {
    	    $id_estate_cordinator = $rs['id_estate_cordinator'];
    	    // select token berdasarkan id cordinator yang diambil
        	$toket = $db->select('tb_cordinator_fcm_token', 'id_estate_cordinator="'.$id_estate_cordinator.'"', 'id_token', 'ASC');
        	$toket = mysqli_fetch_assoc($toket)['token'];
        	$title = 'Complaint Baru';
        	$body = 'Anda Menerima laporan baru, segera proses laporan sekarang';
        	
        	// kirim notif ke yang bersangkutan
        	FirebaseMessaging::sendNotif($toket, $title, $body);
	    }   
	}
	

    $select_data=$db->select('tb_report','url_image="'.$ubah.'"','id_report','DESC');
    $sd=mysqli_fetch_assoc($select_data);

    $db->insert('tb_process_report','id_report="'.$sd['id_report'].'",id_user="'.$id_user.'",status_process="'.$laporan.'"');

    foreach ($id_klasifikasi_category as $key) {
      $db->insert('tb_detail_klasifikasi_category', 'id_report="'.$sd['id_report'].'",id_klasifikasi="'.$key.'"');
    }

    if($result) {
      echo json_encode('success');
    }
	
  	} else {
    	echo json_encode("Invalid file type");
  	}
}
