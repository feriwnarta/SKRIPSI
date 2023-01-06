<?php

require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user']) && isset($obj['date']) && isset($obj['range_date']) && isset($obj['id_category'])) {

    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $from_date = mysqli_real_escape_string($db->query, $obj['date']);
    $range_date = mysqli_real_escape_string($db->query, $obj['range_date']);
    $id_category = mysqli_real_escape_string($db->query, $obj['id_category']);

    $data_return = array();

    $to_date;
    $from_date = $from_date . ' ' . date('H:i:s');

    $UTC = new DateTimeZone("UTC");
    $date = new DateTime($from_date, $UTC);

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

    $category = $db->select('tb_category', 'id_category="' . $id_category . '"', 'id_category', 'DESC');

    if (mysqli_num_rows($category) > 0) {
        $category = mysqli_fetch_assoc($category);
        // select pekerja kontraktor
        $contractor = $db->select('tb_contractor_job', 'id_category = "' . $id_category . '"', 'id_category', 'DESC');
        
        $result_category = array();
        $pic = array();
        $name_pic = array();
        if (mysqli_num_rows($contractor) > 0) {
            while ($data_contractor = mysqli_fetch_assoc($contractor)) {
                $pic[] = $data_contractor['id_contractor'];
            }
            foreach ($pic as $value) {
                $contractor = $db->select('tb_contractor', 'id_contractor="' . $value . '"', 'id_contractor', 'ASC');
                while ($dt_contractor = mysqli_fetch_assoc($contractor)) {
                    $name_pic[] = $dt_contractor['name_contractor'];
                }
            }
            $result_category['pic'] = $name_pic;
        } else {
            $result_category['pic'] = null;
        }



        // $id_master_category = $category['id_master_category'];
        // $data_category = $db->select('tb_category', 'id_master_category="' . $id_master_category . '"', 'id_category', 'DESC');
        // $penampung_category = array();
        // while ($data = mysqli_fetch_assoc($data_category)) {
        //     $penampung_category[] = $data;
        // }
        $result_category['id_category'] = $category['id_category'];
        $result_category['name_category'] = $category['category'];


        $report_now = $db->select('tb_report', 'id_category = "' . $id_category . '" AND create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '"', 'id_report', 'DESC');
        $report_past = $db->select('tb_report', 'id_category = "' . $id_category . '" AND create_at <= "' . $compare_from . '" AND create_at >= "' . $compare_to . '"', 'id_report', 'DESC');

        // data for chart
        $line_chart = $db->select_chart('tb_report', 'create_at', 'id_category = "' . $id_category . '" AND create_at <= "' . $from_date . '" AND create_at >= "' . $to_date . '"');
        $chart = array();
        while ($data_chart = mysqli_fetch_assoc($line_chart)) {
            $chart[] = $data_chart['num_rows'];
        }


        // persentase
        $report_now = mysqli_num_rows($report_now);
        $report_past = mysqli_num_rows($report_past);
        $total_report = $report_now + $report_past;
        
         if($report_past != 0) {
                    
                        if($total_report != 0) {
                            $persentase = (($report_past - $report_now) / $total_report) * 100;
                        } else {
                            $persentase = 100;
                        }
                        
                         if($persentase < 0) {
                            $persentase = $persentase * -1;
                            $status = 'minus';
                        } else {
                            $status = 'plus';
                        }
                        
                        if($persentase != 100) {
                            $persentase = sprintf("%.1f", $persentase);    
                        }
                        
                        
                        $persentase_sekarang = 100 - $persentase;
                        
                        if($persentase_sekarang == 0) {
                            $persentase_sekarang = 100;
                        }
                    
                    
                    } else {
                        $persentase_sekarang = 100 - $report_now;
                        if($persentase_sekarang != 100) {
                            $persentase = 100 - $persentase_sekarang;   
                        } else {
                            $persentase = 100;
                        }
                        if($persentase < 100) {
                            $status = 'minus';
                        } else {
                            $status = 'plus';
                        }
                    }
                    

        $result_category['sebelum'] = $report_past;
        $result_category['sesudah'] = $report_now;
        $result_category['persentase'] = $persentase . ' %';
        $result_category['persentase_sekarang'] = $persentase_sekarang . ' %';
        $result_category['status'] = $status;
        $result_category['data_chart'] = $chart;
        // break;

        $category_return[] = $result_category;
        echo json_encode($result_category, JSON_PRETTY_PRINT);
    }
}
