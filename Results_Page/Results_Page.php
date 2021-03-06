<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Saira+Condensed&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <title>Results Page</title>
    <script type="text/javascript">
        
        
window.addEventListener('load', function() {
    
    var searchResultList = <?php
    $config_path =  "../database_config.php";
    include $config_path;

    if ($_SERVER["REQUEST_METHOD"] == "GET") {
        
        $where = $_GET["where"];
        $checkIn = $_GET["checkIn"];
        $checkOut = $_GET["checkOut"];
        $numberOfGuests = $_GET["numberOfGuests"];
        
        $searchQuery = "
            SELECT p.name, p.country_id, p.rate
            FROM AirBnB_Group_40.properties_table p
	        LEFT JOIN AirBnB_Group_40.bookings_table b ON p.id = b.property_id
            WHERE p.start_date = b.check_in_date AND p.end_date = b.check_out_date;";
        
        $result = pg_query($db_connection, $searchQuery);
        
        if($result) {
            $array = pg_fetch_all($result);
        
        echo json_encode($array);
     } 
    }
            ?>;
    
var myTableDiv = document.getElementById("table-container");
      
    var table = document.getElementById('results-table');
    
    var tableBody = document.createElement('TBODY');
    table.appendChild(tableBody);
      
    for (var i=0; i<searchResultList.length; i++){
       var tr = document.createElement('tr');
       tableBody.appendChild(tr);
       
       for (var j=0; j<3; j++){
           var name = document.createElement('td');
           var location = document.createElement('td');
           var price = document.createElement('td');

           name.appendChild(document.createTextNode(searchResultList[i]["name"]));
           location.appendChild(document.createTextNode(searchResultList[i]["location"]));
           price.appendChild(document.createTextNode(searchResultList[i]["price"]));

       }
        tr.appendChild(name);
        tr.appendChild(location);
        tr.appendChild(price);


    }
    myTableDiv.appendChild(table);
})

        
    </script> 
    <script defer src="script.js"></script>
       

</head>
<body>
    <nav>
        <img src="images/Logo.png" alt="Logo" class="Logo">
        <input class="filterCheck" type="checkbox" id="filterCheck">
        <label for="filterCheck" data-modal-target="#filter">
            <img src="images/Filter_Icon.png" alt="Logo" class="Filter_Icon">
        </label>
        <input class="checkbox" type="checkbox" id="check">
        <label for="check" onclick="hideMenus();">
            <img src="images/Three_Lines.png" alt="Logo" class="Three_Lines">
        </label>
        <ul class="Unordered_List" id="Unordered_List">
            <li class="Filters"> <a data-modal-target="#filter">FILTERS</a></li>
            <li><a href="#" onclick="toggling('Currencies');">CURRENCY</a></li>
            <li><a class="Host" href="../Host_a_Home/Host_a_Home.html">HOST A HOME</a></li>
            <li><a href="#" onclick="toggling('BookedHomes');">BOOKED HOMES</a></li>
            <li><a href="../Sign_In_Page/Sign_In_Page.html">LOG OUT</a></li>
        </ul>
        <input type="text" class="Search_Box" placeholder="Location" id="search" spellcheck="false">
        <button type="button" class="Search_btn">SEARCH</button>  
    </nav>

    <div class="menus" id="menus">
        <select class="Currencies" name="Currencies" id="Currencies">
            <option value="US dollar">US dollar</option>
            <option value="European Euro">European Euro</option>
            <option value="Japanese yen">Japanese yen</option>
            <option value="Pound sterling">Pound sterling</option>
            <option value="Australian dollar">Australian dollar</option>
            <option value="Canadian dollar">Canadian dollar</option>
            <option value="Swiss franc">Swiss franc</option>
            <option value="Chinese Yuan Renminbi">Chinese Yuan Renminbi</option>
            <option value="Swedish krona">Swedish krona</option>
            <option value="Mexican peso">Mexican peso</option>
            <option value="New Zealand dollar">New Zealand dollar</option>
            <option value="Singapore dollar">Singapore dollar</option>
            <option value="Hong Kong dollar">Hong Kong dollar</option>
            <option value="Norwegian krone">Norwegian krone</option>
            <option value="South Korean won">South Korean won</option>
            <option value="Turkish lira">Turkish lira</option>
            <option value="Indian rupee">Indian rupee</option>
            <option value="Russian ruble">Russian ruble</option>
            <option value="Brazilian real">Brazilian real</option>
            <option value="South African rand">South African rand</option>
            <option value="Danish krone">Danish krone</option>
            <option value="Polish zloty">Polish zloty</option>
            <option value="New Taiwan dollar">New Taiwan dollar</option>
            <option value="Thai baht">Thai baht</option>
            <option value="Malaysian ringgit"> Malaysian ringgit</option>
        </select>

        <select name="BookedHomes" class="BookedHomes" id="BookedHomes">
            <option value="None">None</option>
        </select>
    </div>

    <div class="filter" id="filter">
        <div class="modal-header">
            <div class="modal-title">FILTERS</div> 
            <button data-close-btn class="close-btn">&times;</button>
        </div>
        
        <div class="modal-body">
            <form id="form" action="/" method="GET">
                <div id="error" class="error"></div>
                <label for="checkIn">CHECK-IN</label>
                <input type="date" id="checkIn" required>
                <br>
                <label for="checkOut">CHECK OUT</label>
                <input type="date" id="checkOut" required>
                <br>
                <label for="numberOfGuests">NUMBER OF GUESTS</label>
                <input type="number" id="numberOfGuests"  min="1" required>
                <br>
                <label for="properties">PROPERTY TYPE</label>
                <select name="Properties" id="properties" class="properties">
                    <option value="None">None</option>
                    <option value="Single Family">Single Family</option>
                    <option value="Apartment">Apartment</option>
                    <option value="Condo">Condo</option>
                    <option value="Bungalow">Bungalow</option>
                    <option value="Cottage">Cottage</option>
                    <option value="Ranch">Ranch</option>
                    <option value="Mansion">Mansion</option>
                    <option value="Townhome">Townhome</option>
                </select>
                <br>
                <label for="Bedroom"> BEDROOMS</label>
                <input type="number" id="Bedroom" min='0'>
                <br>
                <label for="Bathroom">BATHROOMS</label>
                <input type="number" id="Bathroom" min='0'>
                <br>
                <label for="Rate">DAILY RATE</label>
                <input type="number" id="Rate" min='1'>
                <br>
                <button type="submit" class="Save_btn">SAVE</button>
            </form>
        </div>
    </div>
    
    <div id="overlay"></div>

    <div class="table-container" id="table-container">
        <h1>RESULTS</h1>
        <table class="results-table" id="results-table">

            <tr>
                <td class="tableHeader">NAME</td>
                <td class="tableHeader">PRICE</td>
            </tr>
        </table>
    </div>
</body>
</html>
