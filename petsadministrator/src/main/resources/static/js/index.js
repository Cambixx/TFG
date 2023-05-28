function handleKeyPress(event) {
	if (event.keyCode === 13) { 
		event.preventDefault(); 
		document.getElementById("submitButton").click(); 
	}
}

$(function(){
    $(".filtering").on("click", "span", function () {
        var a = $(".gallery").isotope({});
        var e = $(this).attr("data-filter");
        a.isotope({ filter: e });
    });
    $(".filtering").on("click", "span", function () {
        $(this).addClass("active").siblings().removeClass("active");
    });
}

function validarCantidad() {
	 var cantidadInput = document.getElementById('cantidad');
	 var mensajeStock = document.getElementById('mensajeStock');

	 var cantidad = parseInt(cantidadInput.value);
	 var stockDisponible = ${producto.stock}; 

	 if (cantidad > stockDisponible) {
	  mensajeStock.textContent = 'No hay suficiente stock disponible.';
     return false; // Evita enviar el formulario
		   } else {
	  mensajeStock.textContent = ''; // Borra el mensaje de alerta
	 return true; 
		}
	}

) 



