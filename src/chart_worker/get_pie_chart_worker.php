<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');


if (isset($obj['id_user']) && isset($obj['type_worker'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $type_worker = mysqli_real_escape_string($db->query, $obj['type_worker']);

    // if ($type_worker == 'cordinator') {
    $id_cordinator = $id_user;
    $id_master_category = $db->select('tb_estate_cordinator_job', 'id_estate_cordinator="' . $id_cordinator . '"', 'id_estate_cordinator', 'ASC');
    $id_master_category = mysqli_fetch_assoc($id_master_category);
    $id_master_category = $id_master_category['id_master_category'];

    // query dapatkan unit pekerjaan dari cordinator
    $unit = $db->select('tb_master_category', 'id_master_category="' . $id_master_category . '"', 'id_master_category', 'ASC');
    $unit = mysqli_fetch_assoc($unit);
    $unit = $unit['unit'];

    $category = $db->select('tb_category', 'id_master_category="' . $id_master_category . '"', 'id_category', 'ASC');

    $id_category = array();
    while ($data = mysqli_fetch_assoc($category)) {
        $id_category[] = $data['id_category'];
    }

    // hari ini
    $hri_ini = date('Y-m-d H:i:s');
    // hari kemarin
    $hri_kemarin = date('Y-m-d H:i:s', strtotime('-24 hour'));

    // query total laporan
    $total_laporan = 0;
    $laporan_belum_dikerjakan = 0;
    $laporan_sedang_dikerjakan = 0;
    $laporan_selesai = 0;
    foreach ($id_category as $key => $value) {

        $total = $db->count('tb_report', 'id_category="' . $value . '" AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report');
        $total = mysqli_fetch_assoc($total);
        $total_laporan += $total['count'];

        $laporan_blm_dikerjakan = $db->select('tb_report', 'id_category="' . $value . '" AND status IN("listed", "noticed") AND CONCAT(date_post , " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
        $laporan_blm_dikerjakan = mysqli_num_rows($laporan_blm_dikerjakan);
        $laporan_belum_dikerjakan += $laporan_blm_dikerjakan;

        $laporan_dikerjakan = $db->select('tb_report', 'id_category="' . $value . '" AND status IN("process") AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
        $laporan_dikerjakan = mysqli_num_rows($laporan_dikerjakan);
        $laporan_sedang_dikerjakan += $laporan_dikerjakan;

        $laporan_slesai = $db->select('tb_report', 'id_category="' . $value . '" AND status IN("finished") AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
        $laporan_slesai = mysqli_num_rows($laporan_slesai);
        $laporan_selesai += $laporan_slesai;
    }

    echo json_encode(
        array(
            'total_laporan' => $total_laporan,
            'laporan_belum_dikerjakan' => $laporan_belum_dikerjakan,
            'laporan_sedang_dikerjakan' => $laporan_sedang_dikerjakan,
            'laporan_selesai' => $laporan_selesai,
            'unit' => $unit
        )
    );


    // } else {
    //     echo json_encode('USER NOT AUTHORIZATION');
    // }
}
