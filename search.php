<?php
$search = $_GET['search'];
echo $search;

$dbconn = pg_connect("host=localhost dbname=data user=user password=password");

if(!$dbconn) {
	die("Could not connect to database!\n");
}



?>

