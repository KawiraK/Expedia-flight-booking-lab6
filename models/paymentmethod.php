<?php
    require_once ("db.php");

    class paymentmedhod extends db{
    

       function checkpaymentmedhod($paymentid)
        {
            $sql="CALL `sp_checkpaymentmedhod`({$paymentid})";
            return $this->getData($sql)->rowCount();
        }

      function savepaymentmedhod($paymentid,$paymentname){
        if ($this->checkpaymentmedhod($paymentid)){
            return ["status"=>"exist","message"=>"paymentmedhod already exists"];
        }else{

            $sql="CALL `sp_savepaymentmedhod`({$paymentid},'{$paymentname}')";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"paymentmedhod saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"paymentmedhod not saved"];
        }

       }

       function filterpaymentmedhod($currency_name){
                $sql="CALL  `sp_filterpaymentmedhod`('{$currency_name}')";
                return $this->getJSON($sql);  
       }

       function getpaymentmedhod(){
                $sql="CALL `sp_getpaymentmedhod`()";
                return $this->getJSON($sql);  
       }

       function getpaymentmedhoddetails($paymentid){
                $sql="CALL  `sp_getpaymentmedhoddetails`({$paymentid})";
                return $this->getJSON($sql);  
       }

       function deletepaymentmethod($paymentid){
    $sql="CALL `sp_deletepaymentmedhod`({$paymentid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"paymentmedhod deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"paymentmedhod not deleted"];
    }
}
    
    }
?>