<?php
require_once('../../file/function_proses.php');
require_once('../utils/Uuid.php');
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if (isset($obj['id_reporter']) && isset($obj['id_status']) && isset($obj['type'])) {

    $idReportSocmed = UUID::guidv4();
    $idReporter = $obj['id_reporter'];
    $idStatus = $obj['id_status'];
    $type = $obj['type'];


    $result = $db->insert('tb_report_socmed', "id_report_socmed = '{$idReportSocmed}', id_reporter = '{$idReporter}', id_status = '{$idStatus}', type = '{$type}'");


    if ($result) {

        $resultSetting = $db->select('tb_setting_socmed', "id_status = '{$idStatus}' AND report_user_id = '{$idReporter}'", 'create_at', 'ASC');

        if (mysqli_num_rows($resultSetting) > 0) {
            $id = mysqli_fetch_assoc($resultSetting)['id_setting_socmed'];
            $rsUpdate = $db->update('tb_setting_socmed', 'report = "1"', "id_setting_socmed = '{$id}'");

            if ($rsUpdate) {
                echo json_encode('success');
                return;
            }

            echo json_encode('failed');
            return;
        }

        $idSetting = UUID::guidv4();
        $resutInsert = $db->insert('tb_setting_socmed', "id_setting_socmed = '{$idSetting}', id_status = '{$idStatus}', report_user_id = '{$idReporter}' ,not_interested = '0', report = '1'");


        if ($resutInsert) {
            echo json_encode('success');
            return;
        }

        echo json_encode('failed');
        return;
    }
}
