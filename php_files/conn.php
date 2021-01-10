<?php
$address = "localhost";
$username = "root";
$password = "";
$database = "crm_demo";
$conn = new mysqli($address, $username, $password, $database);
if($conn)
{
    echo "Success";
}
else{
    echo "Failed";
}

?>
