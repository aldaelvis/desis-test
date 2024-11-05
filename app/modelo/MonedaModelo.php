<?php

require_once '../app/ConexionBaseDatos.php';

class MonedaModelo
{

    private $db;

    public function __construct()
    {
        $this->db = ConexionBaseDatos::getInstancia()->getConexion();
    }

    public function getMonedas()
    {
        $stmt = $this->db->query("SELECT * FROM monedas");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}