<?php
    require_once ("db.php");

    class identificationdocument extends db{
    

       function checkid($id)
        {
            $sql="CALL `sp_checkidentificationdocument`({$id})";
            return $this->getData($sql)->rowCount();
        }

      function saveid($id,$name){
        if ($this->checkid($id)){
            return ["status"=>"exist","message"=>"id already exists"];
        }else{

            $sql="CALL `sp_saveidentificationdocuments`({$id},'{$name}')";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"id saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"id not saved"];
        }

       }

       function filterid($gendername,$passanger_name){
                $sql="CALL  `sp_filteridentificationdocument`('{$gendername}','{$passanger_name}')";
                return $this->getJSON($sql);  
       }

       function getid(){
                $sql="CALL `sp_getidentificationdocument`()";
                return $this->getJSON($sql);  
       }

       function getiddetails($id){
                $sql="CALL  `sp_getidentificationdocumentdetails`({$id})";
                return $this->getJSON($sql);  
       }

       function deleteid($gender_id){
    $sql="CALL `sp_deleteidentificationdocument`({$id})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"id deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"id not deleted"];
    }
}
    
    }