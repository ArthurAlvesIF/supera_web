<?php
	require_once "connection.php";
		$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "UPDATE conteudo SET 
	nome = '{$_POST['nome']}',
	id_materia = {$_POST['materia']},
	id_usuario = {$_POST['usuario']}

	WHERE id = {$_POST['id']}";
	//echo $sql;
	echo $conn->query($sql);

	$conn->close();	
?>