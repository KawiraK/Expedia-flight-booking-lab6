<?php
    require_once("../models/identification.php");

    $identification=new identification();

    if(isset($_GET[`sp_checkidentificationdocument`])){
        $id=$_GET['id'];
        $response=$identification->checkid($id);
        echo json_encode($response);
    }
    //check if the save id button is clicked
  if(isset($_POST[ `sp_saveidentificationdocuments`])){
        $id=$_POST['id'];
        $name=$_POST['name'];
       
        //save id
        $response=$identification->saveid($id,$name);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filteridentificationdocument`])){
        //get passanger name and  gender name from the  url
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
        $response = $identification->getid();  // ✅ calls normal getid function
    } else {
        // call the filter id function or procedure from the id model
        $response = $identification->filterid($gendername, $passanger_name);  // ✅ calls filter id function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getidentificationdocument`])){
        echo $identification->getid();
    }

    if(isset($_GET[`sp_getidentificationdocumentdetails`])){
        $id=$_GET['id'];
        $response=$identification->getiddetails($id);
        echo $response;
    }

    if(isset($_POST[ `sp_deleteidentificationdocument`])){
        $id=$_POST['id'];
        $response=$identification->deleteid($id);
        echo json_encode($response);
    }


?>