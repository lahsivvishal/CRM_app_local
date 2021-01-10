<?php

include 'conn.php';

$name = $_POST['name'];
$address = $_POST['address'];
$opportunities = $_POST['opportunities'];
$pipelineRevenue = $_POST['pipelineRevenue'];
$revenueAchieved =$_POST['revenueAchieved'];
$city = $_POST['city'];
$state = $_POST['state'];
$country = $_POST['country'];
$zipcode = $_POST['zipcode'];
$phone = $_POST['phone'];
$timezone = $_POST['timezone'];
$tags = $_POST['tags'];

$conn->query("insert into companies values('".$name."','".$address."','".$opportunities."','".$pipelineRevenue."','".$revenueAchieved."','".$city."','".$state."','".$country."','".$zipcode."','".$phone."','".$timezone."','".$tags."')")


?>
