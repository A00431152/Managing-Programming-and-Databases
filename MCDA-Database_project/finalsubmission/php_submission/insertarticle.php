<html>
<head><title></title></head>
<body>
	

	<?php

	$article_title = $_POST['article_title'];
	$page_num = $_POST['page_num'];
	$vol_id = $_POST['vol_id'];
  $mag_id = $_POST['maga_id'];
  
	$fname = $_POST['fname'];
	$lname = $_POST['lname'];
	$email = $_POST['email'];

  $fname1 = $_POST['fname1'];
  $lname1 = $_POST['lname1'];
  $email1 = $_POST['email1'];

   $fname2 = $_POST['fname2'];
  $lname2 = $_POST['lname2'];
  $email2 = $_POST['email2'];

    
	require("/home/student_2018_fall/b_shree/dbguest.php");

	$link = mysqli_connect($host, $user, $pass);
	if (!$link) die("Couldn't connect to MySQL");

	mysqli_select_db($link, $db)
	or die("Couldn't open $db: ".mysqli_error($link));
     

  //  $flagm = false;
  $sqlMag = "SELECT * FROM MAGAZINE WHERE  _id = $mag_id ";
  $result = mysqli_query($link,$sqlMag);

  if (mysqli_num_rows($result) == 0){
       echo " Magazine details doesnt exist - insert magazine first";
        echo "<a href= 'addMagazine.php'> Go back to add magazine </a> <br>";
        echo "<a href= 'main.php'> Back to main page </a> <br>";
        exit;
    }
     

      $sqlvol = "SELECT * FROM MAGAZINE_VOLUME WHERE  magazine_id = $mag_id and vol_id =$vol_id";
  $result1 = mysqli_query($link,$sqlvol);

  if (mysqli_num_rows($result1) == 0){
       echo " Volume does'nt exist for the corresponding Magazine - insert volume in volume table";
        echo "<a href= 'addVolume.php'> Go back to add magazine Volume </a> <br>";
        echo "<a href= 'main.php'> Back to main page </a> <br>";
        exit;
    }
    



	
	  $sqlInsertArticle = "INSERT into ARTICLE(vol_id,article_title,page_num) VALUES('{$vol_id}','{$article_title}','{$page_num}')"; 
   $resultArticleInsert = mysqli_query( $link, $sqlInsertArticle);
                  $articleid = mysqli_insert_id($link);
                

    if(!$resultArticleInsert){
    	     printf("error message is ".mysqli_error($link)."<br>");
       
       echo  "<strong> insertion into article table failed :  Please check the error message above <br>";
          echo "<a href= 'addVolume.php'> Add Volume</a> <br>";

          echo "<a href= 'main.php'> Back to Main Page </a> <br>";

                exit;

    }
      else  
          echo "<strong>insertion into article done</strong><br>"; 
         

 
      $flag = false;
  $sqlAuthorName = "SELECT _id FROM AUTHOR  WHERE fname = '$fname' and lname = '$lname'";
  $resultAuthorName = mysqli_query($link,$sqlAuthorName);
  while ($row = mysqli_fetch_assoc($resultAuthorName)) {
      $flag = true;
     echo "<strong >author name already  exists in table , hence author is not inserted </strong><br>"; 

       $authorid  = $row['_id'];
    }
    if ($flag == false){
      $sqlInsertAuthor = "INSERT into AUTHOR(fname,lname,email) VALUES('{$fname}','{$lname}','{$email}')";
         $resultAuthorInsert = mysqli_query($link,$sqlInsertAuthor);

         $authorid = mysqli_insert_id($link);
                 
        if(!$resultAuthorInsert){
         echo "<strong>insertion into author table failed </strong><br>"; 
          exit;
         }
         else  
            echo "<strong>insertion into author done </strong><br>";  
       }

       
       $sqlInsertArticleAuthor = "INSERT into ARTICLE_AUTHOR(author_id,article_id) VALUES('{$authorid}','{$articleid}')";
  $resultArticleAuthorInsert = mysqli_query( $link,$sqlInsertArticleAuthor);
       if(!$resultArticleAuthorInsert){

            echo "<strong>insertion into articleauthor table failed </strong><br>"; 
            exit;
       	 }
         else 
         
            echo "<strong>insertion into articleauthor done </strong><br>"; 


         if($fname1 == NULL  or $lname1 == NULL or $email1 == NULL)
              echo " <strong>author 2 details is null hence not inserted into database</strong><br>"; 
               

           else {
                $flag1 = false;
  $sqlAuthorName1 = "SELECT _id FROM AUTHOR  WHERE fname = '$fname1' and lname = '$lname1'";
  $resultAuthorName1 = mysqli_query($link,$sqlAuthorName1);
  while ($row1 = mysqli_fetch_assoc($resultAuthorName1)) {
      $flag1= true;
       echo "<strong>author2 name already  exists in table , hence author2 is not inserted</strong><br> "; 
       $authorid1  = $row1['_id'];
    }
    if ($flag1 == false){
      $sqlInsertAuthor1= "INSERT into AUTHOR(fname,lname,email) VALUES('{$fname1}','{$lname1}','{$email1}')";
         $resultAuthorInsert1 = mysqli_query($link,$sqlInsertAuthor1);

         $authorid1 = mysqli_insert_id($link);
         
        
        if(!$resultAuthorInsert1){
        echo "insertion into author table failed for author 2 ";
        exit; 

         }
         else 
          echo "<strong>insertion into author done for author 2</strong><br>";  
       } 
      $sqlInsertArticleAuthor1 = "INSERT into ARTICLE_AUTHOR(author_id,article_id) VALUES('{$authorid1}','{$articleid}')";
  $resultArticleAuthorInsert1 = mysqli_query( $link,$sqlInsertArticleAuthor1);
       if(!$resultArticleAuthorInsert1){

              echo "insertion into articleauthor table failed for author 2<br>";  
              exit;
         }
         else 
         
         echo "<strong>insertion into articleauthor done for author 2 </strong><br>";  
            
        }


        if($fname2 == NULL  or $lname2 == NULL or $email2 == NULL)
             echo " <strong> author 3 details is null hence not inserted into database </strong><br>";  
           else{
                $flag2 = false;
  $sqlAuthorName2 = "SELECT _id FROM AUTHOR  WHERE fname = '$fname2' and lname = '$lname2'";
  $resultAuthorName2 = mysqli_query($link,$sqlAuthorName2);
  while ($row2 = mysqli_fetch_assoc($resultAuthorName2)) {
      $flag2= true;
       echo "<strong>author3 name already  exists in table , hence author3 is not inserted </strong><br>";
       $authorid2  = $row2['_id'];
    }
    if ($flag2 == false){
      $sqlInsertAuthor2= "INSERT into AUTHOR(fname,lname,email) VALUES('{$fname2}','{$lname2}','{$email2}')";
         $resultAuthorInsert2 = mysqli_query($link,$sqlInsertAuthor2);

         $authorid2 = mysqli_insert_id($link);
         
        
        if(!$resultAuthorInsert2){
        echo "<strong>insertion into author table failed for author 3</strong><br>";
              exit;

         }
         else  
          echo "<strong>insertion into author done for author 3</strong><br>"; 
       }
      $sqlInsertArticleAuthor2 = "INSERT into ARTICLE_AUTHOR(author_id,article_id) VALUES('{$authorid2}','{$articleid}')";
  $resultArticleAuthorInsert2 = mysqli_query( $link,$sqlInsertArticleAuthor2);
       if(!$resultArticleAuthorInsert2){

              echo "<strong>insertion into articleauthor table failed for author 3</strong><br>";
              exit;
         }
         else 
         
           echo "<strong>insertion into articleauthor done for author 3 </strong><br>"; 
       
          }



	mysqli_close($link);


	?>
  
	<br><br><a href="main.php">Back to Main Page</a>

</body>
</html>