<?php
    require_once("../models/paymentmedhod.php");

    $paymentmedhod=new paymentmedhod();

    if(isset($_GET[`sp_checkpaymentmedhod`])){
        $paymentid=$_GET['paymentid'];
        $response=$paymentmedhod->checkpaymentmedhod($paymentid);
        echo json_encode($response);
    }
    //check if the save paymentmedhod button is clicked
  if(isset($_POST[ `sp_savepaymentmedhod`])){
        $paymentid=$_POST['paymentid'];
        $paymentname=$_POST['paymentname'];
        //save paymentmedhod
        $response=$paymentmedhod->savepaymentmedhod($paymentid,$paymentname);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filterpaymentmedhod`])){
        //get paymentmedhod  name  and  country name from the  url
        if(isset($_GET['currency_name'])){
            $currency_name=$_GET['currency_name'];
        } else {
            $currency_name="";
       }
  
      // if empty, return all paymentmedhods
    if($currency_name ){
        $response = $paymentmedhod->getpaymentmedhod();  // ✅ calls normal get paymentmedhod function
    } else {
        // call the filter paymentmedhod function or procedure from the paymentmedhod model
        $response = $paymentmedhod->filterpaymentmedhod($currency_name);  // ✅ calls filter paymentmedhod function
    }

    echo $response;
    }

    if(isset($_GET[`sp_getpaymentmedhod`])){
        echo $paymentmedhod->getpaymentmedhod();
    }

    if(isset($_GET[`sp_getpaymentmedhoddetails`])){
        $paymentid=$_GET['paymentid'];
        $response=$paymentmedhod->getpaymentmedhoddetails($paymentid);
        echo $response;
    }

    if(isset($_POST[ `sp_deletepaymentmedhod`])){
        $paymentid=$_POST['paymentid'];
        $response=$paymentmedhod->deletepaymentmedhod($paymentid);
        echo json_encode($response);
    }


?>