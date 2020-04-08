<?php 

    $home_path = $_SERVER['DOCUMENT_ROOT'];
    $config_path =  "../database_config.php";
    include $config_path;

    if ($_SERVER["REQUEST_METHOD"] == "GET") { 
        
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
        
        $postQuery = "";
        
        $result = pg_query($db_connection, $postQuery);
        
        if($result) {
            header('Location: /temp/Webpage/Listed_Home/Listed_Home.html');
        }
        
    }

?>