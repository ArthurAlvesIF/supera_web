<?php
	require_once "connection.php";
	$sql = "SELECT * FROM revisao;";
	$result = $conn->query($sql);
	$saida = array();
	if ($result->num_rows > 0) {
    	while($row = $result->fetch_assoc()) {
        	array_push($saida, $row);
        }
    	echo json_encode($saida, JSON_UNESCAPED_UNICODE );
	}else 
		echo json_encode("[]", JSON_UNESCAPED_UNICODE);

	$conn->close();	
?>