<?php

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['id_report'])) {

    $id_report = htmlspecialchars($obj['id_report']);

    $image_report = $db->select('tb_process_work', 'id_report = "' . $id_report . '"', 'id_report', 'DESC');

    if (mysqli_num_rows($image_report) > 0) {
        $image_report = mysqli_fetch_assoc($image_report);
        $foto_work1 = $image_report['photo_work_1'];
        $foto_work2 = $image_report['photo_work_2'];
        $foto_completed1 = $image_report['photo_complete_1'];
        $foto_completed2 = $image_report['photo_complete_2'];
        $finish_time = $image_report['finish_time'];
        $duration = $image_report['duration'];

        $data_return['image_foto_work1'] = $foto_work1;
        $data_return['image_foto_work2'] = $foto_work2;
        $data_return['image_foto_complete1'] = $foto_completed1;
        $data_return['image_foto_complete2'] = $foto_completed2;

        $data_return['duration'] = time_to_text($duration);
        $data_return['finish_time'] = $finish_time;


        // query select process report
        $data_process_report = $db->select('tb_process_report', 'id_report = "' . $id_report . '"', 'current_time_process', 'ASC');
        $data_return_process_report = array();
        if (mysqli_num_rows($data_process_report) > 0) {
            $index_first = 0;
            
            while ($result_process_report = mysqli_fetch_assoc($data_process_report)) {
                $title = $result_process_report['status_process'];
                $subtitle = $result_process_report['current_time_process'];
                
                if(mysqli_fetch_assoc($data_process_report)) {
                    
                    if($index_first == 0) {
                        $data_return_process_report[] = array(
                            'title' => $title,
                            'subtitle' => $subtitle,
                            'index' => 'first',
                        );        
                    } else {
                        $data_return_process_report[] = array(
                            'title' => $title,
                            'subtitle' => $subtitle,
                            'index' => 'none',
                        );        
                    }    
                    
                } else {
                        $data_return_process_report[] = array(
                            'title' => $title,
                            'subtitle' => $subtitle,
                            'index' => 'last',
                        );        
                }
                
                $index_first++;
                
                
            }
            $data_return['process_report'] = $data_return_process_report;

            /**
             * query select bintang laporan
             */
            $data_report = $db->select('tb_report', 'id_report = "' . $id_report . '"', 'id_report', 'DESC');
            if (mysqli_num_rows($data_report) > 0) {
                $data_report = mysqli_fetch_assoc($data_report);
                $bintang = $data_report['star'];
                $location = $data_report['address'];
            }
            $data_return['star'] = $bintang;
            $data_return['location'] = $location;

            /**
             * query select klasifikasi complaint
             */
            $data_detail_klasifikasi = $db->select('tb_detail_klasifikasi_category', 'id_report = "' . $id_report . '"', 'id_klasifikasi_detail', 'DESC');

            $data_return_klasifikasi = array();

            if (mysqli_num_rows($data_detail_klasifikasi) > 0) {

                while ($result_detail_klasifikasi = mysqli_fetch_assoc($data_detail_klasifikasi)) {
                    $id_klasifikasi = $result_detail_klasifikasi['id_klasifikasi'];



                    /**
                     * query select tb_klasifikasi category
                     */

                    $data_klasifikasi = $db->select('tb_klasifikasi_category', 'id_klasifikasi = "' . $id_klasifikasi . '"', 'id_klasifikasi', 'ASC');
                    if (mysqli_num_rows($data_klasifikasi) > 0) {

                        while ($result_data_klasifikasi = mysqli_fetch_assoc($data_klasifikasi)) {
                            $klasifikasi = $result_data_klasifikasi['klasifikasi'];
                            $data_return_klasifikasi[] = $klasifikasi;
                        }
                    }

                    
                }
                $data_return['complaint'] = $data_return_klasifikasi;
                
            }
            echo json_encode($data_return, JSON_PRETTY_PRINT);
            
        }
    } else {
        echo json_encode('image not found');
    }
}

function time_to_text($time)
{
    $time = trim($time);
    if (empty($time)) {
        return "1 jam 0 menit";
    }

    list($hours, $minutes, $seconds) = explode(':', $time);
    if (!$hours) {
        $hours = 1;
    }
    $time_in_hours = $hours + ($minutes / 60) + ($seconds / 3600);

    if ($time_in_hours < 1) {

        return floor(($time_in_hours - floor($time_in_hours)) * 60) . " menit";
    }

    return floor($time_in_hours) . " jam " . floor(($time_in_hours - floor($time_in_hours)) * 60) . " menit";
}
