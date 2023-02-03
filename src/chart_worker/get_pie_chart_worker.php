<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');


if (isset($obj['id_user'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);



    // if ($type_worker == 'cordinator') {
    $id_cordinator = $id_user;
    $id_master_category = $db->select('tb_employee_job', 'id_employee="' . $id_cordinator . '"', 'id_employee_job', 'ASC');

    if (mysqli_num_rows($id_master_category) > 0) {
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

            $total = $db->count('tb_report', 'id_category="' . $value . '" AND create_at BETWEEN "' . $hri_kemarin . '"AND"' . $hri_ini . '"', 'id_report');
            $total = mysqli_fetch_assoc($total);
            $total_laporan += $total['count'];
            

            $laporan_blm_dikerjakan = $db->select('tb_report', 'id_category="' . $value . '"AND status IN("Menunggu", "Diterima") AND create_at BETWEEN "' . $hri_kemarin . '"AND"' . $hri_ini . '"' , 'id_report', 'DESC');
            $laporan_blm_dikerjakan = mysqli_num_rows($laporan_blm_dikerjakan);
            $laporan_belum_dikerjakan += $laporan_blm_dikerjakan;

            $laporan_dikerjakan = $db->select('tb_report', 'id_category="' . $value . '" AND status = "Diproses" AND create_at BETWEEN "' . $hri_kemarin . '"AND"' . $hri_ini . '"', 'id_report', 'DESC');
            $laporan_dikerjakan = mysqli_num_rows($laporan_dikerjakan);
            $laporan_sedang_dikerjakan += $laporan_dikerjakan;

            $laporan_slesai = $db->select('tb_report', 'id_category="' . $value . '" AND status = "Selesai" AND create_at BETWEEN "' . $hri_kemarin . '"AND"' . $hri_ini . '"', 'id_report', 'DESC');
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
    }
    // else {
    //     $id_cordinator = $id_user;
    //     $category = $db->select('tb_manager_contractor_job', 'id_manager_contractor="' . $id_cordinator . '"', 'id_category', 'ASC');
    //     // query total laporan
    //     $total_laporan = 0;
    //     $laporan_belum_dikerjakan = 0;
    //     $laporan_sedang_dikerjakan = 0;
    //     $laporan_selesai = 0;
    //     $unit;

    //     if (mysqli_num_rows($category) > 0) {
    //         while ($data_category = mysqli_fetch_assoc($category)) {
    //             $id_category = $data_category['id_category'];

    //             $single_category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');
    //             $single_category = mysqli_fetch_assoc($single_category);
    //             $id_master_category = $single_category['id_master_category'];

    //             $unit = $db->select('tb_master_category', 'id_master_category="' . $id_master_category . '"', 'id_master_category', 'ASC');
    //             $unit = mysqli_fetch_assoc($unit);
    //             $unit = $unit['unit'];



    //             // hari ini
    //             $hri_ini = date('Y-m-d H:i:s');
    //             // hari kemarin
    //             $hri_kemarin = date('Y-m-d H:i:s', strtotime('-24 hour'));


    //             $total = $db->count('tb_report', 'id_category="' . $id_category . '" AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report');
    //             $total = mysqli_fetch_assoc($total);
    //             $total_laporan += $total['count'];


    //             $laporan_blm_dikerjakan = $db->select('tb_report', 'id_category="' . $id_category . '" AND status IN("listed", "noticed") AND CONCAT(date_post , " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
    //             $laporan_blm_dikerjakan = mysqli_num_rows($laporan_blm_dikerjakan);
    //             $laporan_belum_dikerjakan += $laporan_blm_dikerjakan;

    //             $laporan_dikerjakan = $db->select('tb_report', 'id_category="' . $id_category . '" AND status IN("process") AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
    //             $laporan_dikerjakan = mysqli_num_rows($laporan_dikerjakan);
    //             $laporan_sedang_dikerjakan += $laporan_dikerjakan;

    //             $laporan_slesai = $db->select('tb_report', 'id_category="' . $id_category . '" AND status IN("finished") AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
    //             $laporan_slesai = mysqli_num_rows($laporan_slesai);
    //             $laporan_selesai += $laporan_slesai;
    //         }

    //         echo json_encode(
    //             array(
    //                 'total_laporan' => $total_laporan,
    //                 'laporan_belum_dikerjakan' => $laporan_belum_dikerjakan,
    //                 'laporan_sedang_dikerjakan' => $laporan_sedang_dikerjakan,
    //                 'laporan_selesai' => $laporan_selesai,
    //                 'unit' => $unit
    //             ),
    //             JSON_PRETTY_PRINT,
    //         );
    //     } else {
    //         $id_cordinator = $id_user;
    //         $category = $db->select('tb_contractor_job', 'id_contractor="' . $id_cordinator . '"', 'id_category', 'ASC');
    //         // query total laporan
    //         $total_laporan = 0;
    //         $laporan_belum_dikerjakan = 0;
    //         $laporan_sedang_dikerjakan = 0;
    //         $laporan_selesai = 0;
    //         $unit;

    //         if (mysqli_num_rows($category) > 0) {
    //             while ($data_category = mysqli_fetch_assoc($category)) {
    //                 $id_category = $data_category['id_category'];

    //                 $single_category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');
    //                 $single_category = mysqli_fetch_assoc($single_category);
    //                 $id_master_category = $single_category['id_master_category'];

    //                 $unit = $db->select('tb_master_category', 'id_master_category="' . $id_master_category . '"', 'id_master_category', 'ASC');
    //                 $unit = mysqli_fetch_assoc($unit);
    //                 $unit = $unit['unit'];



    //                 // hari ini
    //                 $hri_ini = date('Y-m-d H:i:s');
    //                 // hari kemarin
    //                 $hri_kemarin = date('Y-m-d H:i:s', strtotime('-24 hour'));


    //                 $total = $db->count('tb_report', 'id_category="' . $id_category . '" AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report');
    //                 $total = mysqli_fetch_assoc($total);
    //                 $total_laporan += $total['count'];


    //                 $laporan_blm_dikerjakan = $db->select('tb_report', 'id_category="' . $id_category . '" AND status IN("listed", "noticed") AND CONCAT(date_post , " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
    //                 $laporan_blm_dikerjakan = mysqli_num_rows($laporan_blm_dikerjakan);
    //                 $laporan_belum_dikerjakan += $laporan_blm_dikerjakan;

    //                 $laporan_dikerjakan = $db->select('tb_report', 'id_category="' . $id_category . '" AND status IN("process") AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
    //                 $laporan_dikerjakan = mysqli_num_rows($laporan_dikerjakan);
    //                 $laporan_sedang_dikerjakan += $laporan_dikerjakan;

    //                 $laporan_slesai = $db->select('tb_report', 'id_category="' . $id_category . '" AND status IN("finished") AND CONCAT(date_post, " ", time_post) > "' . $hri_kemarin . '" AND CONCAT(date_post, " ", time_post) < "' . $hri_ini . '"', 'id_report', 'DESC');
    //                 $laporan_slesai = mysqli_num_rows($laporan_slesai);
    //                 $laporan_selesai += $laporan_slesai;
    //             }

    //             echo json_encode(
    //                 array(
    //                     'total_laporan' => $total_laporan,
    //                     'laporan_belum_dikerjakan' => $laporan_belum_dikerjakan,
    //                     'laporan_sedang_dikerjakan' => $laporan_sedang_dikerjakan,
    //                     'laporan_selesai' => $laporan_selesai,
    //                     'unit' => $unit
    //                 ),
    //                 JSON_PRETTY_PRINT,
    //             );
    //         }
    //     }
    // }
}
