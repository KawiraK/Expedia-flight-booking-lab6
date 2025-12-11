<?php
    require_once ("db.php");

    class flightsupply extends db{
    

       function checkflightsupply($flightid)
        {
            $sql="CALL `sp_checkflightsupply`({$flightid})";
            return $this->getData($sql)->rowCount();
        }

      function saveflightsupply($flightid,$flightnumber,$airlineid,$depature_time, $depature_city,$arrival_time,$destinationcityid){
        if ($this->checkflightsupply($flightid)){
            return ["status"=>"exist","message"=>"flightsupply already exists"];
        }else{

            $sql="CALL `sp_saveflightsupply`({$flightid},'{'$flightnumber'}',{$airlineid},'{$depature_time}','{$depature_city}','{$arrival_time}',{$destinationcityid})";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"flightsupply saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"flightsupply not saved"];
        }

       }

       function filterflightsupply($airlinename){
                $sql="CALL  `sp_filterflightsupply`('{$airlinename}')";
                return $this->getJSON($sql);  
       }

       function getflightsupply(){
                $sql="CALL `sp_getflightsupply`()";
                return $this->getJSON($sql);  
       }

       function getflightsupplydetails($flightid){
                $sql="CALL  `sp_getflightsupplydetails`({$flightid})";
                return $this->getJSON($sql);  
       }

       function deleteflightsupply($flightid){
    $sql="CALL `sp_deleteflightsupply`({$flightid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"flightsupply deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"flightsupply not deleted"];
    }
}
    
    }
?>