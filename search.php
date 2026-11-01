<?php
$search = $_GET['search'];
echo $search;

$dbconn = pg_connect("host=localhost dbname=sql_injection user=user password=password");

if(!$dbconn) {
	die("Could not connect to database!\n");
}

echo "\n";

$games = pg_query($dbconn, "SELECT * FROM games");

if(!$games) {
	die("Query Failed");
}

for($i = 0; $i < pg_num_rows($games); $i++) {
	$game = pg_fetch_assoc($games, $i);

	if($game) {
		echo $game["name"] . "\n";
		echo $game["price"] . "\n";
		echo $game["rating"];
	}
}


?>

