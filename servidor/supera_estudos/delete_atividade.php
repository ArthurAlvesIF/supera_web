<?php
	require_once "connection.php";
$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "DELETE FROM atividade WHERE id = {$_POST['id']};";
	$conn->query($sql);
	$conn->close();	
?>