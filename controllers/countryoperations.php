<?php
    require_once("../models/country.php");

    $country=new country();

    if(isset($_GET['checkcountry'])){
        $countryid=$_GET['countryid'];
        $response=$country->checkcountry($countryid);
        echo json_encode($response);
    }
    //check if the savecountry button is clicked
  if(isset($_POST['savecountry'])){
        $countryid=$_POST['countryid'];
        $countryname=$_POST['countryname'];
        //save country
        $response=$country->savecountry($countryid,$countryname);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET['filtercountries'])){
        //get   country  name  and  city name from the  url
        if(isset($_GET['countryname'])){
            $countryname=$_GET['countryname'];
        } else {
            $countryname="";
       }
  
        if(isset($_GET['cityname'])){
            $cityname=$_GET['cityname'];    
       } else {
            $cityname="";           
      }
      // if both empty, return all countries
    if($countryname === "" && $cityname === ""){
        $response = $country->getcountry();  // ✅ calls normal getcountry
    } else {
        // call the filtercountries function or procedure from the country model
        $response = $country->filtercountries($countryname, $cityname);
    }

    echo $response;
    }

    if(isset($_GET['getcountries'])){
        echo $country->getcountry();
    }

    if(isset($_GET['getcountrydetails'])){
        $countryid=$_GET['countryid'];
        $response=$country->getcountrydetails($countryid);
        echo $response;
    }

    if(isset($_POST['deletecountry'])){
        $countryid=$_POST['countryid'];
        $response=$country->deletecountry($countryid);
        echo json_encode($response);
    }

   


   
    
 //rest APIS
 //use postman to test the rest apis
 //NB:in postman we use the post method to send data to the server and the get method to retrieve data from the server
 //NB:in postman we use the body to send data to the server and the params to retrieve data from the server

?>