<?php
	require_once "connection.php";
	
	$sql = "UPDATE pedido SET 
	data = '{$_POST['data']}', 
	forma_de_pagamento = '{$_POST['forma_de_pagamento']}', 
	status = '{$_POST['status']}',
	sub_total = '{$_POST['sub_total']}',
	desconto = '{$_POST['desconto']}',
	total = '{$_POST['total']}',
	complemento = '{$_POST['complemento']}',
	id_usuario = '{$_POST['id_usuario']}',
	cidade = '{$_POST['cidade']}',
	estado = '{$_POST['estado']}',
	cep = '{$_POST['cep']}',
	cpf = '{$_POST['cpf']}'

	WHERE id = {$_POST['id']}";
	echo $sql;
	echo $conn->query($sql);

	$conn->close();	
?>