<?php

require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user']) && isset($obj['date']) && isset($obj['range_date'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $from_date = mysqli_real_escape_string($db->query, $obj['date']);
    $range_date = mysqli_real_escape_string($db->query, $obj['range_date']);

    $data_return = array();

    $to_date;
    $from_date = $from_date . ' ' . date('H:i:s');

    $UTC = new DateTimeZone("UTC");
    $date = new DateTime($from_date, $UTC);

    // $date->modify('-1 day');
    // echo $date->format('Y-m-d H:i:s');


    if ($range_date == '1hr') {
        $date->modify('-1 day');
        $to_date = $date->format('Y-m-d H:i:s');
        $compare_from = $date->format('Y-m-d H:i:s');
        $date->modify('-1 day');
        $compare_to = $date->format('Y-m-d H:i:s');
    } else if ($range_date == '7hr') {
        $date->modify('-7 day');
        $to_date = $date->format('Y-m-d H:i:s');
        $compare_from = $date->format('Y-m-d H:i:s');
        $date->modify('-7 day');
        $compare_to = $date->format('Y-m-d H:i:s');
    } else if ($range_date == '30hr') {
        $date->modify('-1 month');
        $to_date = $date->format('Y-m-d H:i:s');
        $compare_from = $date->format('Y-m-d H:i:s');
        $date->modify('-1 month');
        $compare_to = $date->format('Y-m-d H:i:s');
    } else {
        $date->modify('-1 year');
        $to_date = $date->format('Y-m-d H:i:s');
        $compare_from = $date->format('Y-m-d H:i:s');
        $date->modify('-1 year');
        $compare_to = $date->format('Y-m-d H:i:s');
    }

    // select total laporan 
    $report_now = $db->count('tb_report', 'create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '"', 'id_report');

    // total laporan
    $title = 'Total Laporan';
    $data_total = mysqli_fetch_assoc($report_now)['count'];

    $data_master_category = $db->select('tb_master_category', 'id_master_category', 'id_master_category', 'ASC');


    $data_return = array(
        array(
            'title' => $title,
            'total' => $data_total
        )
    );

    while ($result_master_category = mysqli_fetch_assoc($data_master_category)) {
        $id_master_category =  $result_master_category['id_master_category'];
        $name_master_category = $result_master_category['unit'];
        $count_category = 0;



        $data_category = $db->select('tb_category', 'id_master_category = "' . $id_master_category . '"', 'id_category', 'ASC');


        while ($result_category = mysqli_fetch_assoc($data_category)) {
            $id_category =  $result_category['id_category'];
            $data_count_report =  $db->count('tb_report', 'create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '" AND id_category = "' . $id_category . '"', 'id_report');
            $data_count_report = mysqli_fetch_assoc($data_count_report)['count'];
            $count_category += $data_count_report;
        }

        $color_array;

        switch ($name_master_category) {
            case 'Pertamanan, kebersihan, dan clubhouse':
                $color_array = '0xffDBEFFF';
                break;
            case 'ME, INFRA dan kolam renang':
                $color_array = '0xff8FC6F2';
                break;
            case 'Building Control dan security':
                $color_array = '0xff44A1E9';
                break;
            case 'Administrasi':
                $color_array = '0xff8FC6F2';
                break;

            default:
                $color_array = '0xff1F8EE5';
                break;
        }

        $data_return[0]['data_pie'][] = array(
            'unit' => $name_master_category,
            'total' => $count_category,
            'color' => $color_array,
        );
    }



    //! / select total laporan selesai
    $report_now = $db->count('tb_report', 'create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '" AND status = "Selesai"', 'id_report');

    //! total laporan selesai
    $title = 'Total Selesai';
    $data_total = mysqli_fetch_assoc($report_now)['count'];

    $data_master_category = $db->select('tb_master_category', 'id_master_category', 'id_master_category', 'ASC');


    $data_return[] = array(

        'title' => $title,
        'total' => $data_total

    );

    while ($result_master_category = mysqli_fetch_assoc($data_master_category)) {
        $id_master_category =  $result_master_category['id_master_category'];
        $name_master_category = $result_master_category['unit'];
        $count_category = 0;



        $data_category = $db->select('tb_category', 'id_master_category = "' . $id_master_category . '"', 'id_category', 'ASC');


        while ($result_category = mysqli_fetch_assoc($data_category)) {
            $id_category =  $result_category['id_category'];
            $data_count_report =  $db->count('tb_report', 'create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '" AND id_category = "' . $id_category . '" AND status = "Selesai"', 'id_report');
            $data_count_report = mysqli_fetch_assoc($data_count_report)['count'];
            $count_category += $data_count_report;
        }

        $color_array;

        switch ($name_master_category) {
            case 'Pertamanan, kebersihan, dan clubhouse':
                $color_array = '0xffD2FDDA';
                break;
            case 'ME, INFRA dan kolam renang':
                $color_array = '0xffD2FDDA';
                break;
            case 'Building Control dan security':
                $color_array = '0xff6AF785';
                break;
            case 'Administrasi':
                $color_array = '0xff3AF052';
                break;

            default:
                $color_array = '0xff1F8EE5';
                break;
        }

        $data_return[1]['data_pie'][] = array(
            'unit' => $name_master_category,
            'total' => $count_category,
            'color' => $color_array
        );
    }



    // ! TOTAL LAPORAN SEDANG DIKERJAKAN
    $report_now = $db->count('tb_report', 'create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '" AND status = "Diproses"', 'id_report');

    //! TOTAL LAPORAN SEDANG DIKERJAKAN
    $title = 'Sedang dikerjakan';
    $data_total = mysqli_fetch_assoc($report_now)['count'];

    $data_master_category = $db->select('tb_master_category', 'id_master_category', 'id_master_category', 'ASC');


    $data_return[] = array(

        'title' => $title,
        'total' => $data_total

    );

    while ($result_master_category = mysqli_fetch_assoc($data_master_category)) {
        $id_master_category =  $result_master_category['id_master_category'];
        $name_master_category = $result_master_category['unit'];
        $count_category = 0;



        $data_category = $db->select('tb_category', 'id_master_category = "' . $id_master_category . '"', 'id_category', 'ASC');


        while ($result_category = mysqli_fetch_assoc($data_category)) {
            $id_category =  $result_category['id_category'];
            $data_count_report =  $db->count('tb_report', 'create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '" AND id_category = "' . $id_category . '" AND status = "Diproses"', 'id_report');
            $data_count_report = mysqli_fetch_assoc($data_count_report)['count'];
            $count_category += $data_count_report;
        }

        $color_array;

        switch ($name_master_category) {
            case 'Pertamanan, kebersihan, dan clubhouse':
                $color_array = '0xffFDEDD2';
                break;
            case 'ME, INFRA dan kolam renang':
                $color_array = '0xffF9D28F';
                break;
            case 'Building Control dan security':
                $color_array = '0xffF7C36A';
                break;
            case 'Administrasi':
                $color_array = '0xffF0B34D';
                break;

            default:
                $color_array = '0xffF0B34D';
                break;
        }

        $data_return[2]['data_pie'][] = array(
            'unit' => $name_master_category,
            'total' => $count_category,
            'color' => $color_array,
        );
    }


    // ! TOTAL LAPORAN BELUM DIKERJAKAN
    $report_now = $db->count('tb_report', 'create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '" AND status = "Menunggu"', 'id_report');

    //! TOTAL LAPORAN BELUM DIKERJAKAN
    $title = 'Belum dikerjakan';
    $data_total = mysqli_fetch_assoc($report_now)['count'];

    $data_master_category = $db->select('tb_master_category', 'id_master_category', 'id_master_category', 'ASC');


    $data_return[] = array(

        'title' => $title,
        'total' => $data_total

    );

    while ($result_master_category = mysqli_fetch_assoc($data_master_category)) {
        $id_master_category =  $result_master_category['id_master_category'];
        $name_master_category = $result_master_category['unit'];
        $count_category = 0;



        $data_category = $db->select('tb_category', 'id_master_category = "' . $id_master_category . '"', 'id_category', 'ASC');


        while ($result_category = mysqli_fetch_assoc($data_category)) {
            $id_category =  $result_category['id_category'];
            $data_count_report =  $db->count('tb_report', 'create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '" AND id_category = "' . $id_category . '" AND status = "Menunggu"', 'id_report');
            $data_count_report = mysqli_fetch_assoc($data_count_report)['count'];
            $count_category += $data_count_report;
        }

        $color_array;

        switch ($name_master_category) {
            case 'Pertamanan, kebersihan, dan clubhouse':
                $color_array = '0xffFDD2D2';
                break;
            case 'ME, INFRA dan kolam renang':
                $color_array = '0xffF98F8F';
                break;
            case 'Building Control dan security':
                $color_array = '0xffF04D4D';
                break;
            case 'Administrasi':
                $color_array = '0xffF76A6A';
                break;

            default:
                $color_array = '0xffF0B34D';
                break;
        }

        $data_return[3]['data_pie'][] = array(
            'unit' => $name_master_category,
            'total' => $count_category,
            'color' => $color_array,
        );
    }




    echo json_encode($data_return, JSON_PRETTY_PRINT);
}
