<?php
	require_once "connection.php";
	$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "SELECT * FROM usuario WHERE email = '{$_POST['email']}';";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
        	echo json_encode("{\"erro\":\"email já cadastrado\"}", JSON_UNESCAPED_UNICODE );
			exit();
    	}
	}
	
	$senha = md5($_POST['senha']);
	$sql = "INSERT INTO usuario values(default, 
		'{$_POST['nome']}', 
		'{$_POST['email']}', 
		'{$senha}', 
		'{$_POST['telefone']}', 
		'{$_POST['rua']}', 
		{$_POST['numero']}, 
		'{$_POST['complemento']}', 
		'{$_POST['bairro']}', 
		'{$_POST['cidade']}', 
		'{$_POST['estado']}', 
		'{$_POST['cep']}', 
		'{$_POST['cpf']}');";
	$conn->query($sql);

	$sql = "SELECT * FROM usuario ORDER BY id DESC LIMIT 1;";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
        	echo json_encode($row, JSON_UNESCAPED_UNICODE );
    	}
	}

	$conn->close();	
?>