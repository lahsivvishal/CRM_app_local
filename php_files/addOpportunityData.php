<?php

include 'conn.php';

$name = $_POST['name'];
$company = $_POST['company'];
$stage = $_POST['stage'];
$closeDate = $_POST['closeDate'];
$value =$_POST['value'];
$createdDate = $_POST['createdDate'];
$Description = $_POST['description'];


$conn->query("insert into opportunities values('".$name."','".$company."','".$stage."','".$closeDate."','".$value."','".$createdDate."','".$description."')")


?>
