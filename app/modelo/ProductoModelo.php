<?php

require_once '../app/ConexionBaseDatos.php';


class ProductoModelo
{
    private $db;

    public function __construct()
    {
        $this->db = ConexionBaseDatos::getInstancia()->getConexion();
    }


    public function verificarSiExisteProducto($codigo)
    {
        $stmt = $this->db->prepare("SELECT COUNT(*) as total FROM productos WHERE codigo = :codigo");
        $stmt->bindParam(':codigo', $codigo);
        $stmt->execute();
        $total = $stmt->fetch()['total'];
        return $total > 0;
    }

    public function save($codigo, $nombre, $bodega, $sucursal, $moneda, $precio, $descripcion, $materiales)
    {
        try {

            // Preparar la consulta SQL para insertar los datos
            $sql = "INSERT INTO productos (codigo, nombre, bodega_id, sucursal_id, moneda_id, precio, descripcion, materiales)
            VALUES (:codigo, :nombre, :bodega, :sucursal, :moneda, :precio, :descripcion, :materiales)";

            $stmt = $this->db->prepare($sql);

            // Bindear los valores
            $stmt->bindParam(':codigo', $codigo);
            $stmt->bindParam(':nombre', $nombre);
            $stmt->bindParam(':bodega', $bodega);
            $stmt->bindParam(':sucursal', $sucursal);
            $stmt->bindParam(':moneda', $moneda);
            $stmt->bindParam(':precio', $precio);
            $stmt->bindParam(':descripcion', $descripcion);
            $implode = implode(',', $materiales);
            $stmt->bindParam(':materiales', $implode);

            // Ejecutar la consulta
            $stmt->execute();

            return 'success';
        } catch (PDOException $e) {
            return $e->getMessage();
        }
    }
}
