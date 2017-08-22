<!DOCTYPE html>
<html>
<head>
  <title><?php echo $_SERVER["HTTP_HOST"] ?></title>
</head>

<body style="direction: rtl;">
<textarea theme="simplex" style="display:none;">
<div>
	<a href="/">en</a>
	<a href="/he">he</a>
</div>
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
<script src="http://<?php echo $_SERVER["HTTP_HOST"];?>/v/0.2/strapdown.js"></script>
</body>
</html>