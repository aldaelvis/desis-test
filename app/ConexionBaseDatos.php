<?php

// Se usa PDO para poder cambiar a otro motor de base de datos sin complicar el código
// Aplicamos le patron singletón para poder tener una sola instancia de la clase Database
class ConexionBaseDatos
{
    private static $instancia = null;
    private $conexion;

    private function __construct()
    {
        $configuracion = require '../configuraciones/credenciales.php';
        $dsn = "pgsql:host=" . $configuracion['db']['host'] . ";dbname=" . $configuracion['db']['dbname'];
        $this->conexion = new PDO($dsn, $configuracion['db']['user'], $configuracion['db']['password']);
        $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    public static function getInstancia()
    {
        if (!self::$instancia) {
            self::$instancia = new ConexionBaseDatos();
        }
        return self::$instancia;
    }

    public function getConexion()
    {
        return $this->conexion;
    }
}
