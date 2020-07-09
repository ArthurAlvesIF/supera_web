<?php
	require_once "connection.php";
	$data = json_decode(file_get_contents('php://input'), true);
    
	$_POST = $data;
	$sql = "UPDATE plano SET 
	nome = '{$_POST['nome']}',
	prazo = {$_POST['prazo']},
	valor = '{$_POST['valor']}'

	WHERE id = {$_POST['id']}";
	echo $sql;
	echo $conn->query($sql);

	$conn->close();	
?>