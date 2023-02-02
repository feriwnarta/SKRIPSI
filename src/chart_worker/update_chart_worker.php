<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user']) && isset($obj['category'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $category = mysqli_real_escape_string($db->query, $obj['category']);


    // get id master category berdasarkan category
    $id_master_category = $db->select('tb_category', 'category="' . $category . '"', 'id_category', 'ASC');
    $id_master_category = mysqli_fetch_assoc($id_master_category);
    $id_category = $id_master_category['id_category'];
    $id_master_category = $id_master_category['id_master_category'];

    // get master category unit
    $master_category = $db->select('tb_master_category', 'id_master_category="' . $id_master_category . '"', 'id_master_category', 'ASC');
    $master_category = mysqli_fetch_assoc($master_category);
    $title = $master_category['unit'];


    // data untuk dropdown 
    $subtitle = $category;

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
    $res = $db->select('tb_report', 'id_category="' . $id_category . '" AND create_at > "' . $date_4 . '" AND create_at < "' . $date_0 . '"', 'id_report', 'DESC');


    $total = 100 - mysqli_num_rows($res);

    $chart = array(
        100 - $jam_1,
        100 - $jam_2,
        100 - $jam_3,
        100 - $jam_4
    );

    $data_category = $db->select('tb_category', 'id_master_category="' . $id_master_category . '"', 'id_category', 'ASC');
    if (mysqli_num_rows($data_category) > 0) {
        while ($data = mysqli_fetch_assoc($data_category)) {
            $name_category = $data['category'];
            $data_dropdown[] = array(
                'name_category' => $name_category
            );
        }
    }

    // nama PIC
    $data_return_pic = array();
    $pic = $db->select('tb_employee_job', 'id_master_category="' . $id_master_category . '"', 'id_employee_job', 'ASC');

    while ($data_pic = mysqli_fetch_assoc($pic)) {
        $pic_name = $db->select('tb_employee', 'id_employee="' . $data_pic['id_employee'] . '"', 'id_employee', 'DESC');
        $pic_name = mysqli_fetch_assoc($pic_name);
        $pic_name = $pic_name['name'];
        $data_return_pic[] = $pic_name;
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
        'pic' => $data_return_pic,
        'persentase' => $total,
        'persentase_indicator' => $persentase_indicator,
        'status_indicator' => $status_indicator,

    );


    $data_dropdown = $db->select('tb_category', 'id_master_category = "' . $id_master_category . '" ', 'id_category', 'ASC');


    if (mysqli_num_rows($data_dropdown) > 0) {
        while ($result_dropdown = mysqli_fetch_assoc($data_dropdown)) {

            $id_category = $result_dropdown['id_category'];
            $data_category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

            $data_category = mysqli_fetch_assoc($data_category)['category'];

            if ($data_category != $subtitle) {
                $data_balik[] = array(
                    'title' => $title,
                    'subtitle' => $data_category,
                );
            }
        }
    }
    // else {
    //     $data_dropdown = $db->select('tb_contractor_job', 'id_contractor = "' . $id_user . '" ', 'id_category', 'DESC');
    //     if (mysqli_num_rows($data_dropdown) > 0) {
    //         while ($result_dropdown = mysqli_fetch_assoc($data_dropdown)) {
    //             $id_category = $result_dropdown['id_category'];
    //             $data_category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

    //             $data_category = mysqli_fetch_assoc($data_category)['category'];

    //             if ($data_category != $subtitle) {
    //                 $data_balik[] = array(
    //                     'title' => $title,
    //                     'subtitle' => $data_category,
    //                 );
    //             }
    //         }
    //     } else {
    //         $data_dropdown = $db->select('tb_estate_cordinator_job', 'id_estate_cordinator = "' . $id_user . '" ', 'id_master_category', 'DESC');
    //         if (mysqli_num_rows($data_dropdown) > 0) {
    //             $master_category = mysqli_fetch_assoc($data_dropdown)['id_master_category'];

    //             $data_category = $db->select('tb_category', 'id_master_category = "' . $master_category . '"', 'id_category', 'ASC');

    //             if (mysqli_num_rows($data_category) > 0) {
    //                 while ($result_category = mysqli_fetch_assoc($data_category)) {
    //                     $name_category = $result_category['category'];

    //                     if ($name_category != $subtitle) {
    //                         $data_balik[] = array(
    //                             'title' => $title,
    //                             'subtitle' => $name_category,
    //                         );
    //                     }
    //                 }
    //             } else {
    //             }



    //             // while ($result_dropdown = mysqli_fetch_assoc($data_dropdown)) {
    //             //     $id_category = $result_dropdown['id_category'];
    //             //     $data_category = $db->select('tb_category', 'id_category = "' . $id_category . '"', 'id_category', 'ASC');

    //             //     $data_category = mysqli_fetch_assoc($data_category)['category'];

    //             //     if ($data_category != $subtitle) {
    //             //         $data_balik[] = array(
    //             //             'title' => $title,
    //             //             'subtitle' => $data_category,
    //             //         );
    //             //     }
    //             // }
    //         }
    //     }
    // }




    echo json_encode($data_balik, JSON_PRETTY_PRINT);
}

function getChartByHour($start, $end, $id_category, $db)
{
    $res = $db->select('tb_report', 'id_category="' . $id_category . '" AND CONCAT(date_post, " ", time_post) < "' . $start . '" AND CONCAT(date_post, " ", time_post) > "' . $end . '"', 'id_report', 'DESC');

    return mysqli_num_rows($res);
}
