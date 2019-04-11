<?php
// connect to database
include("../config/db.php");		
 $con=@mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
$search = strip_tags(trim($_GET['q'])); 

$query = mysqli_query($con, "SELECT * FROM Cliente WHERE ClienteNombre LIKE '%$search%' LIMIT 40");

$list = array();
while ($list=mysqli_fetch_array($query)){
	$data[] = array(
		'id' => $list['ClienteId'], 
		'text' => $list['ClienteNombre'],
		'email' => $list['ClienteEmail'],
		'telefono' => $list['ClienteTelefono'],
		'direccion' => $list['ClienteDireccion']
	);
}
// return the result in json
echo json_encode($data);
?>