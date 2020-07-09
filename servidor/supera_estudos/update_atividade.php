<?php
	require_once "connection.php";
			$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "UPDATE atividade SET 
	nome = '{$_POST['nome']}', 
	id_materia = {$_POST['materia']},
	id_usuario = {$_POST['usuario']},
	id_metodo =  {$_POST['metodo']},
	data_inicio = '{$_POST['data_inicio']}',
	data_fim = '{$_POST['data_fim']}',
	status = '{$_POST['status']}',
	cronometro = '{$_POST['cronometro']}'

	WHERE id = {$_POST['id']}";

	echo $conn->query($sql);

	$conn->close();	
?>