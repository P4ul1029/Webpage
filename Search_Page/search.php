<?php 

    $home_path = $_SERVER['DOCUMENT_ROOT'];
    $config_path =  "../database_config.php";
    include $config_path;

    if ($_SERVER["REQUEST_METHOD"] == "GET") {
        
        $where = $_GET["where"];
        $checkIn = $_GET["checkIn"];
        $checkOut = $_GET["checkOut"];
        $numberOfGuests = $_GET["numberOfGuests"];
        
        $searchQuery = "";
        $result = pg_query($db_connection, $searchQuery);
        
        if($result) {
            $array = pg_fetch_all($result);
            $_SESSION["search_result"] = $array;
            header('Location: /temp/Webpage/Results_Page/Results_Page.html');
        }
    }

?>