<?php
    session_start();
    $sql="";

    class db {
        //database connection parameters
        private  $servername;
        private  $databasename;
        private  $username;
        private  $password;
        public   $charset;
        //php data object(pdo) to connect to mysql server

        //connect to database
        function connect(){
            $this->servername = "localhost"; 
            $this->databasename = "expediaflightbooking";    
            $this->username = "root";   
            $this->password = "FOdhoch@254"; 
            $this->charset = "utf8mb4";  
            //catch any error that occurs during connection
            try{//how to connect data source name(dsn) to mysql database
                //mysql  is the driver  to  use,then it needs  to know the host and dbname
                    $dsn="mysql:host=".$this->servername .";dbname=".$this->databasename .";charset=".$this->charset;
                //define a pdo object that will provide the dns with  the username  and  password
                    $pdo=new PDO($dsn,$this->username,$this->password);
                    //set the pdo error mode to exception(if an error occur it will give us the error)
                    $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
                    return $pdo;
            }catch(PDOException $e){
                echo "Connection failed: ".$e->getMessage();

            }
        }

        function getData($sql){
           //connect is a function which will connect to the database and return a PDO object,aqcuire it then query that pdo object
           try{
            return $this->connect()->query($sql); 
              }catch(PDOException $e){
                return false;
              }
        }

        //function to convert the data into JSON format
        function getJSON($sql){
            //recordset(rst) holds the value returned by getData function
            $rst=$this->getData($sql);
            if($rst){
                 return json_encode($rst->fetchAll(PDO::FETCH_ASSOC));
            }
            else{
                return json_encode([]);     

            }
           
            
    }
    }
?>