<html>
<title>
print_users.php
</title>
</head>
<body>

<?php

function prtable($table) {
	print "<table border=1>\n";
	while ($a_row = mysqli_fetch_row($table)) {
		print "<tr>";
		foreach ($a_row as $field) print "<td>$field</td>";
		print "</tr>";
	}
	print "</table>";
}

//Import Everything that is in dbguest.php
require_once"config.php";



//Variable with the table name
$table = "users";

//Run query. Here we are performing select query
//mysqli_query will execute the query and stores into $result

$result = mysqli_query($link, "select * from $table");

//mysqli_num_rows gives number of rows in the table 
$num_rows = mysqli_num_rows($result);
print "There are $num_rows account registered in table<p>";

//It will print the result in the form of table 
prtable($result);

//Close the connection
mysqli_close($link);

print "<p><p>Connection closed. Bye..."
?>

<p>
	
<a href="signup.php"> signup a new account</a>
<p>
<a href="login.php"> login now</a>
</body>

</html>

i
