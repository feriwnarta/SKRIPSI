<?php

class WhatsappOtp
{
    static function sendOtp($targetPhone, $message)
    {
        $curl = curl_init();
        $token = "AfxjYTFm9CGUh0JUwK3hD8Pu2XAeeQMRyLChqShFZNELTSnmaFAlK5qEfSYZmsZ9";

        $data = [
            'phone' => $targetPhone,
            'message' => $message,
        ];
        curl_setopt(
            $curl,
            CURLOPT_HTTPHEADER,
            array(
                "Authorization: $token",
            )
        );
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($curl, CURLOPT_URL,  "https://pati.wablas.com/api/send-message");
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        $result = curl_exec($curl);
        curl_close($curl);
        $result = json_decode($result, true);
        return $result['status'];
    }
}

echo WhatsappOtp::sendOtp('081299799019', 'wara wiri wek wek wek');


