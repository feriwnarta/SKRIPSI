<?php

$json = file_get_contents('php://input');
$obj = json_decode($json, true);

if (isset($obj['phone'])) {
    $targetPhone = $obj['phone'];

    $curl = curl_init();
    $token = "IL1VsEauUbDPWs78ErqPYkvA323H9uTkvtD3f72ODNXR9XDpYXdCnC0YtbNezi33";

    curl_setopt(
        $curl,
        CURLOPT_HTTPHEADER,
        array(
            "Authorization: $token",
            "url: https://pati.wablas.com",
        )
    );

    // check number phone is active ?
    curl_setopt($curl, CURLOPT_URL,  "https://phone.wablas.com/check-phone-number?phones=$targetPhone");
    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "GET");
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
    $result_active = curl_exec($curl);
    $result_active = json_decode($result_active, true);
    
    
    // DEPRECATED
    // if ($result_active['data'][0]['status'] == 'online') {
    //     echo json_encode('FOUND');
    // } else {
    //     echo json_encode('NOT FOUND');
    // }
    
    echo json_encode('FOUND');
}
