<?php
    require_once ("db.php");

    class airline extends db{
    

       function checkairline($airlineid)
        {
            $sql="CALL `sp_checkairline`({$airlineid})";
            return $this->getData($sql)->rowCount();
        }

      function saveairline($airlineid,$airlinename,$logo,$homecountryid){
        if ($this->checkairline($airlineid)){
            return ["status"=>"exist","message"=>"airline already exists"];
        }else{

            $sql="CALL `sp_save_airline`({$airlineid},'{$airlinename}','{$logo}',{$homecountryid})";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"airline saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"airline not saved"];
        }

       }

       function filterairline($airlinename,$countryname){
                $sql="CALL  `sp_filterairlines`('{$airlinename}','{$countryname}')";
                return $this->getJSON($sql);  
       }

       function getairline(){
                $sql="CALL `sp_getairline`()";
                return $this->getJSON($sql);  
       }

       function getairlinedetails($airlineid){
                $sql="CALL  `sp_getairlinedetails`({$airlineid})";
                return $this->getJSON($sql);  
       }

       function deleteairrline($airlineid){
    $sql="CALL `sp_deleteairline`({$airlineid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"airline deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"airline not deleted"];
    }
}
    
    }
?>