<?php
	require_once "connection.php";
	$sql = "DELETE FROM  pedido WHERE id = {$_POST['id']};";
	$conn->query($sql);
	$conn->close();	
?>