<?php
	require_once "connection.php";
	$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$senha = md5($_POST['senha']);

	$sql = "SELECT * FROM usuario WHERE email = '{$_POST['email']}'";
	$result = $conn->query($sql);
	$saida = array();
	if ($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
    		if ($row['senha'] == $senha)
        		echo json_encode($row, JSON_UNESCAPED_UNICODE);		
        	else
        		echo json_encode("{\"erro\":\"senha incorreta\"}", JSON_UNESCAPED_UNICODE);		
        }
	}else 
		echo json_encode("{\"erro\":\"email não cadastrado\"}", JSON_UNESCAPED_UNICODE);
		
	$conn->close();	
?>