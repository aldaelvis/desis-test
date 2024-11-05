<?php

require_once '../app/ConexionBaseDatos.php';

class BodegaModelo
{
    private $db;

    public function __construct()
    {
        $this->db = ConexionBaseDatos::getInstancia()->getConexion();
    }

    public function getBodegas()
    {
        $stmt = $this->db->query("SELECT * FROM bodegas");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}