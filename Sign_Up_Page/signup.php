<?php 

    $home_path = $_SERVER['DOCUMENT_ROOT'];
    $config_path =  "../database_config.php";
    include $config_path;


    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $firstName = $_POST["firstName"];
        $lastName = $_POST["lastName"];
        $email = $_POST["email"];
        $number = $_POST["number"];
        $password = $_POST["password"];
        $confirmPassword = $_POST["confirmPassword"];

        $timestamp = date('Y-m-d H:i:s');

        //query
        //if query successful
        $randomId = rand(100, 999);
        $signUpQuery = "INSERT INTO AirBnB_Group_40.users_table (id, name, email, password, phone_number, created_at, modified_at) VALUES ('$randomId', '$lastName', '$email', '$password', '$number', '$timestamp', '$timestamp' , active)";
        
        $result = pg_query($db_connection, $signUpQuery);
        
        if($result) {
            header('Location: /temp/Webpage/Sign_In_Page/Sign_In_Page.html');
        }

    }

?>