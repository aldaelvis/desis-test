<?php

require_once BASE_DIR . 'app/modelo/MonedaModelo.php';
require_once BASE_DIR . 'app/modelo/BodegaModelo.php';
require_once BASE_DIR . 'app/modelo/SucursalModelo.php';
require_once BASE_DIR . 'app/modelo/ProductoModelo.php';

class ProductoControlador
{

    private $moneda;
    private $bodega;
    private $sucursal;
    private $producto;

    public function __construct()
    {
        $this->moneda = new MonedaModelo();
        $this->bodega = new BodegaModelo();
        $this->sucursal = new SucursalModelo();
        $this->producto = new ProductoModelo();
    }

    public function inicio()
    {
        $monedas = $this->moneda->getMonedas();
        $bodegas = $this->bodega->getBodegas();
        require_once BASE_DIR . '/app/vista/home.php';
    }

    // Ajax para obtener los sucursales de una bodega
    public function getSucursales()
    {
        if (isset($_GET['idbodega'])) {
            echo json_encode($this->sucursal->getSucursales($_GET['idbodega']));
        } else {
            echo json_encode([
                'error' => 'Error al obtener sucursales'
            ]);
        }
    }

    public function save()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            // Recuperar campos de texto
            $codigo = $_POST['codigo'] ?? '';
            $nombre = $_POST['nombre'] ?? '';
            $bodega = $_POST['bodega'] ?? '';
            $sucursal = $_POST['sucursal'] ?? '';
            $moneda = $_POST['moneda'] ?? '';
            $precio = $_POST['precio'] ?? '';
            $descripcion = $_POST['descripcion'] ?? '';
            $materiales = $_POST['material'] ?? [];

            if ($this->producto->verificarSiExisteProducto($codigo)) {
                echo json_encode([
                    'status' => 'error',
                    'message' => 'El código del producto ya existe'
                ]);
            } else {
                // Guardar los datos en la base de datos
                $rpta = $this->producto->save($codigo, $nombre, $bodega, $sucursal, $moneda, $precio, $descripcion, $materiales);
                if ($rpta === 'success') {
                    echo json_encode([
                        'status' => 'success',
                        'message' => 'Producto guardado correctamente'
                    ]);
                } else {
                    echo json_encode([
                        'status' => 'error',
                        'message' => $rpta
                    ]);
                }
            }
        }
    }
}