<?php

require_once("../../file/function_proses.php");
$db = new db();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);

date_default_timezone_set('asia/jakarta');

if(isset($obj['no_ipl']) && isset($obj['id_user'])) {
    
    $no_ipl = mysqli_real_escape_string($db->query, $obj['no_ipl']);
    $month = date('m');
    $year = date('Y');
    $last_date = date('t');
    
    $first_index = $year . '-' . '01' . '-01';
    $this_index = $year . '-' . $month . '-' . $last_date;
    
    
    $first_priod = $year . '-01';
    $this_priod = $year . '-' . $month;
    
    $no_ipl = explode('/', $no_ipl);
    
    if(count($no_ipl) > 3) {
        $no_ipl = $no_ipl[0] . '/' . 'BAST' . '/' . $no_ipl[2] . '/' . $no_ipl[3];
    } else {
        $no_ipl = $obj['no_ipl'];
    }

    
    // query ambil id_population berdasarkan nomor bast
    $id_population = $db->select_rw('tb_population', 'code_population="' . $no_ipl . '"', 'id_population', 'ASC');
    $data_id_population = mysqli_fetch_assoc($id_population);
    
    
    // SELECT DISTINCT priod, number, date FROM `tb_cash_receipt_payment_detail` WHERE id_population = 2 AND priod >= '2022-01' AND priod <= '2022-12' GROUP BY priod DESC
    
    if(mysqli_num_rows($id_population) > 0) {
        $get_last_payment = $db->select_distinct_rw('tanggal_tgh, nomor_bast, nomor_tgh, nominal_tagihan, status, nominal_bayar', 'tb_invoice_fix', 'nomor_bast="' . $no_ipl . '" AND tanggal_tgh >= "' . $first_index . '" AND tanggal_tgh <= "' . $this_index . '"', 'tanggal_tgh', 'DESC');
    $data_invoice = array();
    
    while($data = mysqli_fetch_assoc($get_last_payment)) {
        $tgl_tgh = explode('-', $data['tanggal_tgh']);
        $tgl_tgh = $tgl_tgh[0] . '-' . $tgl_tgh[1];
        
        // query ke tb_cash_detail_payment
        $query_cash_detail_py = $db->select_distinct_rw('priod, number, date', 'tb_cash_receipt_payment_detail', 'id_population="' . $data_id_population['id_population'] . '" AND priod = "' . $tgl_tgh . '"' , 'priod', 'DESC');
        $query_cash_detail_py = mysqli_fetch_assoc($query_cash_detail_py);
        
        if($query_cash_detail_py['priod'] == null) {
            $status = 'unpaid';
        } else if (!is_null($query_cash_detail_py['priod'])) {
            $status = 'paid';
        }
        
        $data_invoice[] = array(
            'nomor_bast' => $data['nomor_bast'],
            'nomor_tgh' => $data['nomor_tgh'],
            'tanggal_tgh' => $data['tanggal_tgh'],
            'bulan_tagihan' => formatMonthYear($data['tanggal_tgh']),
            'nominal_tgh' => number_format($data['nominal_tagihan'], 0),
            'status' => $status,
            'tanggal_transaksi' => $query_cash_detail_py['date'],
            'pembayaran_priod'=> $query_cash_detail_py['priod'],
            'nominal_bayar' => $data['nominal_bayar']
        );
    }
    
    echo json_encode($data_invoice, JSON_PRETTY_PRINT);
       
    } else {
        echo json_encode('id_population tidak ada');
    }
}

function formatMonthYear($date):string {
    $bulan_tagihan = explode('-', $date);
    $year = $bulan_tagihan[0];
    $month;
    switch($bulan_tagihan[1]) {
        case '01' : $month = 'Januari'; break;
        case '02' : $month = 'Februari'; break;
        case '03' : $month = 'Maret'; break;
        case '04' : $month = 'April'; break;
        case '05' : $month = 'Mei'; break;
        case '06' : $month = 'Juni'; break;
        case '07' : $month = 'Juli'; break;
        case '08' : $month = 'Agustus'; break;
        case '09' : $month = 'September'; break;
        case '10' : $month = 'Oktober'; break;
        case '11' : $month = 'November'; break;
        case '12' : $month = 'Desember'; break;
        
    }
    return $month . ' ' . $year;
}

