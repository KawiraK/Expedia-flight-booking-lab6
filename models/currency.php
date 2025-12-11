<?php
    require_once ("db.php");

    class currency extends db{
    

       function checkcurrency($currencyid)
        {
            $sql="CALL `sp_checkcurrency`({$currencyid})";
            return $this->getData($sql)->rowCount();
        }

      function savecurrency($currencyid,$currencyname,$default,$exchange_rate, $paymentid){
        if ($this->checkcurrency($currencyid)){
            return ["status"=>"exist","message"=>"currency already exists"];
        }else{

            $sql="CALL `sp_savecurrencies`({$currencyid},'{$currencyname}','{$default}', '{$exchange_rate}',{$paymentid})";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"currency saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"curency not saved"];
        }

       }

       function filtercurrency($currency_name){
                $sql="CALL `sp_filtercurrency`('{$currency_name}')";
                return $this->getJSON($sql);  
       }

       function getcurrency(){
                $sql="CALL `sp_getcurrency`()";
                return $this->getJSON($sql);  
       }

       function getcurrencydetails($currencyid){
                $sql="CALL `sp_getcurrencydetails`({$currencyid})";
                return $this->getJSON($sql);  
       }

       function deletecurrency($currencyid){
    $sql="CALL `sp_deletecurrency`({$currencyid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"currency deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"currency not deleted"];
    }
}
    
    }
?>