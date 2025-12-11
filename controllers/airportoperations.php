<?php
    require_once("../models/airport.php");

    $airport=new airport();

    if(isset($_GET[`sp_checkairports`])){
        $airportid=$_GET['airportid'];
        $response=$airport->checkairport($airportid);
        echo json_encode($response);
    }
    //check if the save airport button is clicked
  if(isset($_POST[`sp_saveairport`])){
        $airportid=$_POST['airportid'];
        $airportcode=$_POST['airportcode'];
        $cityid=$_POST['cityid'];
        $airportname=$_POST['airportname'];
        //save airport
        $response=$airport->saveairport($airportid,$airportcode,$cityid,$airportname);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[ `sp_filterairport`])){
        //get airport  name  and  city name from the  url
        if(isset($_GET['cityname'])){
            $cityname=$_GET['cityname'];
        } else {
            $cityname="";
       }
  
        if(isset($_GET['airportname'])){
            $airportname=$_GET['airportname'];    
       } else {
            $airportname="";           
      }
      // if both empty, return all cities
    if($cityname === "" && $airportname === ""){
        $response = $airport->getairport();  // ✅ calls normal get airport function
    } else {
        // call the filter airports function or procedure from the airport model
        $response = $airport->filterairport($cityname, $airportname);
    }

    echo $response;
    }

    if(isset($_GET[`sp_getairport`])){
        echo $airport->getairport();
    }

    if(isset($_GET[`sp_getairportdetails`])){
        $airportid=$_GET['airportid'];
        $response=$airport->getairportdetails($airportid);
        echo $response;
    }

    if(isset($_POST[`sp_deleteairport`])){
        $airportid=$_POST['airportid'];
        $response=$airport->deleteairport($airportid);
        echo json_encode($response);
    }


?>