<?php
    require_once("../models/airline.php");

    $airline=new airline();

    if(isset($_GET['sp_checkairline'])){
        $airlineid=$_GET['airlineid'];
        $response=$airline->checkairline($airlineid);
        echo json_encode($response);
    }
    //check if the save airline button is clicked
  if(isset($_POST[ 'sp_save_airline'])){
        $airlineid=$_POST['airlineid'];
        $airlinename=$_POST['airlinename'];
        $logo=$_POST['logo'];
        $homecountryid=$_POST['homecountryid'];
        //save airline
        $response=$airline->saveairline($airlineid,$airlinename,$logo,$homecountryid);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filterairlines`])){
        //get airline  name  and  country name from the  url
        if(isset($_GET['airlinename'])){
            $airlinename=$_GET['airlinename'];
        } else {
            $airlinename="";
       }
  
        if(isset($_GET['countryname'])){
            $countryname=$_GET['countryname'];    
       } else {
            $countryname="";           
      }
      // if both empty, return all airlines
    if($airlinename === "" && $countryname === ""){
        $response = $airline->getairline();  // ✅ calls normal get airline function
    } else {
        // call the filter airline function or procedure from the airline model
        $response = $airline->filterairline($airlinename, $countryname);  // ✅ calls filter airline function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getairline`])){
        echo $airline->getairline();
    }

    if(isset($_GET[`sp_getairlinedetails`])){
        $airlineid=$_GET['airlineid'];
        $response=$airline->getairlinedetails($airlineid);
        echo $response;
    }

    if(isset($_POST[ `sp_deleteairline`])){
        $airlineid=$_POST['airlineid'];
        $response=$airline->deleteairline($airlineid);
        echo json_encode($response);
    }


?>