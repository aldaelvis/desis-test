<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prueba</title>
    <link rel="stylesheet" href="<?= LOCAL_DIR ?>/resources/css/app.css">
</head>
<body>

<div class="contenedor">
    <form action="" method="post" id="producto-form" data-url="?controller=Producto&action=save">
        <div class="contenedor-head">
            <h1>Formulario de producto</h1>
        </div>
        <div class="contenedor-body">


            <div class="form-contenedor">
                <div class="form-group w-50 p-x-5">
                    <label for="codigo">Código</label>
                    <input type="text" class="form-input" name="codigo" id="codigo">
                </div>
                <div class="form-group w-50 p-x-5">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-input" name="nombre" id="nombre">
                </div>
            </div>

            <div class="form-contenedor">
                <div class=" form-group w-50 p-x-5">
                    <label for="bodega">Bodega</label>
                    <select name="bodega" id="bodega" class="form-input"
                            data-ajax-url="?controller=Producto&action=getSucursales">
                        <option value="" selected></option>
                        <?php foreach ($bodegas as $bodega) : ?>
                            <option value="<?= $bodega['id'] ?>"><?= $bodega['nombre'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group w-50 p-x-5">
                    <label for="sucursal">Sucursal</label>
                    <select name="sucursal"
                            id="sucursal"
                            class="form-input"

                    ></select>
                </div>
            </div>

            <div class="form-contenedor">
                <div class="form-group w-50 p-x-5">
                    <label for="moneda">Moneda</label>
                    <select name="moneda" id="moneda" class="form-input">
                        <option value="" selected></option>
                        <?php foreach ($monedas as $moneda) : ?>
                            <option value="<?= $moneda['id'] ?>"><?= $moneda['nombre'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group w-50 p-x-5">
                    <label for="precio">Precio</label>
                    <input type="text" class="form-input" name="precio" id="precio">
                </div>
            </div>
            <div class="form-contenedor">
                <div class="p-x-5">
                    <span class="title-checkbox">Material del producto</span>
                    <div class="checkbox-group">
                        <label for=""><input type="checkbox" name="material[]" id="material1"
                                             value="plastico">Plastico</label>

                        <label for=""><input type="checkbox" name="material[]" id="material1"
                                             value="metal">Metal</label>

                        <label for=""><input type="checkbox" name="material[]" id="material1"
                                             value="madera">Madera</label>

                        <label for=""><input type="checkbox" name="material[]" id="material1"
                                             value="vidrio">Vidrio</label>
                        <label for=""><input type="checkbox" name="material[]" id="material1"
                                             value="textil">Textil</label>

                    </div>
                </div>
            </div>

            <div class="form-contenedor">
                <div class=" w-100 p-x-5">
                    <label for="descripcion">Descripción</label>
                    <textarea name="descripcion" id="descripcion" class="form-input text-area">

                </textarea>
                </div>
            </div>
        </div>
        <div class="contenedor-footer">
            <button class="btn btn-primary" type="submit">Guardar producto</button>
        </div>
    </form>
</div>

<script src="<?= LOCAL_DIR ?>/resources/js/app.js"></script>
</body>
</html>


