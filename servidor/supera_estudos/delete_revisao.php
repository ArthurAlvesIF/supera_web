<?php
	require_once "connection.php";
	$sql = "DELETE FROM revisao WHERE id = {$_POST['id']};";
	$conn->query($sql);
	$conn->close();	
?>