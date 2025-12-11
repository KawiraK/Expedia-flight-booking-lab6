<?php
    require_once("../models/flightsupply.php");

    $flightsupply=new flightsupply();

    if(isset($_GET[`sp_checkflightsupply`])){
        $flightidid=$_GET['flightid'];
        $response=$flightsupply->checkflightsupply($flightid);
        echo json_encode($response);
    }
    //check if the save flight supply button is clicked
  if(isset($_POST[ `sp_saveflightsupply`])){
        $flightid=$_POST['flightid'];
        $flightnumber=$_POST['flightnumber'];
        $airlineid=$_POST['airlineid'];
        $depature_time=$_POST['depature_time'];
        $depature_city=$_POST['depature_city'];
        $arrival_time=$_POST['arrival_time'];
        $destinationcityid=$_POST['destinationcityid'];
        
        //save flightsupply
        $response=$flightsupply->saveflightsupply($flightid,$flightid,$flightnumber,$airlineid,$depature_time, $depature_city,$arrival_time,$destinationcityid);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filterflightsupply`])){
        //get filter supply classname and flight number from the  url
        if(isset($_GET['airlinename'])){
            $airlinename=$_GET['airlinename'];
        } else {
            $airlinename="";
       }

      // if both empty, return all flightsupply
    if($airlinename){
        $response = $flightsupply->getflightsupply();  // ✅ calls normal get booking function
    } else {
        // call the filter flightsupply function or procedure from the flightsupply model
        $response = $flightsupply->filterflightsupply($airlinename);  // ✅ calls filter flight supply function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getflightsupply`])){
        echo $flightsupply->getflightsupply();
    }

    if(isset($_GET[`sp_getflightsupplydetails`])){
        $flightid=$_GET['flightid'];
        $response=$flightsupply->getflightsupplydetails($flightid);
        echo $response;
    }

    if(isset($_POST[ `sp_deleteflightsupply`])){
        $flightid=$_POST['flightid'];
        $response=$flightsupply->deleteflightsupply($flightid);
        echo json_encode($response);
    }


?>