<?php

include 'conn.php';

$name = $_POST['name'];
$title = $_POST['title'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$altphone = $_POST['altphone'];
$company = $_POST['company'];
$address1 = $_POST['address1'];
$address2 = $_POST['address2'];
$city = $_POST['city'];
$state =$_POST['state'];
$country = $_POST['country'];
$lastcontacteddate = $_POST['lastcontacteddate'];
$createddate = $_POST['createddate'];
$description = $_POST['description'];
$department = $_POST['department'];
$timezone = $_POST['timezone'];

$conn->query("insert into contacts values('".$name."','".$title."','".$email."','".$phone."','".$altphone."','".$company."','".$address1."','".$address2."','".$city."','".$state."','".$country."','".$lastcontacteddate."','".$createddate."','".$description."','".$department."','".$timezone."')")

?>
