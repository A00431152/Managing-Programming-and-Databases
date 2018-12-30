<html>
<head>
<title>
deleteTransaction.php
</title>
</head>
<body>

<?php

//It will get value of table which is passed in the textbox 
$transactionNum= $_POST["transactionNum"];


require("/home/student_2018_fall/b_shree/dbguest.php");

$link = mysqli_connect($host, $user, $pass);
if (!$link) die("Couldn't connect to MySQL");
print "Successfully connected to server<p>";

mysqli_select_db($link, $db)
	or die("Couldn't open $db: ".mysqli_error($link));
print "Successfully selected database \"$db\"<p>";





$check = mysqli_query($link, "select DATE_FORMAT(trans_date, '%Y%m%d'), DATE_FORMAT(NOW(), '%Y%m%d') from TRANSACTION where trans_id = '$transactionNum'");
if (mysqli_num_rows($check) > 0)
{
	$current = mysqli_fetch_row($check);
	$days = (int)$current[1] - (int)$current[0];
	if ($days <= 30)

	{
		
		$deletefromTransItems = mysqli_query($link,"delete from TRANSACTION_ITEMS where trans_id = '$transactionNum'");
		if ($deletefromTransItems)
		echo 'Deleted from Transaction Item';
		$deletefromTransaction = mysqli_query($link,"delete from TRANSACTION where trans_id = $transactionNum");
		if($deletefromTransaction)
		echo '        Deleted from Transaction';
	}
}


else
{
	echo 'Sorry, transaction does not exist or is more than 30 days old';
}


mysqli_close($link);

print "<p><p>Connection closed. Bye..."
?>

<p>
<a href="cancel_transaction.php"> back </a><br>
<a href="main.php"> back to MAIN menu</a>

</body>
</html>


