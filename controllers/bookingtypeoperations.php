<?php
    require_once("../models/bookingtype.php");

    $bookingtype=new bookingtype();

    if(isset($_GET[`sp_checkbookingtype`])){
        $bookingid=$_GET['bookingid'];
        $response=$bookingtype->checkbookingtype($bookingid);
        echo json_encode($response);
    }
    //check if the save booking type button is clicked
  if(isset($_POST[ `sp_savebookingtype`])){
        $bookingid=$_POST['bookingid'];
        $bookingname=$_POST['bookingname'];
        
        //save booking type
        $response=$bookingtype->savebookingtype($bookingid,$bookingname);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filterbookingtype`])){
        //get booking classname and flight number from the  url
        if(isset($_GET['classname'])){
            $classname=$_GET['classname'];
        } else {
            $classname="";
       }

      // if empty, return all booking types
      // if not empty, call the filter booking types function or procedure from the booking type model
    if($classname){
        $response = $bookingtype->getbookingtype();  // ✅ calls normal get booking type function
    } else {
        // call the filter booking type function or procedure from the booking type model
        $response = $bookingtype->filterbookingtype($classname);  // ✅ calls filter booking type function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getbookingtype`])){
        echo $bookingtype->getbookingtype();
    }

    if(isset($_GET[`sp_getbookingtypedetails`])){
        $bookingid=$_GET['bookingid'];
        $response=$bookingtype->getbookingtypedetails($bookingid);
        echo $response;
    }

    if(isset($_POST[ `sp_deletebookingtype`])){
        $bookingid=$_POST['bookingid'];
        $response=$bookingtype->deletebookingtype($bookingid);
        echo json_encode($response);
    }


?>