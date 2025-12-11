<?php
    require_once ("db.php");

    class gender extends db{
    

       function checkgender($gender_id)
        {
            $sql="CALL `sp_checkgender`({$gender_id})";
            return $this->getData($sql)->rowCount();
        }

      function savegender($gender_id,$gendername){
        if ($this->checkgender($gender_id)){
            return ["status"=>"exist","message"=>"gender already exists"];
        }else{

            $sql="CALL `sp_savegender`({$gender_id},'{$gendername}')";
            $result=$this->getData($sql);
        }
        //check if the result is successful to avoid errors
        if($result && $result->rowCount()>0){

              return ["status"=>"success","message"=>"gender saved successfully"];
        }
        else{
              return ["status"=>"error","message"=>"gender not saved"];
        }

       }

       function filtergender($gendername,$passanger_name){
                $sql="CALL  `sp_filtergender`('{$gendername}','{$passanger_name}')";
                return $this->getJSON($sql);  
       }

       function getgender(){
                $sql="CALL `sp_getgender`()";
                return $this->getJSON($sql);  
       }

       function getgenderdetails($gender_id){
                $sql="CALL  `sp_getgenderdetails`({$gender_id})";
                return $this->getJSON($sql);  
       }

       function deletegender($gender_id){
    $sql="CALL `sp_deletegender`({$gender_id})";
    $result = $this->getData($sql);

    if($result && $result->rowCount() > 0){
        return ["status"=>"success","message"=>"gender deleted successfully"];
    } else {
        return ["status"=>"error","message"=>"gender not deleted"];
    }
}
    
    }
?>