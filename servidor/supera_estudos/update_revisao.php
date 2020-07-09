<?php
	require_once "connection.php";
	
	$sql = "UPDATE revisao SET 
	nome = '{$_POST['nome']}'

	WHERE id = {$_POST['id']}";
	echo $sql;
	echo $conn->query($sql);

	$conn->close();	
?>