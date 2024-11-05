<?php
require_once '../app/ConexionBaseDatos.php';

class SucursalModelo
{
    private $db;

    public function __construct()
    {
        $this->db = ConexionBaseDatos::getInstancia()->getConexion();
    }

    public function getSucursales(int $bodegaId)
    {
        $stmt = $this->db->prepare("SELECT * FROM sucursales WHERE bodega_id = :bodega_id");
        $stmt->bindParam(':bodega_id', $bodegaId);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}