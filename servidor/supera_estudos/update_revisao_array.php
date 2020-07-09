<?php
	require_once "connection.php";
	
	$sql = "UPDATE revisao_array SET 
	quantidade = {$_POST['quantidade']},
	id_atividade = {$_POST['id_atividade']}

	WHERE id = {$_POST['id']}";
	echo $sql;
	echo $conn->query($sql);

	$conn->close();	
?>