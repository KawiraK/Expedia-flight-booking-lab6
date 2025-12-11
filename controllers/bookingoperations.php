<?php
    require_once("../models/booking.php");

    $booking=new booking();

    if(isset($_GET[`sp_checkbooking`])){
        $bookingid=$_GET['bookingid'];
        $response=$booking->checkbooking($bookingid);
        echo json_encode($response);
    }
    //check if the save booking button is clicked
  if(isset($_POST[ `sp_savebooking`])){
        $bookingid=$_POST['bookingid'];
        $bookingtypeid=$_POST['bookingtypeid'];
        $flightid=$_POST['flightid'];
        $booking_date=$_POST['booking_date'];
        $payment_method=$_POST['payment_method'];
        
        //save booking
        $response=$booking->savebooking($bookingid,$bookingtypeid,$flightid,$booking_date,$payment_method);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filterbooking`])){
        //get booking classname and flight number from the  url
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
      // if both empty, return all flightnumbers
    if($classname === "" && $flightnumber === ""){
        $response = $booking->getbooking();  // ✅ calls normal get booking function
    } else {
        // call the filter booking function or procedure from the booking model
        $response = $booking->filterbooking($classname, $flightnumber);  // ✅ calls filter booking function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getbooking`])){
        echo $booking->getbooking();
    }

    if(isset($_GET[`sp_getbookingdetails`])){
        $bookingid=$_GET['bookingid'];
        $response=$booking->getbookingdetails($bookingid);
        echo $response;
    }

    if(isset($_POST[ `sp_deletebooking`])){
        $bookingid=$_POST['bookingid'];
        $response=$booking->deletebooking($bookingid);
        echo json_encode($response);
    }


?>