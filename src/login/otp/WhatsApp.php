<?php

class WhatsappOtp
{
    static function sendOtp($targetPhone, $message)
    {
        $curl = curl_init();
        // $token = "IL1VsEauUbDPWs78ErqPYkvA323H9uTkvtD3f72ODNXR9XDpYXdCnC0YtbNezi33";
        $token = "d440185ImAQSnbiUgDIp9owIdrYPIGTd1ERlxjPfETLIgZ89UEshc4WDOe2FKAut";

        $data = [
            'phone' => $targetPhone,
            'message' => $message,
            'prioprity' => true
        ];
        // curl_setopt(
        //     $curl,
        //     CURLOPT_HTTPHEADER,
        //     array(
        //         "Authorization: $token",
        //     )
        // );
        curl_setopt($curl, CURLOPT_HTTPHEADER,
            array(
                "Authorization: $token",
                "url: https://pati.wablas.com",
            )
        );
        
        // check number phone is active ?
        // curl_setopt($curl, CURLOPT_URL,  "https://phone.wablas.com/check-phone-number?phones=$targetPhone");
        // curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "GET");
        // curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        // curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        // curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        // $result_active = curl_exec($curl);
        // $result_active = json_decode($result_active, true);
         
        // var_dump($result_active);
        
        
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
            curl_setopt($curl, CURLOPT_URL,  "https://pati.wablas.com/api/send-message");
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
            $result = curl_exec($curl);
            $result = json_decode($result, true);
            
            $result = [
                'status' => $result['status'],
                'quota' => $result['data']['quota'],
            ];
        
        
        return $result;
    }
}