<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);

    $result = $db->select('tb_employee_job', 'id_employee="' . $id_user . '"', 'id_employee_job', 'ASC');



    if (mysqli_num_rows($result) > 0) {
        $result = mysqli_fetch_assoc($result);
        $master_category = $db->select('tb_master_category', 'id_master_category="' . $result['id_master_category'] . '"', 'id_master_category', 'ASC');
        $master_category = mysqli_fetch_assoc($master_category);
        $id_master_category = $master_category['id_master_category'];
        $title = $master_category['unit'];

        $result = $db->select('tb_category', 'id_master_category="' . $result['id_master_category'] . '"', 'id_category', 'ASC');
        if (mysqli_num_rows($result) > 0) {
            $data_balik = array();
            $subtitle = array();
            $chart = array();
            // $data_category = array();
            while ($data = mysqli_fetch_assoc($result)) {
                // data untuk dropdown
                $id_category = $data['id_category'];
                $name_category = $data['category'];


                // dropdown
                $subtitle =  $name_category;

                // data untuk chart
                $date_4 = date('Y-m-d H:i:s', strtotime('-24 hour'));
                $date_3 = date('Y-m-d H:i:s', strtotime('-18 hour'));
                $date_2 = date('Y-m-d H:i:s', strtotime('-12 hour'));
                $date_1 = date('Y-m-d H:i:s', strtotime('-6 hour'));
                $date_0 = date('Y-m-d H:i:s');

                $jam_4 = getChartByHour($date_3, $date_4, $id_category, $db);
                $jam_3  = getChartByHour($date_2, $date_3, $id_category, $db);
                $jam_2  = getChartByHour($date_1, $date_2, $id_category, $db);
                $jam_1  = getChartByHour($date_0, $date_1, $id_category, $db);


                // data untuk persentase 
                $res = $db->select('tb_report', 'id_category="' . $id_category . '" AND CONCAT(date_post, " ", time_post) > "' . $date_4 . '" AND CONCAT(date_post, " ", time_post) < "' . $date_0 . '"', 'id_report', 'DESC');
                $total = 100 - mysqli_num_rows($res);


                $chart = array(
                    100 - $jam_1,
                    100 - $jam_2,
                    100 - $jam_3,
                    100 - $jam_4
                );

                // nama PIC
                $pic = $db->select('tb_employee_job', 'id_master_category="' . $id_master_category . '"', 'id_employee_job', 'ASC');
                $data_balik_pic = array();

                while ($data_pic = mysqli_fetch_assoc($pic)) {
                    $id_contractor = $data_pic['id_employee'];

                    $contractor = $db->select('tb_employee', 'id_employee="' . $id_contractor . '"', 'id_employee', 'ASC');

                    while ($data_contractor = mysqli_fetch_assoc($contractor)) {
                        $pic_name = $data_contractor['name'];
                        $data_balik_pic[] = $pic_name;
                    }
                }

                $persentase_indicator = 100 - $total;
                $status_indicator;

                if ($persentase_indicator < 0) {
                    $persentase_indicator = $persentase_indicator * -1;
                    $status_indicator = 'minus';
                } else {
                    $status_indicator = 'plus';
                }
                $data_balik[] = array(
                    'title' => $title,
                    'subtitle' => $subtitle,
                    'chart' => $chart,
                    'pic' => $data_balik_pic,
                    'persentase' => $total,
                    'persentase_indicator' => $persentase_indicator,
                    'status_indicator' => $status_indicator,

                );
            }
        }

        echo json_encode($data_balik, JSON_PRETTY_PRINT);
    } 
    // else {
    //     $result = $db->select('tb_manager_contractor_job', 'id_manager_contractor="' . $id_user . '"', 'id_manager_contractor_job', 'ASC');

    //     if (mysqli_num_rows($result) > 0) {

    //         $title;

    //         $data_balik = array();

    //         $data_chart = array();

    //         $data_balik_pic = array();

    //         $data_dropdown = array();

    //         while ($data_category = mysqli_fetch_assoc($result)) {
    //             $id_category = $data_category['id_category'];

    //             $category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

    //             if (mysqli_num_rows($category) > 0) {
    //                 $category = mysqli_fetch_assoc($category);
    //                 $id_master_category = $category['id_master_category'];
    //                 $master_category = $db->select('tb_master_category', 'id_master_category="' . $id_master_category . '"', 'id_master_category', 'ASC');
    //                 $master_category = mysqli_fetch_assoc($master_category);
    //                 $title = $master_category['unit'];

    //                 $name_category = $category['category'];

    //                 $date_4 = date('Y-m-d H:i:s', strtotime('-24 hour'));
    //                 $date_3 = date('Y-m-d H:i:s', strtotime('-18 hour'));
    //                 $date_2 = date('Y-m-d H:i:s', strtotime('-12 hour'));
    //                 $date_1 = date('Y-m-d H:i:s', strtotime('-6 hour'));
    //                 $date_0 = date('Y-m-d H:i:s');

    //                 $jam_4 = getChartByHour($date_3, $date_4, $id_category, $db);
    //                 $jam_3  = getChartByHour($date_2, $date_3, $id_category, $db);
    //                 $jam_2  = getChartByHour($date_1, $date_2, $id_category, $db);
    //                 $jam_1  = getChartByHour($date_0, $date_1, $id_category, $db);


    //                 // data untuk persentase 
    //                 $res = $db->select('tb_report', 'id_category="' . $id_category . '" AND CONCAT(date_post, " ", time_post) > "' . $date_4 . '" AND CONCAT(date_post, " ", time_post) < "' . $date_0 . '"', 'id_report', 'DESC');
    //                 $total = 100 - mysqli_num_rows($res);


    //                 $chart = array(
    //                     100 - $jam_1,
    //                     100 - $jam_2,
    //                     100 - $jam_3,
    //                     100 - $jam_4
    //                 );

    //                 $persentase_indicator = 100 - $total;

    //                 $status_indicator = '';

    //                 if ($persentase_indicator < 0) {
    //                     $persentase_indicator = $persentase_indicator * -1;
    //                     $status_indicator = 'minus';
    //                 } else {
    //                     $status_indicator = 'plus';
    //                 }

    //                 // nama PIC
    //                 $pic = $db->select('tb_contractor_job', 'id_category="' . $id_category . '"', 'id_contractor', 'ASC');

    //                 while ($data_pic = mysqli_fetch_assoc($pic)) {
    //                     $id_contractor = $data_pic['id_contractor'];

    //                     $contractor = $db->select('tb_contractor', 'id_contractor="' . $id_contractor . '"', 'id_contractor', 'DESC');

    //                     while ($data_contractor = mysqli_fetch_assoc($contractor)) {
    //                         $pic_name = $data_contractor['name_contractor'];
    //                         $data_balik_pic[] = $pic_name;
    //                     }
    //                 }




    //                 $data_chart[] = array(
    //                     'title' => $title,
    //                     'subtitle' => $name_category,
    //                     'persentase' => $total,
    //                     'chart' => $chart,
    //                     'data_dropdown' => $data_dropdown,
    //                     'pic' => $data_balik_pic,
    //                     'status_indicator' => $status_indicator,
    //                     'persentase_indicator' => $persentase_indicator,
    //                 );



    //                 // $data_balik = array(
    //                 //     'title' => $title,
    //                 //     'subtitle' => $subtitle,
    //                 //     'data_dropdown' => $data_category,
    //                 //     'chart' => $chart,
    //                 //     'pic' => $pic,
    //                 //     'persentase' => $total,
    //                 //     'persentase_indicator' => $persentase_indicator,
    //                 //     'status_indicator' => $status_indicator,
    //                 // );
    //                 // echo json_encode($data_balik);
    //             } else {
    //             }
    //         }
    //         echo json_encode($data_chart, JSON_PRETTY_PRINT);
    //     } else {
    //         $result = $db->select('tb_contractor_job', 'id_contractor="' . $id_user . '"', 'id_contractor_job', 'ASC');

    //         if (mysqli_num_rows($result) > 0) {

    //             $title;

    //             $data_balik = array();

    //             $data_chart = array();

    //             $data_balik_pic = array();

    //             $data_dropdown = array();

    //             while ($data_category = mysqli_fetch_assoc($result)) {
    //                 $id_category = $data_category['id_category'];

    //                 $category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

    //                 if (mysqli_num_rows($category) > 0) {
    //                     $category = mysqli_fetch_assoc($category);
    //                     $id_master_category = $category['id_master_category'];
    //                     $master_category = $db->select('tb_master_category', 'id_master_category="' . $id_master_category . '"', 'id_master_category', 'ASC');
    //                     $master_category = mysqli_fetch_assoc($master_category);
    //                     $title = $master_category['unit'];

    //                     $name_category = $category['category'];

    //                     $date_4 = date('Y-m-d H:i:s', strtotime('-24 hour'));
    //                     $date_3 = date('Y-m-d H:i:s', strtotime('-18 hour'));
    //                     $date_2 = date('Y-m-d H:i:s', strtotime('-12 hour'));
    //                     $date_1 = date('Y-m-d H:i:s', strtotime('-6 hour'));
    //                     $date_0 = date('Y-m-d H:i:s');

    //                     $jam_4 = getChartByHour($date_3, $date_4, $id_category, $db);
    //                     $jam_3  = getChartByHour($date_2, $date_3, $id_category, $db);
    //                     $jam_2  = getChartByHour($date_1, $date_2, $id_category, $db);
    //                     $jam_1  = getChartByHour($date_0, $date_1, $id_category, $db);


    //                     // data untuk persentase 
    //                     $res = $db->select('tb_report', 'id_category="' . $id_category . '" AND CONCAT(date_post, " ", time_post) > "' . $date_4 . '" AND CONCAT(date_post, " ", time_post) < "' . $date_0 . '"', 'id_report', 'DESC');
    //                     $total = 100 - mysqli_num_rows($res);


    //                     $chart = array(
    //                         100 - $jam_1,
    //                         100 - $jam_2,
    //                         100 - $jam_3,
    //                         100 - $jam_4
    //                     );

    //                     $persentase_indicator = 100 - $total;

    //                     $status_indicator = '';

    //                     if ($persentase_indicator < 0) {
    //                         $persentase_indicator = $persentase_indicator * -1;
    //                         $status_indicator = 'minus';
    //                     } else {
    //                         $status_indicator = 'plus';
    //                     }

    //                     // nama PIC
    //                     $pic = $db->select('tb_contractor_job', 'id_category="' . $id_category . '"', 'id_contractor', 'ASC');

    //                     while ($data_pic = mysqli_fetch_assoc($pic)) {
    //                         $id_contractor = $data_pic['id_contractor'];

    //                         $contractor = $db->select('tb_contractor', 'id_contractor="' . $id_contractor . '"', 'id_contractor', 'DESC');

    //                         while ($data_contractor = mysqli_fetch_assoc($contractor)) {
    //                             $pic_name = $data_contractor['name_contractor'];
    //                             $data_balik_pic[] = $pic_name;
    //                         }
    //                     }




    //                     $data_chart[] = array(
    //                         'title' => $title,
    //                         'subtitle' => $name_category,
    //                         'persentase' => $total,
    //                         'chart' => $chart,
    //                         'data_dropdown' => $data_dropdown,
    //                         'pic' => $data_balik_pic,
    //                         'status_indicator' => $status_indicator,
    //                         'persentase_indicator' => $persentase_indicator,
    //                     );



    //                     // $data_balik = array(
    //                     //     'title' => $title,
    //                     //     'subtitle' => $subtitle,
    //                     //     'data_dropdown' => $data_category,
    //                     //     'chart' => $chart,
    //                     //     'pic' => $pic,
    //                     //     'persentase' => $total,
    //                     //     'persentase_indicator' => $persentase_indicator,
    //                     //     'status_indicator' => $status_indicator,
    //                     // );
    //                     // echo json_encode($data_balik);
    //                 } else {
    //                 }
    //             }
    //             echo json_encode($data_chart, JSON_PRETTY_PRINT);
    //         }
    //     }
    // }
}

function getChartByHour($start, $end, $id_category, $db)
{
    $res = $db->select('tb_report', 'id_category="' . $id_category . '" AND CONCAT(date_post, " ", time_post) < "' . $start . '" AND CONCAT(date_post, " ", time_post) > "' . $end . '"', 'id_report', 'DESC');

    return mysqli_num_rows($res);
}
