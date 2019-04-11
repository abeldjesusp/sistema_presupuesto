<?php
$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
if($action == 'ajax'){
	/* Connect To Database*/
	require_once ("../config/db.php");
	require_once ("../config/conexion.php");
	
	if (isset($_REQUEST['id'])){
		$id=intval($_REQUEST['id']);
		$delete=mysqli_query($con,"delete from Tmp where TmpId='$id'");
	}
	
	if (isset($_POST['descripcion'])){
		
		$descripcion=mysqli_real_escape_string($con,$_POST['descripcion']);
		$cantidad=intval($_POST['cantidad']);
		$precio=floatval($_POST['precio']);
		$sql="INSERT INTO `Tmp` (`TmpId`, `TmpDescripcion`, `TmpCantidad`, `TmpPrecio`) VALUES (NULL, '$descripcion', '$cantidad', '$precio');";
		$insert=mysqli_query($con,$sql);
	}
	
	$query=mysqli_query($con,"select * from Tmp order by TmpId");
	$items=1;
	$suma=0;
	while($row=mysqli_fetch_array($query)){
			$total=$row['TmpCantidad']*$row['TmpPrecio'];
			$total=number_format($total,2,'.','');
		?>
	<tr>
		<td class='text-center'><?php echo $items;?></td>
		<td><?php echo $row['TmpDescripcion'];?></td>
		<td class='text-center'><?php echo $row['TmpCantidad'];?></td>
		<td class='text-right'><?php echo $row['TmpPrecio'];?></td>
		<td class='text-right'><?php echo $total;?></td>
		<td class='text-right'><a href="#" onclick="eliminar_item('<?php echo $row['TmpId']; ?>')" ><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAeFBMVEUAAADnTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDznTDx+VWpeAAAAJ3RSTlMAAQIFCAkPERQYGi40TVRVVlhZaHR8g4WPl5qdtb7Hys7R19rr7e97kMnEAAAAaklEQVQYV7XOSQKCMBQE0UpQwfkrSJwCKmDf/4YuVOIF7F29VQOA897xs50k1aknmnmfPRfvWptdBjOz29Vs46B6aFx/cEBIEAEIamhWc3EcIRKXhQj/hX47nGvt7x8o07ETANP2210OvABwcxH233o1TgAAAABJRU5ErkJggg=="></a></td>
	</tr>	
		<?php
		$items++;
		$suma+=$total;
	}
	?>
	<tr>
		<td colspan='6'>
		
			<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span> Agregar Ítem</button>
		</td>
	</tr>
	<tr>
		<td colspan='4' class='text-right'>
			<h4>TOTAL USD</h4>
		</td>
		<th class='text-right'>
			<h4><?php echo number_format($suma,2);?></h4>
		</th>
		<td></td>
	</tr>
<?php

}