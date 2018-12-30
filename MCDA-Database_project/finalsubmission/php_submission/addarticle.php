<html>
<head><title>Add Article</title></head>
<body>
	

	<form action="insertarticle.php" method="POST">
	<b>Enter Article Details(Mandatory):</b>


	
	<p>
    
	Magazine ID <input type="text" name="maga_id"required> <p>
	<p>
	Volume ID <input type="text" name="vol_id"required> <p>

	<p>
	Enter Article Title<input type="text" name="article_title"required>


	<p>
	Enter Page Num<input type="text" name="page_num"required>

	<p>

    
	 <br> </br>
         <br> <b>Enter Auhtor Details</b></br>
		         <br> <b>Enter Auhtor 1 Details (Mandatory )</b></br>
		<p>
	Enter No 1 Author'sfname <input type="text" name="fname"required>

	<p>
		<p>
	Enter No 1  Author's lname <input type="text" name="lname"required>

	<p>
			<p>
	Enter No 1 Author's email <input type="text" name="email"required>

	<p>

     <br> <b>Enter Auhtor 2 Details (Optional )</b></br>

     <p>
	Enter No 2 Author'sfname <input type="text" name="fname1">

	<p>
		<p>
	Enter No 2 Author's lname <input type="text" name="lname1">

	<p>
		<p>
	Enter No 2 Author's email <input type="text" name="email1">

	<p>
    <br> <b>Enter Auhtor 3 Details (Optional )</b></br>
       <p>
	Enter No 3 Author'sfname <input type="text" name="fname2">

	<p>
		<p>
	Enter No 3 Author's lname <input type="text" name="lname2">

	<p>
		<p>
	Enter No 3Author's email <input type="text" name="email2">
    <p>


<input name="submit" type="submit" value="Add Article">
</form>
</body>
</html>






