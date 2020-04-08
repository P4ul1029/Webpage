<?php 

    $home_path = $_SERVER['DOCUMENT_ROOT'];
    $config_path =  "../database_config.php";
    include $config_path;


    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        session_start();

        $email = $_POST["email"];
        $password = $_POST["password"];
        

        $signInQuery = "SELECT * FROM AirBnB_Group_40.users_table WHERE email = '$email' and password = '$password'";
        $result = pg_query($db_connection, $signInQuery);
        
        if($result) {
            $_SESSION["email"] = $email;
            header('Location: /temp/Webpage/Search_Page/Search_Page.html');
        }

    }

?>