<?php
require_once("../../file/Database.php");

$db = new Database();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if (isset($obj['id_request'])) {

    $idRequest = $obj['id_request'];

    try {
        $query = 'SELECT id, id_user, image, periode, note, delivery_proof, status, create_at, update_at FROM tb_upload_ipl WHERE id = :id';
        $db->query($query);
        $db->bindData(':id', $idRequest);
        $request = $db->fetchAll();
        $houserNumber = '';
        $clusterName = '';

        if ($request[0]) {
            $idUser = $request[0]['id_user'];

            $query = 'SELECT name FROM tb_user WHERE id_user = :id';
            $db->query($query);
            $db->bindData(':id', $idUser);
            $dataWarga = $db->fetch();
            $name = $dataWarga['name'];

            $query = 'SELECT id_cluster, house_number FROM tb_population WHERE id_warga = :id';
            $db->query($query);
            $db->bindData(':id', $idUser);
            $population = $db->fetch();
            $idCluster = $population['id_cluster'];
            $houseNumber = $population['house_number'];

            $query = 'SELECT cluster FROM tb_cluster WHERE id_cluster = :idCluster';
            $db->query($query);
            $db->bindData(':idCluster', $idCluster);
            $cluster = $db->fetch();
            $clusterName = $cluster['cluster'];

            $request[0]['name'] = $name;
            $request[0]['cluster'] = $cluster['cluster'];
            $request[0]['house_number'] = $houseNumber;
        }





        echo json_encode($request, JSON_PRETTY_PRINT);
    } catch (PDOException $e) {
        echo json_encode('something went wrong');
    }
}
