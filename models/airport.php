<?php
    require_once ("db.php");

    class airport extends db{
    

       function checkairport($airportid)
        {
            $sql="CALL `sp_checkairports`({$airportid})";
            return $this->getData($sql)->rowCount();
        }

      function saveairport($airportid,$airportcode,$cityid,$airportname){
        if ($this->checkairport($airportid)){
            return ["status"=>"exist","message"=>"airport already exists"];
        }else{

            $sql="CALL `sp_saveairport`({$airportid},'{$airportcode}',{$cityid},'{$airportname}')";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"airport saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"airport not saved"];
        }

       }

       function filterairport($cityname,$airportname){
                $sql="CALL  `sp_filterairport`('{$cityname}','{$airportname}')";
                return $this->getJSON($sql);  
       }

       function getairport(){
                $sql="CALL `sp_getairport`()";
                return $this->getJSON($sql);  
       }

       function getairportdetails($airportid){
                $sql="CALL `sp_getairportdetails`({$airportid})";
                return $this->getJSON($sql);  
       }

       function deleteairport($airportid){
    $sql="CALL `sp_deleteairport`({$airportid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"airport deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"airport not deleted"];
    }
}
    
    }
?>