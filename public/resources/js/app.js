document.addEventListener('DOMContentLoaded', () => {
    console.log('DOM fully loaded and parsed');


    peticionAjaxSucursales();
    submitForm();

});

function peticionAjaxSucursales() {
    const bodegaSelect = document.getElementById('bodega');
    const sucursalesSelect = document.getElementById('sucursal');

    bodegaSelect.addEventListener('change', (e) => {
        const idbodega = bodegaSelect.value;
        if (idbodega === '') {
            sucursalesSelect.innerHTML = '';
            return;
        }

        const urlAjax = bodegaSelect.getAttribute("data-ajax-url");

        fetch(urlAjax + "&idbodega=" + idbodega)
            .then(response => response.json())
            .then(data => {

                sucursalesSelect.innerHTML = '';
                const emptyOption = document.createElement("option");
                emptyOption.value = "";
                emptyOption.textContent = "";
                emptyOption.selected = true;
                sucursalesSelect.appendChild(emptyOption);

                data.forEach(sucursal => {
                    const option = document.createElement("option");
                    option.value = sucursal.id;
                    option.textContent = sucursal.nombre;
                    sucursalesSelect.appendChild(option);
                });

            })
    })
}

function submitForm() {
    const form = document.getElementById('producto-form');


    form.addEventListener('submit', (e) => {
        e.preventDefault();
        const url = form.getAttribute("data-url");
        const formData = new FormData(form);

        const codigo = document.getElementById('codigo').value.trim();
        const nombre = document.getElementById('nombre').value;
        const precio = document.getElementById('precio').value;
        const materiales = document.querySelectorAll('input[name="material[]"]:checked');
        const bodega = document.getElementById('bodega').value;
        const sucursal = document.getElementById('sucursal').value;
        const moneda = document.getElementById('moneda').value;
        const descripcion = document.getElementById('descripcion').value.trim();


        const regex = /^[A-Za-z0-9]+$/;
        const regexPrecio = /^[0-9]+(\.[0-9]{1,2})?$/;

        if (codigo === '') {
            alert('El código del producto no puede estar en blanco.');
            return false;
        }

        if (codigo.length < 5 || codigo.length > 15) {
            alert("El código del producto debe tener entre 5 y 15 caracteres.");
            return false;
        }

        if (!regex.test(codigo)) {
            alert("El código del producto debe contener letras y números");
            return false;
        }



        if (nombre.trim() === '') {
            alert("El nombre del producto no puede estar en blanco.");
            return false;
        } else if (nombre.length < 2 || nombre.length > 50) {
            alert("El nombre del producto debe tener entre 2 y 50 caracteres.");
            return false;
        }

        if (bodega === '') {
            alert("Debe seleccionar una bodega.");
            return false;
        }

        if (bodega !== '') {
            if (sucursal === '') {
                alert("Debe seleccionar una sucursal para la bodega seleccionada.");
                return false;
            }
        }

        if (moneda === '') {
            alert("Debe seleccionar una moneda para el producto.");
            return false;
        }

        if (precio.trim() === '') {
            alert("El precio del producto no puede estar en blanco.");
            return false;
        } else if (!regexPrecio.test(precio)) {
            alert("El precio del producto debe ser un número positivo con hasta dos decimales.");
            return false;
        }

        if (materiales.length < 2) {
            alert("Debe seleccionar al menos dos materiales para el producto.");
            return false;
        }

        const longitud = descripcion.length;
        if (descripcion.trim() === '') {
            alert("La descripción del producto no puede estar en blanco.");
            return false;
        } else if (longitud < 10 || longitud > 1000) {
            alert("La descripción del producto debe tener entre 10 y 1000 caracteres.");
            return false;
        }

        //Enviar la información al backend
        fetch(url, {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'error') {
                    alert(data.message);
                } else {
                    alert(data.message);
                    form.reset();
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });
}