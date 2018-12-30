<html>
<head><title></title></head>
<body>
	

	<?php

    $mag_id = $_POST['mag_id'];
	$mag_price = $_POST['mag_price'];
	$mag_name = $_POST['mag_name'];


	require("/home/student_2018_fall/b_shree/dbguest.php");

	$link = mysqli_connect($host, $user, $pass);
	if (!$link) die("Couldn't connect to MySQL");

	mysqli_select_db($link, $db)
	or die("Couldn't open $db: ".mysqli_error($link));

     
   $flagm = false;
  $sqlMagId = "SELECT _id FROM ITEM WHERE _id ='$mag_id'";
  $resultMagId = mysqli_query($link,$sqlMagId);
  while ($rowm = mysqli_fetch_assoc($resultMagId)) {
      $flagm = true;
      echo "Item  Id exists in table ,hence magazine and item not inserted ";
     
     
    }
    if ($flagm == false){
       
     
      $sqlInsertItem = "INSERT into ITEM(_id,price) VALUES('{$mag_id}','{$mag_price}')";
         $resultItemInsert = mysqli_query($link,$sqlInsertItem);
        if(!$resultItemInsert){
        echo "insertion into Item table failed .mysqli_error($link).";

         }
         else  echo "insertion into Item  done";

         $sqlInsertMagazine = "INSERT into MAGAZINE(_id,name) VALUES('{$mag_id}','{$mag_name}')";
         $resultMagInsert = mysqli_query($link,$sqlInsertMagazine);
        if(!$resultMagInsert){
        echo "insertion into Magazine table failed";

         }
         else  echo "insertion into Magazine done";


         
       }
	mysqli_close($link);

	?>

	<br><br><a href="main.php">Back to Main Page</a>

</body>
</html>