<?php

require_once('Configuration.php');

class Database
{
    public $conn;
    public $statement;



    public function __construct()
    {
        $datasource = 'mysql:host=' . Configuration::$DB_HOST . ';dbname=' . Configuration::$DB_NAME . ';';
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ];

        try {
            $this->conn = new PDO($datasource, Configuration::$DB_USER, Configuration::$DB_PASS, $options);
        } catch (PDOException $e) {
            print "ERROR " . $e->getMessage() . '<br>';
            die();
        }
    }



    public function query($query)
    {
        $this->conn->beginTransaction();
        $this->statement = $this->conn->prepare($query);
    }

    public function bindData($key, $value)
    {
        switch (true) {
            case is_int($value):
                $type = PDO::PARAM_INT;
                break;
            case is_bool($value):
                $type = PDO::PARAM_BOOL;
                break;
            case is_null($value):
                $type = PDO::PARAM_NULL;
                break;
            default:
                $type = PDO::PARAM_STR;
                break;
        }

        $this->statement->bindValue($key, $value, $type);
    }

    public function execute()
    {
        try {
            $result = $this->statement->execute();
            $this->conn->commit();
            return $result;
        } catch (PDOException $e) {
            $this->conn->rollBack();
            throw $e; // Melempar kembali exception untuk penanganan kesalahan
        }
    }

    public function bindLimit($param, $value, $type = null)
    {
        if (is_null($type)) {
            switch (true) {
                case is_int($value):
                    $type = PDO::PARAM_INT;
                    break;
                case is_bool($value):
                    $type = PDO::PARAM_BOOL;
                    break;
                case is_null($value):
                    $type = PDO::PARAM_NULL;
                    break;
                default:
                    $type = PDO::PARAM_STR;
            }
        }
        $this->statement->bindParam($param, $value, $type);
    }

    public function fetchAll()
    {
        $this->execute();
        return $this->statement->fetchAll(PDO::FETCH_ASSOC);
    }

    public function fetch()
    {
        $this->execute();
        return $this->statement->fetch(PDO::FETCH_ASSOC);
    }

    public function affectedRows()
    {
        $this->execute();
        return $this->statement->rowCount();
    }
}
