<?php
	require_once "connection.php";
	$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "INSERT INTO metodo values(default, '{$_POST['nome']}');";
	$conn->query($sql);
	
	
	$conn->close();	
die();
?>