<?php
require_once("../../file/Database.php");

$db = new Database();
$json = file_get_contents('php://input');
$obj = json_decode($json, true);


if (isset($obj['content']) && isset($obj['id_user'])) {

    $content = $obj['content'];
    $idUser = $obj['id_user'];

    try {
        $content = "%{$content}%"; // Tambahkan tanda persen untuk wildcard

        $query = "SELECT * FROM tb_upload_ipl
        WHERE (periode LIKE :content
           OR status LIKE :content
           OR note LIKE :content)
        AND id_user = :id";


        $db->query($query);
        $db->bindData(':content', $content);
        $db->bindData(':id', $idUser);
        $result = $db->fetchAll();

        echo json_encode($result, JSON_PRETTY_PRINT);
    } catch (PDOException $e) {
        echo json_encode('something went wrong');
    }
}
