<!DOCTYPE html>
<html>
<head>
  <title><?php echo $_SERVER["HTTP_HOST"] ?></title>
</head>

<body>
<textarea theme="simplex" style="display:none;">
<?php
$handle = fopen("main.md", "r");
if ($handle) {
    while (($line = fgets($handle)) !== false) {
		echo $line;        
    }   
    fclose($handle);
} else {
    echo "unable to read main.md";
}
?>
</textarea>
<script src="http://ziva.wejlgaard.com/v/0.2/strapdown.js"></script>
</body>
</html>
