<?php
	require_once "connection.php";
	$data = json_decode(file_get_contents('php://input'), true);
	$_POST = $data;
	$sql = "INSERT INTO plano values(default, 
		'{$_POST['nome']}', 
		{$_POST['prazo']}, 
		'{$_POST['valor']}'
		);";
	$conn->query($sql);

	$sql = "SELECT * FROM plano ORDER BY id DESC LIMIT 1;";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
        	echo json_encode($row, JSON_UNESCAPED_UNICODE );;
    	}
	}

	$conn->close();	
?>