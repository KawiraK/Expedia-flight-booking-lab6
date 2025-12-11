<?php
    require_once ("db.php");

    class country extends db{
    

       function checkcountry($countryid)
        {
            $sql="CALL `sp_checkcountry`({$countryid})";
            return $this->getData($sql)->rowCount();
        }

      function savecountry($countryid,$countryname){
        if ($this->checkcountry($countryid)){
            return ["status"=>"exist","message"=>"country already exists"];
        }else{

            $sql="CALL `sp_savecountries`({$countryid},'{$countryname}')";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"country saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"country not saved"];
        }

       }

       function filtercountries($countryname, $cityname){
                $sql="CALL `sp_filtercountries`('{$countryname}','{$cityname}')";
                return $this->getJSON($sql);  
       }



       function getcountry(){
                $sql="CALL `sp_getcountries`()";
                return $this->getJSON($sql);  
       }

       function getcountrydetails($countryid){
                $sql="CALL `sp_getcountrydetails`({$countryid})";
                return $this->getJSON($sql);  
       }

       function deletecountry($countryid){
    $sql="CALL `sp_deletecountry`({$countryid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"country deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"country not deleted"];
    }
}
    
        // Class properties can be inherited from db model(oop)using the  inheritence feature of oop
        //NB:getdata function is when you want to save or store something onto the database.
        //NB:getjson function is when you want to extract something from the database and output it in your rest api or the browser or the client that calls for the rest API
        //crud operations

        //The stated functions below are just statements and therefore we need the controllers to act as the user interface to call these functions
    }
?>