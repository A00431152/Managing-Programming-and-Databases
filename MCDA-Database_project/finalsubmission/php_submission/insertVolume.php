<html>
<head><title></title></head>
<body>
	

	<?php

    $mag_id = $_POST['mag_id'];
    $mag_vol =$_POST['mag_vol'];
    $pub_year =$_POST['pub_year'];

	
	require("/home/student_2018_fall/b_shree/dbguest.php");

	$link = mysqli_connect($host, $user, $pass);
	if (!$link) die("Couldn't connect to MySQL");

	mysqli_select_db($link, $db)
	or die("Couldn't open $db: ".mysqli_error($link));

     
   $flagm = false;
  $sqlMagId = "SELECT _id FROM MAGAZINE WHERE _id = '$mag_id'";
  $resultMagId = mysqli_query($link,$sqlMagId);
  while ($rowm = mysqli_fetch_assoc($resultMagId)) {
      $flagm = true;
      $sqlInsertVol = "INSERT into MAGAZINE_VOLUME(vol_id,publication_year,magazine_id) VALUES('{$mag_vol}','{$pub_year}','{$mag_id}')";
         $resultVolInsert = mysqli_query($link,$sqlInsertVol);
        if(!$resultVolInsert){
        echo "insertion into Volume  table not done";

         }
         else  echo "insertion into Volume table  done";




    }
    if ($flagm == false){

       echo "insertion of Volume cannot be done because Magazine does'nt exist. Click the link to enter Magzine details";
       


    }
      


	mysqli_close($link);


	?>

	<br><br><a href="main.php">Back to Main Page</a>

</body>
</html>