<?php

require_once("../../file/Database.php");

$db = new Database();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if (isset($obj['id_user']) && isset($obj['start']) && isset($obj['limit']) && isset($obj['type']) && isset($obj['category'])) {

    $idUser = $obj['id_user'];
    $start = $obj['start'];
    $limit = $obj['limit'];
    $category = $obj['category'];
    $type = $obj['type'];


    if (empty($idUser)) {
        echo json_encode('something went wrong');
        return;
    }

    if ($category == 'bd289fea-61bb-11ee-8ef3-2efab4205f52' || $category == 'Kantong Sampah') {
        getDataKantongSampah($db, $idUser, $start, $limit, $type);
        return;
    }
}

function getDataKantongSampah($db, $idUser, $start, $limit, $type)
{
    if ($type == 'Terkirim') {
        $type = 'Dikirim';
    }

    try {
        $query = 'SELECT id, id_user, image, note, periode, status, create_at 
                  FROM tb_upload_ipl 
                  WHERE id_user = :idUser AND status ' . ($type == 'All' ? 'NOT IN ("")' : '= :status') . '
                  ORDER BY id ASC
                  LIMIT :offset, :limit';
        $db->query($query);
        $db->bindData(':idUser', $idUser);
        $db->bindData(':offset', $start);
        if ($type != 'All') {
            $db->bindData(':status', $type);
        }
        $db->bindData(':limit', $limit);

        $dataHistoryPayment = $db->fetchAll();

        echo json_encode($dataHistoryPayment, JSON_PRETTY_PRINT);
    } catch (PDOException $e) {
        echo json_encode('something went wrong');
    }
}
