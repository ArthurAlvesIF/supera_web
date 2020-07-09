<?php
	require_once "connection.php";
	$sql = "INSERT INTO revisao values(default, 
		'{$_POST['nome']}');";
	$conn->query($sql);

	$sql = "SELECT * FROM revisao ORDER BY id DESC LIMIT 1;";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
        	echo json_encode($row, JSON_UNESCAPED_UNICODE );;
    	}
	}

	$conn->close();	
?>