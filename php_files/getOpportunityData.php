<?php
include "conn.php";

$sql = $conn->query("select * from opportunities");
$res = array();
while ($row = $sql -> fetch_assoc()){
    $res[]=$row;
}
echo json_encode($res)
?>
