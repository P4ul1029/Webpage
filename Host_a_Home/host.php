<?php 

    $home_path = $_SERVER['DOCUMENT_ROOT'];
    $config_path =  "../database_config.php";
    include $config_path;

    if ($_SERVER["REQUEST_METHOD"] == "GET") { 
        
        $host_id = $_SESSION["id"];
        $title = $_GET["title"];
        $description = $_GET["description"];
        $propreties = $_GET["propreties"];
        
        //Address
        $street = $_GET["street"];
        $city = $_GET["city"];
        $province = $_GET["title"];
        $postalCode = $_GET["title"];
        $country = $_GET["title"];
        
        //Number of rooms
        $bedrooms = $_GET["bedroom"];
        $bathrooms = $_GET["bathrooms"];
        $startDate= $_GET["startDate"];
        $endDate= $_GET["endDate"];
        
        $rate = $_GET["rate"];
        
        $timestamp = date('Y-m-d H:i:s');

        
        $randomId = rand(100, 999);
        $postQuery = "INSERT INTO AirBnB_Group_40.propreties_table (id, name, description, host_id, bedroom_count, bathroom_count, start_date, end_date, created_at, modified_at, status) VALUES ('$randomId', '$title', '$description', '$host_id', '$bedrooms', '$bathrooms', '$startDate', '$endDate', 
        '$timestamp', '$timestamp', active)";
        
        $result = pg_query($db_connection, $postQuery);
        
        if($result) {
            header('Location: /temp/Webpage/Listed_Home/Listed_Home.html');
        }
        
    }

?>