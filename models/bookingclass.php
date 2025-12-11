<?php
    require_once ("db.php");

    class bookingclass extends db{
    

       function checkbookingclass($bookingclassid)
        {
            $sql="CALL `sp_checkbookingclassdetails`({$bookingclassid})";
            return $this->getData($sql)->rowCount();
        }

      function savebookingclass($bookingclassid,$classname,$bookingtypeid){
        if ($this->checkbookingclass($bookingclassid)){
            return ["status"=>"exist","message"=>"booking class already exists"];
        }else{

            $sql="CALL `sp_savebookingclass`({$bookingclassid},'{$classname}',{$bookingtypeid})";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"booking class saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"booking class not saved"];
        }

       }

       function filterbookingclass($price,$identification_document){
                $sql="CALL  `sp_filterbookingclass`('{$price}','{$identification_document}')";
                return $this->getJSON($sql);  
       }

       function getbookingclass(){
                $sql="CALL `sp_getbookingclass`()";
                return $this->getJSON($sql);  
       }

       function getbookingclassdetails($bookingclassid){
                $sql="CALL  `sp_getbookingclassdetails`({$bookingclassid})";
                return $this->getJSON($sql);  
       }

       function deletebookingclass($bookingclassid){
    $sql="CALL `sp_deletebookingclass`({$bookingclassid})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"booking class deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"booking class not deleted"];
    }
}
    
    }
?>