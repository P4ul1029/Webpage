<?php 

    $username = "amerc084";
    $password = "Jbrdg99824.";
    $host = "web0.eecs.uottawa.ca";
    $port = "15432";
    $database_name = "group_140";
    
    $db_connection = pg_connect("host='$host' port='$port' dbname='$database_name' user='$username' password='$password'") OR die('Unable to connect to database! Please try again later.');
?>