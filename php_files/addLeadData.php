<?php

include 'conn.php';

$name = $_POST['name'];
$title = $_POST['title'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$altPhone = $_POST['altPhone'];
$company = $_POST['company'];
$leadSource = $_POST['leadSource'];
$address1 = $_POST['address1'];
$address2 = $_POST['address2'];
$city = $_POST['city'];
$state =$_POST['state'];
$country = $_POST['country'];
$lastContactedDate = $_POST['lastContactedDate'];
$createdDate = $_POST['createdDate'];
$description = $_POST['description'];
$department = $_POST['department'];
$timeZone = $_POST['timeZone'];

$conn->query("insert into leads values('".$name."','".$title."','".$email."','".$phone."','".$altPhone."','".$company."','".$leadSource."','".$address1."','".$address2."','".$city."','".$state."','".$country."','".$lastContactedDate."','".$createdDate."','".$description."','".$department."','".$timeZone."')")

?>
