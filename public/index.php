<?php

const BASE_DIR = __DIR__ . '/../';

//Importamos las rutas
require_once '../app/rutas.php';
$baseUrl = getBaseUrl();
define("LOCAL_DIR", $baseUrl);

//verificamos que controlador y accion estan en la URL
$nombreControlador = isset($_GET['controlador']) ? ucfirst($_GET['controlador']) . 'Controlador': 'ProductoControlador';
$funcion = $_GET['action'] ?? 'inicio';

//Cargar el autoloader de clases controladoras
require_once "../app/controlador/$nombreControlador.php";
$controlador = new $nombreControlador();
$controlador->$funcion();


//Verificar la carpeta base ya sea en un servidor o local
function getBaseUrl() {
    // Obtener el protocolo (http o https)
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";

    // Obtener el nombre del servidor (localhost o el nombre de dominio)
    $host = $_SERVER['HTTP_HOST'];

    // Obtener la ruta del directorio del script (ruta relativa desde el root del servidor)
    $scriptName = $_SERVER['SCRIPT_NAME'];
    $path = dirname($scriptName);

    // Construir la URL base
    $baseUrl = $protocol . $host . $path;
    return rtrim($baseUrl, '/'); // Eliminar cualquier barra inclinada final
}




