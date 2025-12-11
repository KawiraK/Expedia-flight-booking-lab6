<?php
    require_once("../models/currency.php");

    $currency=new currency();

    if(isset($_GET[`sp_checkcurrency`])){
        $currencyid=$_GET['currencyid'];
        $response=$currrency->checkcurrency($currrencyid);
        echo json_encode($response);
    }
    //check if the save currency button is clicked
  if(isset($_POST[`sp_savecurrencies`])){
        $currencyid=$_POST['currencyid'];
        $currency_name=$_POST['currency_name'];
        $default=$_POST['default'];
        $exchange_rate=$_POST['exchange_rate'];
        $paymentid=$_POST['paymentid'];
        //save currency
        $response=$currency->savecurrency($currencyid,$currency_name,$default,$exchange_rate, $paymentid);
        echo json_encode($response);

    }
//check if the filter button is clicked
    if(isset($_GET[`sp_filtercurrency`])){
        //get   currency name 
        if(isset($_GET['currencyid'])){
            $currency_name=$_GET['currency_name'];
        } else {
            $currency_name="";
       }
  

      // if both empty, return all cities
    if($currrency_name ){
        $response = $currency->getcurrency();  // ✅ calls normal get currency function
    } else {
        // call the filtercurrency function or procedure from the currency model
        $response = $currency->filtercurrency($currency_name);
    }

    echo $response;
    }

    if(isset($_GET[`sp_getcurrency`])){
        echo $currency->getcurrency();
    }

    if(isset($_GET[`sp_getcurrencydetails`])){
        $currencyid=$_GET['currencyid'];
        $response=$currrency->getcurrencydetails($currencyid);
        echo $response;
    }

    if(isset($_POST[`sp_deletecurrrency`])){
        $currencyid=$_POST['currencyid'];
        $response=$currency->deletecurrency($currencyid);
        echo json_encode($response);
    }


?>