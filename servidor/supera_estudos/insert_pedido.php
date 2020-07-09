<?php
	require_once "connection.php";
	$sql = "INSERT INTO pedido values(default, 
		'{$_POST['data']}', 
		'{$_POST['forma_de_pagamento']}', 
		'{$_POST['status']}', 
		'{$_POST['subtotal']}', 
		'{$_POST['desconto']}', 
		'{$_POST['total']}', 
		'{$_POST['complemento']}', 
		{$_POST['id_usuario']});";
	$conn->query($sql);

	$sql = "SELECT * FROM pedido ORDER BY id DESC LIMIT 1;";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
        	echo json_encode($row, JSON_UNESCAPED_UNICODE );;
    	}
	}

	$conn->close();	
?>