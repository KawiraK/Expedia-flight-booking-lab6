<?php
    require_once("../models/passengermanifest.php");

    $passengermanifest=new passengermanifest();

    if(isset($_GET[`sp_checkpassengermanifest`])){
        $passengerid=$_GET['passengerid'];
        $response=$passengermanifest->checkpassengermanifest($passengerid);
        echo json_encode($response);
    }
    //check if the save passenger manifest button is clicked
  if(isset($_POST[ `sp_savepassengermanifest`])){
        $passengerid=$_POST['passengerid'];
        $bookingid=$_POST['bookingid'];
        $bookingclassid=$_POST['bookingclassid'];       
        $identification_document=$_POST['identification_document'];
        $DOB=$_POST['DOB'];
        $gender_id=$_POST['gender_id']       
       
       
        //save gender
        $response=$passengermanifest->savepassengerrmanifest($passengerid,$bookingid,$bookingclassid,$identification_document,$DOB,$gender_id,$nationality,$passenger_name);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filtergender`])){
        //get gender  name  and  passanger name from the  url
        if(isset($_GET['passenger_name'])){
            $passenger_name=$_GET['passenger_name'];
        } else {
            $passenger_name="";
       }
  
        if(isset($_GET['classname'])){
            $classname=$_GET['classname'];    
       } else {
            $classname="";           
      }
      // if both empty, return all names
    if($passenger_name === "" && $classname === ""){
        $response = $passengermanifest->getpassengermanifest();  // ✅ calls normal get passenger manifest function
    } else {
        // call the filter passenger  function or procedure from the passenger manifest model
        $response = $passengermanifest->filterpassengermanifest($passanger_name,$classname);  // ✅ calls filter passenger mmanifest function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getpassengermanifest`])){
        echo $passengermanifest->getpassengermanifest();
    }

    if(isset($_GET[`sp_getpassengermanifestdetails`])){
        $passengerid=$_GET['passengerid'];
        $response=$passengermanifest->getpassengermanifestdetails($passengerid);
        echo $response;
    }

    if(isset($_POST[ `sp_deletepassengermanifest`])){
        $passengerid=$_POST['passengerid'];
        $response=$passengermanifest->deletepassengermanifest($passengerid);
        echo json_encode($response);
    }


?>