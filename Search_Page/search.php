<?php 

    $home_path = $_SERVER['DOCUMENT_ROOT'];
    $config_path =  "../database_config.php";
    include $config_path;

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        
        $where = $_POST["where"];
        $checkIn = $_POST["checkIn"];
        $checkOut = $_POST["checkOut"];
        $numberOfGuests = $_POST["numberOfGuests"];
        
        $searchQuery = "CREATE VIEW UnrentedProperties AS
            SELECT p.title, p.country_id, p.rate
            FROM AirBnB_Group_40.properties_table p
            WHERE p.start_date = '$checkIn' and p.end_date = '$checkOut' and accomodates_count = '$numberOfGuests'
            LEFT OUTER JOIN AirBnB_Group_40.bookings_table ON p.id = b.property_id;";
        
        //$result = pg_query($db_connection, $searchQuery);
        
        //if($result) {
            //$array = pg_fetch_all($result);
            $array = array(
    0 => array(
        'name' => 'John',
        'location' => 'Ottawa',
        'price' => '20.5'
    ),
    1 => array(
        'name' => 'Goerge',
        'location' => 'Toronto',
        'price' => '25.5'
    ),
    2 => array(
        'name' => 'Jack',
        'location' => 'Vancouver',
        'price' => '30.5'
    )
);
            $_SESSION["search_result"] = $array;
            header('Location: /temp/Webpage/Results_Page/Results_Page.php');
        //}
    }

?>