<?php
    require_once ("db.php");

    class city extends db{
    

       function checkcity($cityid)
        {
            $sql="CALL `sp_checkcity`({$cityid})";
            return $this->getData($sql)->rowCount();
        }

      function savecity($cityid,$cityname,$countryid){
        if ($this->checkcity($cityid)){
            return ["status"=>"exist","message"=>"city already exists"];
        }else{

            $sql="CALL `sp_savecity`({$cityid},'{$cityname}',{$countryid})";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"city saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"city not saved"];
        }

       }

       function filtercity($countryid,$cityname){
                $sql="CALL `sp_filtercities`({$countryid},'{$cityname}')";
                return $this->getJSON($sql);  
       }

       function getcity(){
                $sql="CALL `sp_getcities`()";
                return $this->getJSON($sql);  
       }

       function getcitydetails($cityid){
                $sql="CALL `sp_getcitydetails`({$cityid})";
                return $this->getJSON($sql);  
       }

       function deletecity($cityid){
    $sql="CALL `sp_deletecity`({$cityid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"city deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"city not deleted"];
    }
}
    
    }
?>