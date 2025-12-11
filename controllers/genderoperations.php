<?php
    require_once("../models/gender.php");

    $gender=new gender();

    if(isset($_GET[`sp_checkgender`])){
        $gender_id=$_GET['gender_id'];
        $response=$gender->checkgender($gender_id);
        echo json_encode($response);
    }
    //check if the save gender button is clicked
  if(isset($_POST[ `sp_savegender`])){
        $gender_id=$_POST['gender_id'];
        $gendername=$_POST['gendername'];
       
        //save gender
        $response=$gender->savegender($gender_id,$gendername);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filtergender`])){
        //get gender  name  and  passanger name from the  url
        if(isset($_GET['gendername'])){
            $gendername=$_GET['gendername'];
        } else {
            $gendername="";
       }
  
        if(isset($_GET['passanger_name'])){
            $passanger_name=$_GET['passanger_name'];    
       } else {
            $passanger_name="";           
      }
      // if both empty, return all names
    if($gendername === "" && $passanger_name === ""){
        $response = $gender->getgender();  // ✅ calls normal getgender function
    } else {
        // call the filter gender function or procedure from the gender model
        $response = $gender->filtergender($gendername, $passanger_name);  // ✅ calls filter gender function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getgender`])){
        echo $gender->getgender();
    }

    if(isset($_GET[`sp_getgenderdetails`])){
        $gender_id=$_GET['gender_id'];
        $response=$gender->getgenderdetails($gender_id);
        echo $response;
    }

    if(isset($_POST[ `sp_deletegender`])){
        $gender_id=$_POST['gender_id'];
        $response=$gender->deletegender($gender_id);
        echo json_encode($response);
    }


?>