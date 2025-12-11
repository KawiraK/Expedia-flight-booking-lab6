<?php
    require_once ("db.php");

    class bookingsupply extends db{
    

       function checkbookingsupply($bookingsupplyid)
        {
            $sql="CALL `sp_checkbookingsupply`({$bookingsupplyid})";
            return $this->getData($sql)->rowCount();
        }

      function savebookingsupply($bookingid,$flightid,$bookingclassid, $numberofseats,$price,$currency){
        if ($this->checkbookingsupply($bookingsupplyid)){
            return ["status"=>"exist","message"=>"bookingssupply already exists"];
        }else{

            $sql="CALL `sp_savebookingsupply`({$bookingsupplyid},{$flightid},{$bookingclass},{$numberofseats},'{$price}',{$currency})";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"bookingsupply saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"bookingssupply not saved"];
        }

       }

       function filterbookingsupply($classname,$flightnumber){
                $sql="CALL  `sp_filterbookingsupply`('{$classname}','{$flightnumber}')";
                return $this->getJSON($sql);  
       }

       function getbookingsupply(){
                $sql="CALL `sp_getbookingsupply`()";
                return $this->getJSON($sql);  
       }

       function getbookingsupplydetails($bookingsupplyid){
                $sql="CALL  `sp_getbookingsupplydetails`({$bookingsupplyid})";
                return $this->getJSON($sql);  
       }

       function deletebookingsupply($bookingsupplyid){
    $sql="CALL `sp_deletebookingsupply`({$bookingsupplyid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"bookingsupply deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"bookingsupply not deleted"];
    }
}
    
    }
?>