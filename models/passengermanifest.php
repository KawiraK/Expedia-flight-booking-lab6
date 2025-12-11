<?php
    require_once ("db.php");

    class passenger extends db{
    

       function checkpassengermanifest($passengerid)
        {
            $sql="CALL `sp_checkpassengermanifest`({$passengerid})";
            return $this->getData($sql)->rowCount();
        }

      function savepassengermanifest($passengerid,$bookingid,$bookingclassid,$identification_document,$DOB,$gender_id,$nationality,$passenger_name){
         //check if the passenger manifest already exists
        if ($this->checkpassengermanifest($passengerid)){
            return ["status"=>"exist","message"=>"passenger manifest already exists"];
        }else{

            $sql="CALL `sp_savepassengermanifest`({$passengerid},{$bookingid},{$bookingclassid},'{$identification_document}','{$DOB}',{$gender_id},{$nationality},{$passenger_name})";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"passenger manifest saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"passenger not saved"];
        }

       }

       function filterpassengermanifest($passenger_name,$classname,){
                $sql="CALL  `sp_filterpassengermanifest`('{$passenger_name}','{$classname}')";
                return $this->getJSON($sql);  
       }

       function getpassengermanifest(){
                $sql="CALL `sp_getpassengermanifest`()";
                return $this->getJSON($sql);  
       }

       function getpassengermanifestdetails($passengerid){
                $sql="CALL  `sp_getpassengermanifestdetails`({$passengerid})";
                return $this->getJSON($sql);  
       }

       function deletepassengermanifest($passengerid){
    $sql="CALL `sp_deletepassengermanifest`({$passengerid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"passenger deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"passenger not deleted"];
    }
}
    
    }
?>