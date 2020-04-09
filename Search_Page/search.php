<?php 

    $home_path = $_SERVER['DOCUMENT_ROOT'];
    $config_path =  "../database_config.php";
    include $config_path;

    if ($_SERVER["REQUEST_METHOD"] == "GET") {
        
        $where = $_GET["where"];
        $checkIn = $_GET["checkIn"];
        $checkOut = $_GET["checkOut"];
        $numberOfGuests = $_GET["numberOfGuests"];
        
        $searchQuery = "CREATE VIEW UnrentedProperties AS
            SELECT p.*
            FROM AirBnB_Group_40.properties_table p
            WHERE p.start_date = '$checkIn' and p.end_date = '$checkOut' and accomodates_count = '$numberOfGuests'
            LEFT OUTER JOIN AirBnB_Group_40.bookings_table ON p.id = b.property_id;";
        
        $result = pg_query($db_connection, $searchQuery);
        
        if($result) {
            $array = pg_fetch_all($result);
            $_SESSION["search_result"] = $array;
            header('Location: /temp/Webpage/Results_Page/Results_Page.html');
        }
    }

?>