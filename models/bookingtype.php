<?php
    require_once ("db.php");

    class bookingtype extends db{
    

       function checkbookingtype($bookingid)
        {
            $sql="CALL `sp_checkbookingtype`({$bookingid})";
            return $this->getData($sql)->rowCount();
        }

      function savebookingtype($bookingid,$bookingname){
        if ($this->checkbookingtype($bookingid)){
            return ["status"=>"exist","message"=>"booking type already exists"];
        }else{

            $sql="CALL `sp_savebookingtype`({$bookingid},'{$bookingname}')";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"booking type saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"booking type not saved"];
        }

       }

       function filterbookingtype($classname){
                $sql="CALL  `sp_filterbookingtype`('{$classname}')";
                return $this->getJSON($sql);  
       }

       function getbookingtype(){
                $sql="CALL `sp_getbookingtype`()";
                return $this->getJSON($sql);  
       }

       function getbookingtypedetails($bookingid){
                $sql="CALL  `sp_getbookingtypedetails`({$bookingid})";
                return $this->getJSON($sql);  
       }

       function deletebookingtype($bookingid){
    $sql="CALL `sp_deletebookingtype`({$bookingid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"booking type deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"booking type not deleted"];
    }
}
    
    }
?>