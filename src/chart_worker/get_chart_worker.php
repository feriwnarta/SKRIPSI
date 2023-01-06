<?php
require_once('../../file/function_proses.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);
date_default_timezone_set('asia/jakarta');

if (isset($obj['id_user']) && isset($obj['type_worker'])) {
    $id_user = mysqli_real_escape_string($db->query, $obj['id_user']);
    $type_worker = mysqli_real_escape_string($db->query, $obj['type_worker']);

    
    if ($type_worker == 'cordinator') {
        $result = $db->select('tb_estate_cordinator_job', 'id_estate_cordinator="' . $id_user . '"', 'id_estate_cordinator_job', 'ASC');
        if (mysqli_num_rows($result) > 0) {
            $result = mysqli_fetch_assoc($result);
            $master_category = $db->select('tb_master_category', 'id_master_category="' . $result['id_master_category'] . '"', 'id_master_category', 'ASC');
            $master_category = mysqli_fetch_assoc($master_category);
            $title = $master_category['unit'];

            $result = $db->select('tb_category', 'id_master_category="' . $result['id_master_category'] . '"', 'id_category', 'ASC');
            if (mysqli_num_rows($result) > 0) {

                $subtitle = array();
                $chart = array();
                $index = 0;
                $data_category = array();
                while ($data = mysqli_fetch_assoc($result)) {
                    // data untuk dropdown
                    $id_category = $data['id_category'];
                    $name_category = $data['category'];
                    
                    

                    // data dropdown
                    $data_category[] = array(
                        "name_category" => $name_category,
                        "id_category" =>  $id_category
                    );
                    

                    if ($index == 0) {
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
                        $pic = $db->select('tb_contractor_job', 'id_category="' . $id_category . '"', 'id_contractor', 'ASC');
                        $pic = mysqli_fetch_assoc($pic);
                        $pic = $db->select('tb_contractor', 'id_contractor="' . $pic['id_contractor'] . '"', 'id_contractor', 'DESC');
                        $pic = mysqli_fetch_assoc($pic);
                        $pic = $pic['name_contractor'];
                    }
                    $index++;
                }
            }
        }
        $data_balik = array (
            'title' => $title,
            'subtitle' => $subtitle,
            'data_dropdown' => $data_category,
            'chart' => $chart,
            'pic' => $pic,
            'persentase' => $total
        
        );
        echo json_encode($data_balik);
        
        
    } else if ($type_worker == 'contractor') {
    }
}

function getChartByHour($start, $end, $id_category, $db)
{
    $res = $db->select('tb_report', 'id_category="' . $id_category . '" AND CONCAT(date_post, " ", time_post) < "' . $start . '" AND CONCAT(date_post, " ", time_post) > "' . $end . '"', 'id_report', 'DESC');
   
    return mysqli_num_rows($res);
}
