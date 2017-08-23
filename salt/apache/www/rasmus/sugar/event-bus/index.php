<!DOCTYPE html>
<html>
<head>
  <title><?php echo $_SERVER["HTTP_HOST"] ?></title>
</head>

<body>
<?php
$connection = mysql_connect('ymir.wejlgaard.com', 'events', 'N2F6jfBm');
mysql_select_db('salt');
$query = "SELECT * FROM events";
$result = mysql_query($query);

echo "<table>";

while($row = mysql_fetch_array($result)){   //Creates a loop to loop through results
    echo "<tr><td>" . $row['id'] . "</td><td>" . $row['id'] . "</td><td>" . $row['data'] . "</td></tr>";
}

echo "</table>";

mysql_close();
?>
<script src="http://<?php echo $_SERVER["HTTP_HOST"];?>/v/0.2/strapdown.js"></script>
</body>
</html>
