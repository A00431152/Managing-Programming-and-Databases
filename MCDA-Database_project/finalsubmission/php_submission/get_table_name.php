<html>
<head>
<title>
get_table_name.php
</title>
</head>
<body>


<form action="print_table.php" method="POST">
<b>Enter the name of the table you want to post:</b>
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

require("/home/student_2018_fall/b_shree/dbguest.php");

$link = mysqli_connect($host, $user, $pass);
if (!$link) die("Couldn't connect to MySQL");
#print "Successfully connected to server<p>";

mysqli_select_db($link, $db)
        or die("Couldn't open $db: ".mysqli_error($link));
#print "Successfully selected database \"$db\"<p>";

$result = mysqli_query($link, "show tables");

if (!$result) print("ERROR: ".mysqli_error($link));
else {
    $num_rows = mysqli_num_rows($result);
    print "\n\nThere are $num_rows the following tables in the DB\n<p>";
    prtable($result);
}

mysqli_close($link);

#print "<p><p>Connection closed. Bye..."
?>
<input type="text" name="table"required>
<p>
	
<input type="submit" value="Submit">
</form>

<p>
<a href="main.php"> back to MAIN menu</a>

</body>
</html>

