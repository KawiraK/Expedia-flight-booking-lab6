<?php
    require_once("../models/city.php");

    $city=new city();

    if(isset($_GET[`sp_checkcity`])){
        $cityid=$_GET['cityid'];
        $response=$city->checkcity($cityid);
        echo json_encode($response);
    }
    //check if the save city button is clicked
  if(isset($_POST[`sp_savecity`])){
        $cityid=$_POST['cityid'];
        $cityname=$_POST['cityname'];
        $countryid=$_POST['countryid'];
        //save country
        $response=$city->savecity($cityid,$cityname,$countryid);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filtercities`])){
        //get   country  name  and  city name from the  url
        if(isset($_GET['countryid'])){
            $countryname=$_GET['countryname'];
        } else {
            $countryname="";
       }
  
        if(isset($_GET['cityname'])){
            $cityname=$_GET['cityname'];    
       } else {
            $cityname="";           
      }
      // if both empty, return all cities
    if($countryname === "" && $cityname === ""){
        $response = $city->getcity();  // ✅ calls normal getcity function
    } else {
        // call the filtercities function or procedure from the city model
        $response = $city->filtercity($countryname, $cityname);
    }

    echo $response;
    }

    if(isset($_GET[`sp_getcities`])){
        echo $city->getcity();
    }

    if(isset($_GET[`sp_getcitydetails`])){
        $cityid=$_GET['cityid'];
        $response=$city->getcitydetails($cityid);
        echo $response;
    }

    if(isset($_POST[`sp_deletecity`])){
        $cityid=$_POST['cityid'];
        $response=$city->deletecity($cityid);
        echo json_encode($response);
    }


?>