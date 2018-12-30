<html>
<head><title>Add Transaction</title></head>
<body>
	

	<form action="insertTransaction.php" method="POST">
	<b>Enter Transaction Details:</b>

	<p>
	Enter Item ID<input type="text" name="itemid"required>


	<p>
	Enter Item Quantity<input type="text" name="quantity"required>

	<p>
	Customer Name <select name="cusid">
	<?php
	require("/home/student_2018_fall/b_shree/dbguest.php");

	$link = mysqli_connect($host, $user, $pass);
	if (!$link) die("Couldn't connect to MySQL");

	mysqli_select_db($link, $db)
	or die("Couldn't open $db: ".mysqli_error($link));
	function prtable($table) {
		while ($a_row = mysqli_fetch_row($table)) {
			print "<option value=\"$a_row[0]\">CID : $a_row[0]</option>";
		}
	}
	$result = mysqli_query($link, "SELECT cid FROM CUSTOMERS");

	prtable($result);

	mysqli_close($link);
	?>
</select>

<input name="submit" type="submit" value="Add Transaction">
</form>
</body>
</html>






