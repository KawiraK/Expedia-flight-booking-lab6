<?php
    require_once ("db.php");

    class booking extends db{
    

       function checkbooking($bookingid)
        {
            $sql="CALL `sp_checkbooking`({$bookingid})";
            return $this->getData($sql)->rowCount();
        }

      function savebooking($bookingid,$bookingtypeid,$flightidd,$booking_date,$payment_method){
        if ($this->checkbooking($bookingid)){
            return ["status"=>"exist","message"=>"booking already exists"];
        }else{

            $sql="CALL `sp_savebooking`({$bookingid},{$bookingtypeid},{$flightid},'{$booking_date}','{$payment_method}')";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"booking saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"booking not saved"];
        }

       }

       function filterbooking($classname,$flightnumber){
                $sql="CALL  `sp_filterbooking`('{$classname}','{$flightnumber}')";
                return $this->getJSON($sql);  
       }

       function getbooking(){
                $sql="CALL `sp_getbooking`()";
                return $this->getJSON($sql);  
       }

       function getbookingdetails($bookingid){
                $sql="CALL  `sp_getbookingdetails`({$bookingid})";
                return $this->getJSON($sql);  
       }

       function deletebooking($bookingid){
    $sql="CALL `sp_deletebooking`({$bookingid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"booking deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"booking not deleted"];
    }
}
    
    }
?>