<?php
	require_once "connection.php";
	$sql = "DELETE FROM revisao_array WHERE id = {$_POST['id']};";
	$conn->query($sql);
	$conn->close();	
?>