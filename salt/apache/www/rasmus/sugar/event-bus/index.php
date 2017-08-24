<!DOCTYPE html>
<html>
<head>
  <title><?php echo $_SERVER["HTTP_HOST"] ?></title>
</head>

<body>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<?php
try {
	$mysqli = new mysqli('ymir.wejlgaard.com', 'events', 'N2F6jfBm', 'salt');

	// Oh no! A connect_errno exists so the connection attempt failed!
	if ($mysqli->connect_errno) {
	    echo "Oh no! This website is down. Lets hope it's not the monster who lives in the server closet again. Last time it ate Jimmy"
	}

	// Perform an SQL query
	$sql = "SELECT * FROM events ORDER BY id DESC";
	if (!$result = $mysqli->query($sql)) {
	    // Oh no! The query failed.
	    echo "Sorry, the website is experiencing problems.";

	    // Again, do not do this on a public site, but we'll show you how
	    // to get the error information
	    echo "Error: Our query failed to execute and here is why: \n";
	    echo "Query: " . $sql . "\n";
	    echo "Errno: " . $mysqli->errno . "\n";
	    echo "Error: " . $mysqli->error . "\n";
	    exit;
	}

	echo '<div class="table-responsive">';
	echo '<table class="table table-striped">';
	echo "<tr><th>id</th><th>time</th><th>tag</th><th>data</th>";
	while ($row = $result->fetch_assoc()) {
	    echo "<tr><td>" . $row['id'] . "</td><td>" . $row['time'] . "</td><td>" . $row['tag'] . "</td><td>" . $row['data'] . "</td></tr>";
	}

	echo "</table></div>";

	$result->free();
	$mysqli->close();

	/*$connection = mysql_connect('ymir.wejlgaard.com', 'events', 'N2F6jfBm');
	mysql_select_db('salt');
	$query = "SELECT * FROM events";
	$result = mysql_query($query);

	echo "<table>";

	while($row = mysql_fetch_array($result)){   //Creates a loop to loop through results
	    echo "<tr><td>" . $row['id'] . "</td><td>" . $row['id'] . "</td><td>" . $row['data'] . "</td></tr>";
	}

	echo "</table>";

	mysql_close();	*/
} catch (Exception $e) {
	die($e);
}
?>
<!--script src="http://<?php //echo $_SERVER["HTTP_HOST"];?>/v/0.2/strapdown.js"></script-->
</body>
</html>
