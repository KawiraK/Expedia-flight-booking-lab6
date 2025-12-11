<?php
    require_once("../models/booking.php");

    $bookingsupply=new bookingsupply();

    if(isset($_GET[`sp_checkbookingsupply`])){
        $bookingsupplyid=$_GET['bookingsupplyid'];
        $response=$bookingsupply->checkbookingsupply($bookingsupplyid);
        echo json_encode($response);
    }
    //check if the save booking supply button is clicked
  if(isset($_POST[ `sp_savebookingsupply`])){
        $bookingsupplyid=$_POST['bookingsupplyid'];
        $flightid=$_POST['flightid'];
        $bookingclassid=$_POST['bookingclassid'];
        $numberofseats=$_POST['numberofseats'];
        $price=$_POST['price'];
        $currency=$_POST['currency'];
        
        //save bookingsupply
        $response=$bookingsupply->savebookingsupply($bookingsupplyid,$flightid, $bookingclassid, $numberofseats, $price, $currency);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filterbookingsupply`])){
        //get bookingsupply classname and flight number from the  url
        if(isset($_GET['classname'])){
            $classname=$_GET['classname'];
        } else {
            $classname="";
       }
  
        if(isset($_GET['flightnumber'])){
            $flightnumber=$_GET['flightnumber'];    
       } else {
            $flightnumber="";           
      }
      // if both empty, return all bookingsupply
    if($classname === "" && $flightnumber === ""){
        $response = $bookingsupply->getbooking();  // ✅ calls normal get booking function
    } else {
        // call the filter bookingsupply function or procedure from the bookingsupply model
        $response = $bookingsupply->filterbookingsupply($classname, $flightnumber);  // ✅ calls filter booking supply function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getbookingsupply`])){
        echo $bookingsupply->getbookingsupply();
    }

    if(isset($_GET[`sp_getbookingsupplydetails`])){
        $bookingsupplyid=$_GET['bookingsupplyid'];
        $response=$bookingsupply->getbookingsupplydetails($bookingsupplyid);
        echo $response;
    }

    if(isset($_POST[ `sp_deletebookingsupply`])){
        $bookingsupplyid=$_POST['bookingsupplyid'];
        $response=$bookingsupply->deletebookingsupply($bookingsupplyid);
        echo json_encode($response);
    }


?>