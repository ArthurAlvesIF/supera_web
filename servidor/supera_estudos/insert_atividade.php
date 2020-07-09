<?php
	require_once "connection.php";
	$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "INSERT INTO atividade values(default, 
		'{$_POST['nome']}', 
		{$_POST['materia']}, 
		{$_POST['usuario']}, 
		{$_POST['metodo']}, 
		'{$_POST['data_inicio']}', 
		'{$_POST['data_fim']}', 
		'{$_POST['status']}', 
		'{$_POST['cronometro']}');";
	$conn->query($sql);
	$sql = "SELECT * FROM atividade ORDER BY id DESC LIMIT 1;";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
        	echo json_encode($row, JSON_UNESCAPED_UNICODE );;
    	}
	}
	$conn->close();	
?>