<?php

require_once("../../file/Database.php");

$db = new Database();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if (isset($obj['id_user'])) {

    try {
        $query = 'SELECT id, id_master_category, category, icon FROM tb_category_request';
        $db->query($query);
        $categories = $db->fetchAll();

        echo json_encode($categories, JSON_PRETTY_PRINT);
    } catch (PDOException $e) {
        echo json_encode('something went wrong');
    }
}
