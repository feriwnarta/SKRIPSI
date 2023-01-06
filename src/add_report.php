<?php
require_once("../file/function_proses.php");
$db = new db();
date_default_timezone_set('asia/jakarta');

if (!empty($_FILES['image']) && !empty($_POST['id_user']) && !empty($_POST['description']) && !empty($_POST['additional_location']) && !empty($_POST['feedback']) && !empty($_POST['category']) && !empty($_POST['status'])) {
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
  	$image_location = '../imagereport/'.bin2hex($bytes).".$file_extension";
  	move_uploaded_file($tmp_name, $image_location);

  	$id_user = mysqli_real_escape_string($db->query,$_POST['id_user']);
  	$description = mysqli_real_escape_string($db->query,$_POST['description']);
  	$additional_location = mysqli_real_escape_string($db->query,$_POST['additional_location']);
  	$feedback = mysqli_real_escape_string($db->query,$_POST['feedback']);
  	$category = mysqli_real_escape_string($db->query,$_POST['category']);
    $id_category = mysqli_real_escape_string($db->query,$_POST['id_category']);
  	$status = mysqli_real_escape_string($db->query,$_POST['status']);

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


  	$query=$db->insert('tb_report','url_image="'.$ubah.'",id_user="'.$id_user.'",description="'.$description.'",additional_location="'.$additional_location.'",feedback="'.$feedback.'",category="'.$category.'",status="'.$status.'",date_post="'.$date_post.'",time_post="'.$time_post.'",no_ticket="'.$noTicket.'",urut="'.$urut.'",id_category="'.$id_category.'"');

	echo json_encode('success');
	// var_dump($date_post);
  	} else {
    	echo json_encode("Invalid file type");
  	}
}

?>

