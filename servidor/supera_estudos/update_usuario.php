<?php
	require_once "connection.php";
	$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "UPDATE usuario SET 
	nome = '{$_POST['nome']}', 
	email = '{$_POST['email']}', 
	senha = '{$_POST['senha']}',
	telefone = '{$_POST['telefone']}',
	rua = '{$_POST['rua']}',
	numero = '{$_POST['numero']}',
	complemento = '{$_POST['complemento']}',
	bairro = '{$_POST['bairro']}',
	cidade = '{$_POST['cidade']}',
	estado = '{$_POST['estado']}',
	cep = '{$_POST['cep']}',
	cpf = '{$_POST['cpf']}'

	WHERE id = {$_POST['id']}";
	echo $sql;
	echo $conn->query($sql);

	$conn->close();	
?>