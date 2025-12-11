<?php
    require_once("../models/bookingclass.php");

    $bookingclass=new bookingclass();

    if(isset($_GET[`sp_checkbookingclassdetails`])){
        $bookingclassid=$_GET['bookingclassid'];
        $response=$bookingclass->checkbookingclass($bookingclassid);
        echo json_encode($response);
    }
    //check if the save booking class button is clicked
  if(isset($_POST[ `sp_savebookingclass`])){
        $bookingclassid=$_POST['bookingclassid'];
        $classname=$_POST['classname'];
        $bookingtypeid=$_POST['bookingtypeid'];
        
        //save booking class
        $response=$bookingclass->savebookingclass($bookingclassid,$classname,$bookingtypeid);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filterbookingclass`])){
        //get booking classname and flight number from the  url
        if(isset($_GET['price'])){
            $price=$_GET['price'];
        } else {
            $price="";
       }
  
        if(isset($_GET['identification_document'])){
            $identification_document=$_GET['identification_document'];    
       } else {
            $identification_document="";           
      }
      // if both empty, return all prices
      // else call the filter function
    if($price === "" && $identification_document === ""){
        $response = $bookingclass->getbookingclass();  // ✅ calls normal get booking class function
    } else {
        // call the filter booking class function or procedure from the booking class model
        $response = $bookingclass->filterbookingclass($price, $identification_document);  // ✅ calls filter booking class function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getbookingclass`])){
        echo $bookingclass->getbookingclass();
    }

    if(isset($_GET[`sp_getbookingclassdetails`])){
        $bookingclassid=$_GET['bookingclassid'];
        $response=$bookingclass->getbookingclassdetails($bookingclassid);
        echo $response;
    }

    if(isset($_POST[ `sp_deletebookingclass`])){
        $bookingclassid=$_POST['bookingclassid'];
        $response=$bookingclass->deletebookingclass($bookingclassid);
        echo json_encode($response);
    }


?>