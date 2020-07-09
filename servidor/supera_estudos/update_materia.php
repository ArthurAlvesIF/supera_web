<?php
	require_once "connection.php";
	$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "UPDATE materia SET 
	status = '{$_POST['status']}', 
	nome = '{$_POST['nome']}',
	id_usuario = '{$_POST['email_usuario']}'

	WHERE id = {$_POST['id']}";
	echo $sql;
	echo $conn->query($sql);

	$conn->close();	
?>